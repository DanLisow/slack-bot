package ru.BoshkaLab.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.BoshkaLab.entities.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmailAndPassword(String email, String password);
    boolean existsByLogin(String login);
    boolean existsByEmail(String email);
    boolean existsByLoginAndPassword(String login, String password);
    boolean existsByEmailAndPassword(String email, String password);
}
