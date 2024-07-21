package kg.kindergarten.kashkaldak.entity;


import jakarta.persistence.*;
import kg.kindergarten.kashkaldak.enums.FormSchema;
import kg.kindergarten.kashkaldak.enums.FormStatus;
import lombok.AccessLevel;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.LocalDateTime;
import java.util.List;

@Table
@Entity
@NoArgsConstructor
@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Form {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @Column(nullable = false, unique = true, length = 14)
    String inn;

    String firstName;

    String lastName;

    String phoneNumber;

    String email;

    @OneToMany(mappedBy = "form", cascade = CascadeType.REFRESH)
    @OnDelete(action = OnDeleteAction.CASCADE)
    List<Document> documents;

    LocalDateTime createdAt = LocalDateTime.now();

    @Enumerated(EnumType.STRING)
    FormSchema formSchema;

    @Enumerated(EnumType.STRING)
    FormStatus status = FormStatus.PENDING;

    public Form(Long id, String inn, String firstName, String lastName, String phoneNumber, String email, LocalDateTime createdAt, FormSchema formSchema, FormStatus status) {
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
