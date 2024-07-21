package kg.kindergarten.kashkaldak.service;

import com.google.api.services.drive.Drive;
import kg.kindergarten.kashkaldak.entity.Form;
import kg.kindergarten.kashkaldak.enums.DocumentTypes;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;

@Service
public interface GoogleDriveService {

    CompletableFuture<Void> savePdfAsync(ByteArrayOutputStream pdfStream, String filename);

    String uploadBasic(Map<DocumentTypes, List<MultipartFile>> files, File localFile) throws IOException, GeneralSecurityException;

    File saveFile(Map<DocumentTypes, List<MultipartFile>> files,DocumentTypes documentTypes,int i) throws IOException;

    ByteArrayOutputStream exportPdf(String realFileId) throws GeneralSecurityException, IOException;

    Drive getDrive() throws IOException, GeneralSecurityException;

    void deleteFile(String fileId) throws IOException, GeneralSecurityException;

    CompletableFuture<String> uploadAsync(Map<DocumentTypes, List<MultipartFile>> files, File file);

    CompletableFuture<ByteArrayOutputStream> exportPdfAsync(String fileId);

    void convertDocToPdfAsync(Map<DocumentTypes, List<MultipartFile>> files, Form form) throws IOException;
}
