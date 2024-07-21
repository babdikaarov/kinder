package kg.kindergarten.kashkaldak.repository;

import kg.kindergarten.kashkaldak.entity.Document;
import kg.kindergarten.kashkaldak.entity.Form;
import kg.kindergarten.kashkaldak.enums.DocumentTypes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DocumentRepository extends JpaRepository<Document, Long> {

    List<Document> findAllBy();

    List<Document> findAllByForm(Form form);

    @Query(value = "select d from Document d where d.documentTypes = :documentTypes and d.form = :form")
    List<Document> findAllByDocumentTypesAndForm(@Param("documentTypes") DocumentTypes documentTypes, @Param("form") Form form);

}
