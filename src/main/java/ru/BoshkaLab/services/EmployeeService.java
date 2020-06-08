package ru.BoshkaLab.services;

import ru.BoshkaLab.entities.Employee;

public interface EmployeeService {
    double getProgress(int employeeId);
    void add(String slackId, String name, String surname);
}
