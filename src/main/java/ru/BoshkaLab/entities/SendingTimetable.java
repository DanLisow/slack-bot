package ru.BoshkaLab.entities;

import javax.persistence.*;
import java.util.Date;

@Entity
public class SendingTimetable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private Date time;
    private boolean posted;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="employee_id", referencedColumnName = "id")
    private Employee employee;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="question_id", referencedColumnName = "id")
    private Question question;

    public SendingTimetable() {
    }

    public SendingTimetable(Date time, Employee employee, Question question, boolean posted) {
        this.time = time;
        this.employee = employee;
        this.question = question;
        this.posted = posted;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Employee getEmployee() {
        return employee;
    }

    public boolean isPosted() {
        return posted;
    }

    public void setPosted(boolean posted) {
        this.posted = posted;
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
