package kg.kindergarten.kashkaldak.service;

import kg.kindergarten.kashkaldak.entity.Document;
import kg.kindergarten.kashkaldak.entity.Form;
import kg.kindergarten.kashkaldak.enums.DocumentTypes;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Path;
import java.util.List;
import java.util.Map;

@Service
public interface FileManipulationService {

    List<Document> saveFiles(Map<DocumentTypes, List<MultipartFile>> imageFiles, Form form);

    void deleteDirectory(Path path);
}
