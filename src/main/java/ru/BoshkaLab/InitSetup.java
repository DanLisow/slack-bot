package ru.BoshkaLab;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;
import ru.BoshkaLab.entities.User;
import ru.BoshkaLab.entities.UserType;
import ru.BoshkaLab.repositories.UserRepository;
import ru.BoshkaLab.repositories.UserTypeRepository;

@Component
public class InitSetup {
    @Autowired
    private UserTypeRepository userTypeRepository;
    @Autowired
    private UserRepository userRepository;

    @EventListener(ContextRefreshedEvent.class)
    public void initialSetup() {
        String[] roles = { "ADMIN", "HR", "OBSERVER" };

        for (var role : roles) {
            if (userTypeRepository.existsByName(role))
                continue;

            UserType userType = new UserType(role);
            userTypeRepository.saveAndFlush(userType);
        }

        if (!userRepository.existsByLogin("admin")) {
            UserType userType = userTypeRepository.findByName("ADMIN");
            User user = new User("admin", "admin", "admin@pochta.net",
                                 "Anton", "Lisov", userType);
            userRepository.saveAndFlush(user);
        }
    }
}
