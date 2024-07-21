package kg.kindergarten.kashkaldak.service;

import kg.kindergarten.kashkaldak.dto.request.FormRequest;
import kg.kindergarten.kashkaldak.dto.response.FormResponse;
import kg.kindergarten.kashkaldak.entity.Form;
import kg.kindergarten.kashkaldak.enums.DocumentTypes;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@Service
public interface FormService {

    void updatePartialForm(String inn, FormRequest formRequest);

    Form findById(Long id);

    Form findByInn(String inn);

    FormResponse getByInn(String inn);

    void delete(Long id);

    void save(FormRequest formRequest);

    List<FormResponse> findAll();

    FormResponse getById(Long id);

    void fileMimeTypeChecking(Map<DocumentTypes,List<MultipartFile>> docs);
//    FormResponse

}
