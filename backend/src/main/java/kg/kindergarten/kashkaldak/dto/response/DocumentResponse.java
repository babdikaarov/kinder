package kg.kindergarten.kashkaldak.dto.response;

import kg.kindergarten.kashkaldak.enums.DocumentTypes;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DocumentResponse {

    Long id;

    DocumentTypes documentTypes;

    String name;

    String path;

    String url;

    public DocumentResponse(Long id, DocumentTypes documentTypes, String name, String path, String url) {
        this.id = id;
        this.documentTypes = documentTypes;
        this.name = name;
        this.path = path;
        this.url = url;
    }
}
