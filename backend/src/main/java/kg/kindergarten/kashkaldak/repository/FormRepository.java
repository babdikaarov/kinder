package kg.kindergarten.kashkaldak.repository;

import kg.kindergarten.kashkaldak.entity.Form;
import kg.kindergarten.kashkaldak.enums.FormStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FormRepository extends JpaRepository<Form,String> {


    Form findById(Long id);

    Form findByInn(String inn);

    List<Form> findAllByStatus(FormStatus status);

}
