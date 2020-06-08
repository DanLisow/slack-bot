package ru.BoshkaLab.entities;

import javax.persistence.*;

@Entity
public class Channel {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String channel;

    @OneToOne
    @JoinColumn(name="employee_id", referencedColumnName = "id")
    private Employee employee;

    public Channel() {
    }

    public Channel(String channel, Employee employee) {
        this.channel = channel;
        this.employee = employee;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getChannel() {
        return channel;
    }

    public void setChannel(String channel) {
        this.channel = channel;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
}
