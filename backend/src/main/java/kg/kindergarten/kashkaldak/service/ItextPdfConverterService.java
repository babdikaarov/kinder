package kg.kindergarten.kashkaldak.service;

import kg.kindergarten.kashkaldak.entity.Document;
import kg.kindergarten.kashkaldak.entity.Form;
import kg.kindergarten.kashkaldak.enums.DocumentTypes;
import org.springframework.scheduling.annotation.Async;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;

public interface ItextPdfConverterService {

    List<Document> convertImageToPdf(Map<DocumentTypes, List<File>> files, Form form) throws IOException;

    @Async
    CompletableFuture<List<Document>> convertImageToPdfAsync(Map<DocumentTypes, List<File>> imageFiles, Form form);
}
