package kg.kindergarten.kashkaldak.controller;

import io.swagger.v3.oas.annotations.tags.Tag;
import kg.kindergarten.kashkaldak.dto.response.DocumentResponse;
import kg.kindergarten.kashkaldak.entity.Form;
import kg.kindergarten.kashkaldak.service.DocumentService;
import kg.kindergarten.kashkaldak.service.FormService;
import kg.kindergarten.kashkaldak.service.ZippingFilesService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.FileUtils;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.zip.ZipOutputStream;

@RestController
@RequestMapping("/api/docs")
@RequiredArgsConstructor
@Tag(name = "Documents")
public class DocumentsController {

    private final DocumentService documentService;

    private final FormService formService;

    @GetMapping
    @PreAuthorize("hasAnyAuthority('ADMIN')")
    public List<DocumentResponse> getDocuments() {
        return documentService.findAll();
    }

    @GetMapping("/{documentId}")
    @PreAuthorize("hasAnyAuthority('ADMIN')")
    public DocumentResponse getDocument(@PathVariable("documentId") Long documentId) {
        return documentService.findById(documentId);
    }

    @GetMapping("/form/{formId}")
    @PreAuthorize("hasAnyAuthority('ADMIN')")
    public List<DocumentResponse> getDocumentOfForm(@PathVariable("formId") Long formId){
        return documentService.findAllByForm(formService.findById(formId));
    }

    @DeleteMapping("/{documentId}")
    @PreAuthorize("hasAnyAuthority('ADMIN')")
    public ResponseEntity<?> deleteDocument(@PathVariable("documentId") Long documentId) {
        documentService.delete(documentId);
        return ResponseEntity.ok("Document with ID: " + documentId + " deleted !");
    }

    @GetMapping("/view/{documentId}")
    @PreAuthorize("hasAnyAuthority('ADMIN')")
    public ResponseEntity<ByteArrayResource> viewDocument(@PathVariable("documentId") Long documentId) throws IOException {

        DocumentResponse document = documentService.findById(documentId);

        File file = new File(document.getPath());
        ByteArrayResource resource = new ByteArrayResource(FileUtils.readFileToByteArray(file));

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_PDF);
        headers.setContentLength(resource.contentLength());

        return new ResponseEntity<>(resource, headers, HttpStatus.OK);
    }

    @PreAuthorize("hasAnyAuthority('ADMIN')")
    @GetMapping("/downloadAll/{formId}")
    public ResponseEntity<ByteArrayResource> downloadAllDocumentsOfForm(@PathVariable("formId") Long formId) throws IOException {
        Form form = formService.findById(formId);
        List<DocumentResponse> documentList = documentService.findAllByForm(form);
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        ZipOutputStream zipOutputStream = new ZipOutputStream(byteArrayOutputStream);

        for (DocumentResponse documentResponse : documentList) {
            File file = new File(documentResponse.getPath());
            ZippingFilesService.addToZip(zipOutputStream, file, documentResponse.getName());
        }

        zipOutputStream.close();

        ByteArrayResource resource = new ByteArrayResource(byteArrayOutputStream.toByteArray());

        HttpHeaders headers = new HttpHeaders();

        headers.add("Content-Disposition", "attachment; filename=%s.zip".formatted(form.getInn()));

        return ResponseEntity
                .ok()
                .headers(headers)
                .contentLength(resource.contentLength())
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(resource);

    }


}
