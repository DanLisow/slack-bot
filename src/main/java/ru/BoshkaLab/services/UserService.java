package ru.BoshkaLab.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import ru.BoshkaLab.entities.User;
import ru.BoshkaLab.entities.UserType;
import ru.BoshkaLab.repositories.UserRepository;

@Service
public class UserService{
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    public boolean add(String login, String password, String email,
                    String name, String surname, UserType userType) {
        if (userRepository.existsByLogin(login) || userRepository.existsByEmail(email))
            return false;
        User newUser = new User(login, bCryptPasswordEncoder.encode(password),
                                email, name, surname, userType);
        userRepository.saveAndFlush(newUser);
        return true;
    }

    public boolean auth(String loginOrEmail, String password) {
        User user = userRepository.findByEmailOrLogin(loginOrEmail, loginOrEmail);
        return bCryptPasswordEncoder.matches(password, user.getPassword());
    }

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
