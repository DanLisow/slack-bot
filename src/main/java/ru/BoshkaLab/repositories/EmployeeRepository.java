package ru.BoshkaLab.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.BoshkaLab.entities.Employee;

import java.util.Date;
import java.util.List;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
    boolean existsBySlackId(String slackId);
    Employee findBySlackId(String slackId);
    List<Employee> findAllByTimeOfEnding(Date time);
}
