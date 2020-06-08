package ru.BoshkaLab.entities;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="employee")
@Proxy(lazy = false)
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String slackId;
    private String name;
    private String surname;
    private Date timeOfEntering;
    private Date timeOfEnding;

    public Employee() {
    }

    public Employee(String slackId, String name, String surname, Date timeOfEntering, Date timeOfEnding) {
        this.slackId = slackId;
        this.name = name;
        this.surname = surname;
        this.timeOfEntering = timeOfEntering;
        this.timeOfEnding = timeOfEnding;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSlackId() {
        return slackId;
    }

    public void setSlackId(String slackId) {
        this.slackId = slackId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public Date getTimeOfEntering() {
        return timeOfEntering;
    }

    public void setTimeOfEntering(Date timeOfEntering) {
        this.timeOfEntering = timeOfEntering;
    }

    public Date getTimeOfEnding() {
        return timeOfEnding;
    }

    public void setTimeOfEnding(Date timeOfEnding) {
        this.timeOfEnding = timeOfEnding;
    }
}
