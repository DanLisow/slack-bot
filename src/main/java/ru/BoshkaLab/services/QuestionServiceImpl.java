package ru.BoshkaLab.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.BoshkaLab.entities.Employee;
import ru.BoshkaLab.entities.Question;
import ru.BoshkaLab.entities.SendingTimetable;
import ru.BoshkaLab.repositories.EmployeeRepository;
import ru.BoshkaLab.repositories.QuestionRepository;
import ru.BoshkaLab.repositories.SendingTimetableRepository;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    private QuestionRepository questionRepository;
    @Autowired
    private EmployeeRepository employeeRepository;
    @Autowired
    private SendingTimetableRepository timetableRepository;

    @Override
    public void add(String text, Integer interval, Integer day) {
        Question question = new Question(text, interval, day);
        questionRepository.saveAndFlush(question);

        List<Employee> employeeList = employeeRepository.findAllByTimeOfEnding(null);
        for (var employee : employeeList) {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(employee.getTimeOfEntering());
            calendar.add(Calendar.MINUTE, interval);
            Date time = calendar.getTime();

            Question thisQuestion = questionRepository.findByText(text);

            SendingTimetable newRecord = new SendingTimetable(time, employee, thisQuestion, false);
            timetableRepository.saveAndFlush(newRecord);
        }
    }

}
