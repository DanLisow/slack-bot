package ru.BoshkaLab.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.BoshkaLab.entities.UserType;

public interface UserTypeRepository extends JpaRepository<UserType, Long> {
    boolean existsByName(String name);
    UserType findByName(String name);
}
