package kg.kindergarten.kashkaldak.service.Impl;

import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.client.googleapis.media.MediaHttpDownloader;
import com.google.api.client.http.FileContent;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.DriveScopes;
import com.google.auth.http.HttpCredentialsAdapter;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.auth.oauth2.ServiceAccountCredentials;
import kg.kindergarten.kashkaldak.entity.Document;
import kg.kindergarten.kashkaldak.entity.Form;
import kg.kindergarten.kashkaldak.enums.DocumentTypes;
import kg.kindergarten.kashkaldak.exceptions.GoogleDriveAuthorizationException;
import kg.kindergarten.kashkaldak.exceptions.GoogleDriveExportException;
import kg.kindergarten.kashkaldak.exceptions.GoogleDriveUploadException;
import kg.kindergarten.kashkaldak.service.DocumentService;
import kg.kindergarten.kashkaldak.service.GoogleDriveService;
import kg.kindergarten.kashkaldak.service.MakingDirectoryService;
import lombok.RequiredArgsConstructor;
import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.nio.file.Paths;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.CompletableFuture;

@Service
@RequiredArgsConstructor
public class GoogleDriveServiceImpl implements GoogleDriveService {
    private static final String APPLICATION_NAME = "Google Drive";

    private static final JsonFactory JSON_FACTORY = GsonFactory.getDefaultInstance();

    private static final List<String> SCOPES = Collections.singletonList(DriveScopes.DRIVE);

    private static final String SERVICE_ACCOUNT_KEY_PATH = Paths.get("/app", "service-account-key.json").toString();

    private final DocumentService documentService;

    @Override
    public String uploadBasic(Map<DocumentTypes, List<MultipartFile>> files, File localFile) throws IOException, GeneralSecurityException {

        Drive service;
        try {
            service = getDrive();
        } catch (IOException e) {
            System.err.println("Ошибка при инициализации Google Drive: " + e.getMessage());
            throw new RuntimeException("Не удалось инициализировать Google Drive", e);
        }

        // Upload file photo.jpg on drive.
        com.google.api.services.drive.model.File fileMetadata = new com.google.api.services.drive.model.File();
        fileMetadata.setName("document.docx");
        fileMetadata.setMimeType("application/vnd.google-apps.document");
        fileMetadata.setParents(Collections.singletonList("1oOXILIdBFzCQgb_7zoiYMjh5mXu1b4qd"));


        // Specify media type and file-path for file.
        FileContent mediaContent = new FileContent("application/vnd.openxmlformats-officedocument.wordprocessingml.document", localFile);
        try {
            Drive.Files.Create request = service.files().create(fileMetadata, mediaContent)
                    .setFields("id")
                    .setUploadType("resumable");
            request.getMediaHttpUploader().setDirectUploadEnabled(false);

            com.google.api.services.drive.model.File file = request.execute();

            System.out.println("File ID: " + file.getId());
            return file.getId();
        } catch (GoogleJsonResponseException e) {
            System.err.println("Ошибка при загрузке файла: " + e.getDetails());
            throw new GoogleDriveUploadException("Ошибка при загрузке файла на Google Drive", e);
        } catch (IOException e) {
            System.err.println("IO ошибка при загрузке файла на Google Drive: " + e.getMessage());
            e.printStackTrace();
            throw new IOException("IO ошибка при загрузке файла", e);
        } catch (Exception e) {
            System.err.println("Неизвестная ошибка при загрузке файла: " + e.getMessage());
            e.printStackTrace();  // Логируем стек-трейс для диагностики
            throw new GoogleDriveUploadException("Неизвестная ошибка при загрузке файла", e);
        }

    }

    @Override
    public File saveFile(Map<DocumentTypes, List<MultipartFile>> files, DocumentTypes documentTypes, int i) throws IOException {

        MultipartFile file1 = files.get(documentTypes).get(i);
        String localFilePath = System.getProperty("user.dir") + File.separator + "uploads" + File.separator + UUID.randomUUID() + file1.getOriginalFilename();
        File localFile = new File(localFilePath);

        // Проверяем и создаем директорию, если необходимо
        if (!localFile.getParentFile().exists() && !localFile.getParentFile().mkdirs()) {
            throw new IOException("Не удалось создать директорию для сохранения файла");
        }

        try {
            file1.transferTo(localFile);
            System.out.println("Файл сохранен: " + localFile.getAbsolutePath());
        } catch (IOException e) {
            System.err.println("Ошибка при сохранении файла локально: " + e.getMessage());
            throw new IOException("Не удалось сохранить файл локально", e);
        }

        // Проверка готовности файла
        if (!localFile.exists() || !localFile.canRead() || localFile.length() == 0) {
            throw new IOException("Файл не готов к загрузке: " + localFilePath);
        }

        System.out.println("Файл готов к загрузке. Размер файла: " + localFile.length() + " байт.");
        return localFile;
    }

    @Override
    public void deleteFile(String fileId) throws IOException, GeneralSecurityException {
        Drive service = getDrive();
        try {
            service.files().delete(fileId).execute();
            System.out.println("Файл с идентификатором " + fileId + " был успешно удален.");
        } catch (GoogleJsonResponseException e) {
            System.err.println("Ошибка при удалении файла: " + e.getDetails());
            throw new GoogleDriveUploadException("Ошибка при удалении файла на Google Drive", e);
        }
    }

