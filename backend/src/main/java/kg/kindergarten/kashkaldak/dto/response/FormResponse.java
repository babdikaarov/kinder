package kg.kindergarten.kashkaldak.dto.response;

import kg.kindergarten.kashkaldak.enums.FormSchema;
import kg.kindergarten.kashkaldak.enums.FormStatus;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
public class FormResponse {

    Long id;

    String inn;

    String firstName;

    String lastName;

    List<DocumentResponse> docs;

    String phoneNumber;

    String email;

    LocalDateTime createdAt;

    FormSchema formSchema;

    FormStatus status;


    public FormResponse(Long id, String inn, String firstName, String lastName, String phoneNumber, String email, LocalDateTime createdAt, FormSchema formSchema, FormStatus status) {
        this.id = id;
        this.inn = inn;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.createdAt = createdAt;
        this.formSchema = formSchema;
        this.status = status;
    }

}
