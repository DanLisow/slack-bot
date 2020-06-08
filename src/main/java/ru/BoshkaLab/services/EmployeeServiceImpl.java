package ru.BoshkaLab.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.BoshkaLab.entities.Employee;
import ru.BoshkaLab.entities.Question;
import ru.BoshkaLab.entities.SendingTimetable;
import ru.BoshkaLab.repositories.AnswerRepository;
import ru.BoshkaLab.repositories.EmployeeRepository;
import ru.BoshkaLab.repositories.QuestionRepository;
import ru.BoshkaLab.repositories.SendingTimetableRepository;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private QuestionRepository questionRepository;
    @Autowired
    private AnswerRepository answerRepository;
    @Autowired
    private EmployeeRepository employeeRepository;
    @Autowired
    private SendingTimetableRepository timetableRepository;

    @Override
    public double getProgress(int employeeId) {
        long questionCount = questionRepository.count();
        double answeredQuestion = answerRepository.countAllByEmployee_Id(employeeId);
        return answeredQuestion / questionCount;
    }

    @Override
    public void add(String slackId, String name, String surname) {
        Date currentTime = new Date(System.currentTimeMillis());
        Employee employee = new Employee(slackId, name, surname, currentTime, null);
        employeeRepository.saveAndFlush(employee);

        List<Question> questionList = questionRepository.findAll();
        for (var question : questionList) {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(currentTime);
            calendar.add(Calendar.MINUTE, question.getInterval());
            Date time = calendar.getTime();

            Employee thisEmployee = employeeRepository.findBySlackId(slackId);

            SendingTimetable newRecord = new SendingTimetable(time, thisEmployee, question, false);
            timetableRepository.saveAndFlush(newRecord);
        }
    }
}
