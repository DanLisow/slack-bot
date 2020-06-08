package ru.BoshkaLab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.BoshkaLab.entities.UserType;
import ru.BoshkaLab.repositories.UserTypeRepository;

@RestController
@RequestMapping("user_type")
public class UserTypeController {
    @Autowired
    private UserTypeRepository userTypeRepository;

    @GetMapping("/get")
    public Iterable<UserType> getAll() {
        return userTypeRepository.findAll();
    }
}
