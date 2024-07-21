package kg.kindergarten.kashkaldak.repository;

import kg.kindergarten.kashkaldak.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    boolean existsByUsername(String username);

    Optional<User> getUserByUsername(String username);



}
