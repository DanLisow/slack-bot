package ru.BoshkaLab.repositories;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import ru.BoshkaLab.entities.Employee;
import ru.BoshkaLab.entities.SendingTimetable;

import java.util.Date;
import java.util.List;

public interface SendingTimetableRepository extends JpaRepository<SendingTimetable, Long> {
    List<SendingTimetable> findAllByPostedIsFalseAndTimeLessThanEqual(Date time);
    List<SendingTimetable> findAllByPostedIsTrueAndEmployee(Employee employee, Sort sort);
}
