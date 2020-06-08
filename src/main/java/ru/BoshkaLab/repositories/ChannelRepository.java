package ru.BoshkaLab.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.BoshkaLab.entities.Channel;
import ru.BoshkaLab.entities.Employee;

public interface ChannelRepository extends JpaRepository<Channel, Integer> {
    Channel findByEmployee(Employee employee);
}
