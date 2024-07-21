package kg.kindergarten.kashkaldak.service.Impl;

import kg.kindergarten.kashkaldak.dto.response.DocumentResponse;
import kg.kindergarten.kashkaldak.entity.Document;
import kg.kindergarten.kashkaldak.entity.Form;
import kg.kindergarten.kashkaldak.enums.DocumentTypes;
import kg.kindergarten.kashkaldak.exceptions.NotFoundException;
import kg.kindergarten.kashkaldak.mapper.DocumentMapper;
import kg.kindergarten.kashkaldak.repository.DocumentRepository;
import kg.kindergarten.kashkaldak.service.DocumentService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE)
public class DocumentServiceImpl implements DocumentService {

    final DocumentRepository documentRepository;

    @Override
    public List<DocumentResponse> findAll() {
        return DocumentMapper.mapper.mapToResponseList(documentRepository.findAll());
    }

    @Override
    public DocumentResponse findById(Long id) {
        Document document = documentRepository.findById(id).orElseThrow(() -> new NotFoundException("Document with ID: %d".formatted(id) + " not found"));
        return DocumentMapper.mapper.mapToResponse(document);
    }

    @Override
    public void save(Document document) {
        documentRepository.saveAndFlush(document);
        document.setUrl("/api/docs/view/%d".formatted(document.getId()));
        documentRepository.save(document);
    }

    @Override
    public void save(List<Document> list) {
        documentRepository.saveAllAndFlush(list);
        for (Document document : list) {
            document.setUrl("/api/docs/view/%d".formatted(document.getId()));
        }
        documentRepository.saveAll(list);
    }

    @Override
    public void delete(Long id) {
        Document document = documentRepository.findById(id).orElseThrow(() -> new NotFoundException("Document with ID: " + id + " not found !"));
        File file = new File(document.getPath());
        if (file.exists())
            try {
                FileUtils.forceDelete(file);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        documentRepository.deleteById(id);
    }

    @Override
    public void delete(List<Document> documents) {
        for (Document document : documents) {
            File file = new File(document.getPath());
            if (file.exists())
                try {
                    FileUtils.forceDelete(file);
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
        }
        documentRepository.deleteAll(documents);
    }

    @Override
    public List<DocumentResponse> findAllByForm(Form form) {
        return documentRepository.findAllByForm(form).stream().map(DocumentMapper.mapper::mapToResponse).collect(Collectors.toList());
    }

    @Override
    public List<Document> findAllDocumentsByForm(Form form) {
        return documentRepository.findAllByForm(form);
    }

    @Override
    public List<Document> findAllByDocumentTypesAndForm(DocumentTypes documentTypes, Form form) {
        return documentRepository.findAllByDocumentTypesAndForm(documentTypes, form);
    }


}
