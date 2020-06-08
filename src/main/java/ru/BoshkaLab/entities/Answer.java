package ru.BoshkaLab.entities;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Answer {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String answer;
    private Date timeOfAnswer;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="employee_id", referencedColumnName = "id")
    private Employee employee;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="question_id", referencedColumnName = "id")
    private Question question;

    public Answer() {
    }

    public Answer(String answer, Date timeOfAnswer, Employee employee, Question question) {
        this.answer = answer;
        this.timeOfAnswer = timeOfAnswer;
        this.employee = employee;
        this.question = question;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Date getTimeOfAnswer() {
        return timeOfAnswer;
    }

    public void setTimeOfAnswer(Date timeOfAnswer) {
        this.timeOfAnswer = timeOfAnswer;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }
}