    @Override
    public ByteArrayOutputStream exportPdf(String realFileId) throws GeneralSecurityException, IOException {
        Drive service = getDrive();
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        try {
            Drive.Files.Export request = service.files().export(realFileId, "application/pdf");
            MediaHttpDownloader downloader = request.getMediaHttpDownloader();
            downloader.setDirectDownloadEnabled(false); // Включение возобновляемого скачивания
            request.executeMediaAndDownloadTo(outputStream);
            return outputStream;
        } catch (GoogleJsonResponseException e) {
            System.err.println("Unable to export file: " + e.getDetails());
            throw e;
        }
    }

    @Override
    // Обновление метода getDrive для лучшей обработки исключений
    public Drive getDrive() throws IOException, GeneralSecurityException {
        NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();

        GoogleCredentials credentials = ServiceAccountCredentials
                .fromStream(new FileInputStream(SERVICE_ACCOUNT_KEY_PATH))
                .createScoped(SCOPES);
        // Построение клиента API
        return new Drive.Builder(HTTP_TRANSPORT, JSON_FACTORY, new HttpCredentialsAdapter(credentials))
                .setApplicationName(APPLICATION_NAME)
                .build();
    }

    // Метод для загрузки файла с обработкой исключений
    @Override
    public CompletableFuture<String> uploadAsync(Map<DocumentTypes, List<MultipartFile>> files, File file) {
        return CompletableFuture.supplyAsync(() -> {
            try {
                return uploadBasic(files, file);
            } catch (IOException e) {
                throw new GoogleDriveUploadException("Ошибка при загрузке файла: IO проблема", e);
            } catch (GeneralSecurityException e) {
                throw new GoogleDriveAuthorizationException("Ошибка авторизации при загрузке файла", e);
            } catch (Exception e) {
                System.out.println(e.getMessage());
                e.printStackTrace();
                throw new GoogleDriveUploadException("Неизвестная ошибка при загрузке файла", e);
            }
        });
    }

    // Метод для экспорта файла в PDF с обработкой исключений
    @Override
    public CompletableFuture<ByteArrayOutputStream> exportPdfAsync(String fileId) {
        return CompletableFuture.supplyAsync(() -> {
            try {
                return exportPdf(fileId);
            } catch (IOException e) {
                throw new GoogleDriveExportException("Ошибка при экспорте файла: IO проблема", e);
            } catch (GeneralSecurityException e) {
                throw new GoogleDriveAuthorizationException("Ошибка авторизации при экспорте файла", e);
            } catch (Exception e) {
                throw new GoogleDriveExportException("Неизвестная ошибка при экспорте файла", e);
            }
        });
    }

    // Пример использования асинхронных методов
    @Override
    public void convertDocToPdfAsync(Map<DocumentTypes, List<MultipartFile>> files, Form form) throws IOException {
        for (DocumentTypes documentTypes : files.keySet()) {
            for (int i = 0; i < files.get(documentTypes).size(); i++) {
                File file = saveFile(files, documentTypes, i);
                int index = i;
                uploadAsync(files, file).thenAcceptAsync(fileId -> {
                    exportPdfAsync(fileId).thenAcceptAsync(pdfStream -> {
                        String absolutePath = MakingDirectoryService.makingDirectory(form.getInn(), documentTypes, index);
                        savePdfAsync(pdfStream, absolutePath).
                                thenRun(() -> {
                                    System.out.println("Процесс завершен: PDF файл успешно сохранен.");
                                    Document document = new Document();
                                    document.setDocumentTypes(documentTypes);
                                    document.setPath(absolutePath);
                                    document.setName(documentTypes.name().toLowerCase() + "_" + index + ".pdf");
                                    document.setForm(form);
                                    documentService.save(document);
                                    try {
                                        FileUtils.forceDelete(file);
                                        deleteFile(fileId); // Удаление файла после успешного сохранения PDF
                                    } catch (IOException | GeneralSecurityException e) {
                                        System.err.println("Ошибка при удалении файла: " + e.getMessage());
                                    }
                                }).exceptionally(ex -> {
                                    System.err.println("Ошибка при сохранении PDF файла: " + ex.getMessage());
                                    return null;
                                });
                    }).exceptionally(ex -> {
                        System.err.println("Ошибка при экспорте PDF: " + ex.getMessage());
                        return null;
                    });
                }).exceptionally(ex -> {
                    System.err.println("Ошибка при загрузке файла: " + ex.getMessage());
                    return null;
                });
            }
        }
    }

    @Override
    public CompletableFuture<Void> savePdfAsync(ByteArrayOutputStream pdfStream, String filename) {
        return CompletableFuture.runAsync(() -> {
            try (OutputStream outputStream = new FileOutputStream(filename)) {
                pdfStream.writeTo(outputStream);
                System.out.println("PDF успешно сохранен: " + filename);
            } catch (Exception e) {
                throw new RuntimeException("Ошибка при сохранении PDF", e);
            }
        });
    }
}
