package kg.kindergarten.kashkaldak.service.Impl;

import kg.kindergarten.kashkaldak.dto.request.FormRequest;
import kg.kindergarten.kashkaldak.dto.response.FormResponse;
import kg.kindergarten.kashkaldak.entity.Document;
import kg.kindergarten.kashkaldak.entity.Form;
import kg.kindergarten.kashkaldak.enums.DocumentTypes;
import kg.kindergarten.kashkaldak.enums.FormStatus;
import kg.kindergarten.kashkaldak.exceptions.AlreadyExistsException;
import kg.kindergarten.kashkaldak.exceptions.BadRequestException;
import kg.kindergarten.kashkaldak.exceptions.NotFoundException;
import kg.kindergarten.kashkaldak.exceptions.UnsupportedFileTypeException;
import kg.kindergarten.kashkaldak.mapper.FormMapper;
import kg.kindergarten.kashkaldak.repository.FormRepository;
import kg.kindergarten.kashkaldak.service.*;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.LocalDateTime;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.logging.Level;
import java.util.logging.Logger;

@Service
@RequiredArgsConstructor
@Transactional
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE)
@EnableScheduling
public class FormServiceImpl implements FormService {

    final GoogleDriveService googleDriveService;

    final ItextPdfConverterService converterService;

    final DocumentService documentService;

    final FormRepository formRepository;

    final FileManipulationService fileManipulationService;

    static final List<String> ALLOWED_CONTENT_TYPES = Arrays.asList(
            "image/jpeg", "image/png",
            "application/pdf", "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
    );

    static final Logger logger = Logger.getLogger(FormServiceImpl.class.getName());

    @Override
    public Form findById(Long id) {
        Form form = formRepository.findById(id);
        if (form == null) {
            throw new NotFoundException("Form with ID: %d".formatted(id) + " not found");
        }

        return form;
    }

    @Override
    public Form findByInn(String inn) {
        Form form = formRepository.findByInn(inn);
        if (form == null) {
            throw new NotFoundException("Form with INN: %s".formatted(inn) + " not found");
        }
        return form;
    }

    @Override
    public FormResponse getById(Long id) {
        Form form = findById(id);
        FormResponse formResponse = FormMapper.mapper.mapToResponse(form);
        formResponse.setDocs(documentService.findAllByForm(form));
        return formResponse;
    }

    @Override
    public void fileMimeTypeChecking(Map<DocumentTypes, List<MultipartFile>> docs) {
        for (DocumentTypes docList : docs.keySet()) {
            for (MultipartFile file : docs.get(docList)) {
                if (file.getContentType() == null) {
                    throw new BadRequestException("%s can't be null !".formatted(docList));
                }
                if (!ALLOWED_CONTENT_TYPES.contains(file.getContentType())) {
                    throw new UnsupportedFileTypeException("Unsupported media type for file: %s".formatted(file.getContentType()));
                }
            }
        }
    }

    @Override
    public FormResponse getByInn(String inn) {
        Form form = findByInn(inn);
        return FormMapper.mapper.mapToResponse(form);
    }

    @Override
    public void delete(Long id) {
        Form form = formRepository.findById(id);
        fileManipulationService.deleteDirectory(Path.of(System.getProperty("user.dir") + File.separator + "java_docs" + File.separator + form.getInn() + File.separator));
        formRepository.delete(form);
    }

    @Override
    public void updatePartialForm(String inn, FormRequest formRequest) {
        Form form = findByInn(inn);

        if (formRequest.getFirstName() != null) {
            form.setFirstName(formRequest.getFirstName());
        }

        if (formRequest.getLastName() != null) {
            form.setLastName(formRequest.getLastName());
        }

        if (formRequest.getPhoneNumber() != null) {
            form.setPhoneNumber(formRequest.getPhoneNumber());
        }

        if (formRequest.getEmail() != null) {
            form.setEmail(formRequest.getEmail());
        }

        if (formRequest.getFormSchema() != null) {
            form.setFormSchema(formRequest.getFormSchema());
        }

        if (formRequest.getStatus() != null && formRequest.isAdmin()) {
            form.setStatus(formRequest.getStatus());
        } else {
            form.setStatus(FormStatus.PENDING);
        }

        if (formRequest.getDocs() != null && !formRequest.getDocs().isEmpty()) {
            fileMimeTypeChecking(formRequest.getDocs());
            processDocuments(formRequest.getDocs(), form);
        }

        form.setCreatedAt(LocalDateTime.now());

        formRepository.save(form);
    }

