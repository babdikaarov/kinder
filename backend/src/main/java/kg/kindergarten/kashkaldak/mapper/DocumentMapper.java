package kg.kindergarten.kashkaldak.mapper;


import kg.kindergarten.kashkaldak.dto.response.DocumentResponse;
import kg.kindergarten.kashkaldak.entity.Document;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

@Mapper
public interface DocumentMapper {

    DocumentMapper mapper = Mappers.getMapper(DocumentMapper.class);

    DocumentResponse mapToResponse(Document document);

    List<DocumentResponse> mapToResponseList(List<Document> documents);

}
