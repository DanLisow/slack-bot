package ru.BoshkaLab.services;

import ru.BoshkaLab.entities.Employee;

public interface IEmployeeService {
    double getProgress(int employeeId);
    void add(String slackId, String name, String surname);
}