    private void processDocuments(Map<DocumentTypes, List<MultipartFile>> docs, Form form) {
        try {
            List<Document> documents = new ArrayList<>();
            for (DocumentTypes file : docs.keySet()) {
                documents.addAll(documentService.findAllByDocumentTypesAndForm(file, form));
                String extension = docs.get(file).get(0).getContentType();
                Map<DocumentTypes, List<MultipartFile>> map = Map.of(file, docs.get(file));
                if (Objects.requireNonNull(extension).startsWith("image")) {
                    processImageFilesAsync(map, form, file);
                } else if (extension.equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document")) {
                    googleDriveService.convertDocToPdfAsync(map, form);
                } else if (extension.equals("application/pdf")) {
                    documentService.save(fileManipulationService.saveFiles(map, form));
                }
            }
            documentService.delete(documents);
        } catch (Exception e) {
            throw new RuntimeException("Ошибка при обработке документов: " + e.getMessage(), e);
        }
    }


    @Override
    public void save(FormRequest formRequest) {
        Form form = FormMapper.mapper.mapToEntity(formRequest);
        try {
            formRepository.save(form);
        } catch (Exception e) {
            throw new AlreadyExistsException("Form with this INN: %s".formatted(formRequest.getInn()) + " already exists");
        }

        try {
            for (DocumentTypes file : formRequest.getDocs().keySet()) {
                String extension = formRequest.getDocs().get(file).get(0).getContentType();
                Map<DocumentTypes, List<MultipartFile>> map = new HashMap<>() {{
                    put(file, formRequest.getDocs().get(file));
                }};
                if (Objects.requireNonNull(extension).startsWith("image")) {
                    processImageFilesAsync(map, form, file);
                } else if (extension.equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document")) {
                    googleDriveService.convertDocToPdfAsync(map, form);
                } else if (extension.equals("application/pdf")) {
                    documentService.save(fileManipulationService.saveFiles(map, form));
                }

            }
        } catch (Exception e) {
            delete(form.getId());
            throw new RuntimeException(e.getMessage());
        }

    }

    @Async("taskExecutor")
    public void processImageFilesAsync(Map<DocumentTypes, List<MultipartFile>> map, Form form, DocumentTypes documentType) {
        CompletableFuture.runAsync(() -> {
            try {
                List<File> tempFiles = saveFilesToTempDirectory(map.get(documentType));
                converterService.convertImageToPdfAsync(Map.of(documentType, tempFiles), form).thenAccept(documentService::save).exceptionally(ex -> {
                    log.error("Ошибка при конвертации изображений в PDF: ", ex);
                    throw new RuntimeException(ex);
                });
            } catch (IOException e) {
                log.error("Ошибка при сохранении файлов во временную директорию: ", e);
                throw new RuntimeException(e);
            }
        });
    }

    private List<File> saveFilesToTempDirectory(List<MultipartFile> files) throws IOException {
        List<File> tempFiles = new ArrayList<>();
        for (MultipartFile file : files) {
            Path tempDir = Files.createTempDirectory("upload");
            File tempFile = tempDir.resolve(UUID.randomUUID() + "_" + file.getOriginalFilename()).toFile();
            file.transferTo(tempFile);
            tempFiles.add(tempFile);
        }
        return tempFiles;
    }


    @Override
    public List<FormResponse> findAll() {
        return FormMapper.mapper.mapToResponseList(formRepository.findAll());
    }


    @Scheduled(cron = "0 0 */1 * * *")
    public void updateExpiredForms() {
        // Получаем текущую дату и время
        LocalDateTime now = LocalDateTime.now();
        logger.log(Level.INFO, "Начало обновления статуса форм: " + now);

        // Получаем список всех форм из базы данных
        List<Form> forms = formRepository.findAllByStatus(FormStatus.PENDING);

        // Проверяем каждую форму и обновляем статус, если форма просрочена
        for (Form form : forms) {
            if (isExpired(form, now)) {
                form.setStatus(FormStatus.DELETED);
                formRepository.save(form); // Сохраняем обновленную форму в базе данных
                logger.log(Level.INFO, "Статус формы обновлен: " + form.getId());

            }
        }
        logger.log(Level.INFO, "Обновление статуса форм завершено");

    }

    private boolean isExpired(Form form, LocalDateTime now) {
        return form.getCreatedAt().plusDays(30).isBefore(now);
    }
}
