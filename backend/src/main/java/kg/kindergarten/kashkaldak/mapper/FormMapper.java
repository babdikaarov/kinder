package kg.kindergarten.kashkaldak.mapper;

import kg.kindergarten.kashkaldak.dto.request.FormRequest;
import kg.kindergarten.kashkaldak.dto.response.FormResponse;
import kg.kindergarten.kashkaldak.entity.Form;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

import java.util.List;

@Mapper
public interface FormMapper {

    FormMapper mapper = Mappers.getMapper(FormMapper.class);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "createdAt", ignore = true)
    @Mapping(target = "documents", ignore = true)
    @Mapping(target = "status", ignore = true)
    Form mapToEntity(FormRequest request);

    FormResponse mapToResponse(Form form);

    List<FormResponse> mapToResponseList(List<Form> list);
}
