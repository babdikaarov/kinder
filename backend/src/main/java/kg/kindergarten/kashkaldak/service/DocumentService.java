package kg.kindergarten.kashkaldak.service;

import kg.kindergarten.kashkaldak.dto.response.DocumentResponse;
import kg.kindergarten.kashkaldak.entity.Document;
import kg.kindergarten.kashkaldak.entity.Form;
import kg.kindergarten.kashkaldak.enums.DocumentTypes;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface DocumentService {

    List<DocumentResponse> findAll();

    DocumentResponse findById(Long id);

    void save(Document document);

    void save(List<Document> list);

    void delete(Long id);

    List<DocumentResponse> findAllByForm(Form form);

    void delete(List<Document> documents);

    List<Document> findAllDocumentsByForm(Form form);

    List<Document> findAllByDocumentTypesAndForm(DocumentTypes documentTypes, Form form);

}
