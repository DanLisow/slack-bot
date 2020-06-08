package ru.BoshkaLab.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.BoshkaLab.entities.Answer;
import ru.BoshkaLab.entities.Employee;
import ru.BoshkaLab.entities.Question;

public interface AnswerRepository extends JpaRepository<Answer, Integer> {
    int countAllByEmployee_Id(int employeeId);
    boolean existsByEmployeeAndQuestion(Employee employee, Question question);
}
