package kg.kindergarten.kashkaldak.service;

import kg.kindergarten.kashkaldak.enums.DocumentTypes;
import org.springframework.stereotype.Service;

import java.io.File;

@Service
public interface MakingDirectoryService {


    static String makingDirectory(String inn, DocumentTypes documentTypes) {
        return path(inn).getAbsolutePath() + File.separator + documentTypes.name().toLowerCase() + ".pdf";
    }

    static File path(String inn) {
        File uploadDir = new File(System.getProperty("user.dir") + File.separator + "java_docs" + File.separator + inn + File.separator);
        if (!uploadDir.exists()) {
            try {
                boolean created = uploadDir.mkdirs();
                if (!created) {
                    throw new RuntimeException("An error occurred while creating directory: " + uploadDir.getAbsolutePath());
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        return uploadDir;
    }

    static String makingDirectory(String inn, DocumentTypes documentTypes, int i) {
        return path(inn).getAbsolutePath() + File.separator + documentTypes.name().toLowerCase() + "_" + i + ".pdf";
    }

}
