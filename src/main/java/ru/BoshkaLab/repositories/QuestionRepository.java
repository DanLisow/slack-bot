package ru.BoshkaLab.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.BoshkaLab.entities.Question;

public interface QuestionRepository extends JpaRepository<Question, Long> {
    Question findByText(String text);
}
