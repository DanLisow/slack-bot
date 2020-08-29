package ru.BoshkaLab.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import ru.BoshkaLab.entities.User;
import ru.BoshkaLab.entities.UserType;
import ru.BoshkaLab.repositories.UserRepository;

@Service
public class UserService{
    private static final String salt = "a6KzG3y1kcRp4";

    @Autowired
    private UserRepository userRepository;

    public void add(String login, String password, String email,
                    String name, String surname, UserType userType) {
        User newUser = new User(login, getMD5Hash(password), email,
                                name, surname, userType);
        userRepository.saveAndFlush(newUser);
    }

    public boolean auth(String loginOrEmail, String password) {
        String passwordHash = getMD5Hash(password);
        return  userRepository.existsByLoginAndPassword(loginOrEmail, passwordHash) ||
                userRepository.existsByEmailAndPassword(loginOrEmail, passwordHash);
    }

    private String getMD5Hash(String password) {
        return DigestUtils.md5DigestAsHex((password + salt).getBytes());
    }
}
