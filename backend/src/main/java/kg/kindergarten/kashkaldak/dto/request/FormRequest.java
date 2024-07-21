package kg.kindergarten.kashkaldak.dto.request;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.Column;
import jakarta.validation.constraints.*;
import kg.kindergarten.kashkaldak.enums.DocumentTypes;
import kg.kindergarten.kashkaldak.enums.FormSchema;
import kg.kindergarten.kashkaldak.enums.FormStatus;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@Getter
@Setter
@ToString
public class FormRequest {

    @Size(min = 14, max = 14, message = "ИНН состоит из 14 цифр")
    @Pattern(regexp = "\\d+", message = "ИНН должен содержать только цифры")
    @NotNull(message = "ИНН не должно равняться значению null")
    @Column(unique = true, nullable = false)
    @NotBlank
    String inn;

    @NotNull(message = "Имя не должно быть пустым")
    @NotBlank
    String firstName;

    @NotNull(message = "Фамилия не должно быть пустым")
    @NotBlank
    String lastName;

    @NotNull(message = "Документы должны быть загруженными")
    Map<DocumentTypes, List<MultipartFile>> docs;

    @NotNull(message = "Надо выбрать тип формы")
    FormSchema formSchema;

    @NotNull(message = "Номер телефона не должно быть пустым")
    @NotBlank
    String phoneNumber;

    @Email(message = "Должно иметь формат адреса электронной почты")
    @NotNull
    @NotBlank
    String email;

    @JsonIgnore
    FormStatus status;


    boolean isAdmin;

}
