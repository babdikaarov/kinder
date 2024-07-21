package kg.kindergarten.kashkaldak.service.Impl;

import kg.kindergarten.kashkaldak.entity.Document;
import kg.kindergarten.kashkaldak.entity.Form;
import kg.kindergarten.kashkaldak.enums.DocumentTypes;
import kg.kindergarten.kashkaldak.service.FileManipulationService;
import kg.kindergarten.kashkaldak.service.MakingDirectoryService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class FileManipulationServiceImpl implements FileManipulationService {


    @Override
    public List<Document> saveFiles(Map<DocumentTypes, List<MultipartFile>> imageFiles, Form form) {
        List<Document> list = new ArrayList<>();

        for (DocumentTypes documentTypes : imageFiles.keySet()) {

            for (int i = 0; i < imageFiles.get(documentTypes).size(); i++) {
                MultipartFile file = imageFiles.get(documentTypes).get(i);
                String path = MakingDirectoryService.makingDirectory(form.getInn(), documentTypes, i);
                File filePath = new File(path);
                try {
                    file.transferTo(filePath);
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
                list.add(Document.builder()
                        .path(path)
                        .form(form)
                        .name(documentTypes.name().toLowerCase() + "_" + i + ".pdf")
                        .documentTypes(documentTypes)
                        .build());
            }
        }
        return list;
    }

    @Override
    public void deleteDirectory(Path path){
        if (Files.exists(path)) {
            try {
                Files.walkFileTree(path, new SimpleFileVisitor<>() {
                    @Override
                    public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
                        Files.delete(file);
                        return FileVisitResult.CONTINUE;
                    }

                    @Override
                    public FileVisitResult postVisitDirectory(Path dir, IOException exc) throws IOException {
                        Files.delete(dir);
                        return FileVisitResult.CONTINUE;
                    }
                });
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            System.out.println("Directory does not exist.");
        }
    }

}
