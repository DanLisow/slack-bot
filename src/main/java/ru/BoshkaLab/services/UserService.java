package ru.BoshkaLab.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import ru.BoshkaLab.entities.User;
import ru.BoshkaLab.entities.UserType;
import ru.BoshkaLab.repositories.UserRepository;

@Service
public class UserService{
    @Autowired
    private UserRepository userRepository;

    public void add(String login, String password, String email,
                    String name, String surname, UserType userType) {
        User newUser = new User(login, new BCryptPasswordEncoder().encode(password),
                                email, name, surname, userType);
        userRepository.saveAndFlush(newUser);
    }

    public boolean auth(String loginOrEmail, String password) {
        String passwordHash = new BCryptPasswordEncoder().encode(password);
        return  userRepository.existsByLoginAndPassword(loginOrEmail, passwordHash) ||
                userRepository.existsByEmailAndPassword(loginOrEmail, passwordHash);
    }
}
