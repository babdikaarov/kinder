package kg.kindergarten.kashkaldak.entity;

import jakarta.persistence.*;
import kg.kindergarten.kashkaldak.enums.DocumentTypes;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Table
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Document {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @Enumerated(value = EnumType.STRING)
    DocumentTypes documentTypes;

    String name;

    String path;

    String url;

    @ManyToOne
    @JoinColumn(name = "form_id")
    Form form;

}
