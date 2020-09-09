package ru.BoshkaLab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import ru.BoshkaLab.entities.User;
import ru.BoshkaLab.entities.UserType;
import ru.BoshkaLab.repositories.EmployeeRepository;
import ru.BoshkaLab.repositories.UserRepository;
import ru.BoshkaLab.repositories.UserTypeRepository;
import ru.BoshkaLab.services.UserService;

import java.util.Map;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserTypeRepository userTypeRepository;
    @Autowired
    private UserService userService;
    @Autowired
    private EmployeeRepository employeeRepository;

    @GetMapping("/all")
    public Iterable<User> getAll() {
        return userRepository.findAll();
    }

    @PostMapping("/add")
    public void add(@RequestBody Map<String, String> newUser) {
        String login;
        String email;
        String password;
        String name;
        String surname;
        long typeId;

        try {
            login = newUser.get("login");
            email = newUser.get("email");
            password = newUser.get("password");
            name = newUser.get("name");
            surname = newUser.get("surname");
            typeId = Long.parseLong(newUser.get("type_id"));
        }
        catch (Exception e) {
            return;
        }

        UserType type = userTypeRepository.getOne(typeId);

        User user = new User(login, password, email, name, surname, type);
        userRepository.saveAndFlush(user);
    }

    @PostMapping("/delete")
    public User delete(@RequestBody Map<String, String> userToDelete) {
        if (!userToDelete.containsKey("user_id"))
            return null;

        long user_id = Long.parseLong(userToDelete.get("user_id"));
        User user = userRepository.getOne(user_id);

        return user;
    }

    @GetMapping("/auth")
    public String authenticate(@RequestBody Map<String, String> auth) {
        if (!auth.containsKey("email")
                || !auth.containsKey("password"))
            return null;
        String email = auth.get("email");
        String password = auth.get("password");
        return userRepository.findByEmailAndPassword(email, password) != null ? "Ok" : "Fail";
    }

    @GetMapping("/login")
    public String login(@RequestParam("login") String login,
                        @RequestParam("password") String password,
                        ModelMap modelMap) {
        if (userService.auth(login, password)) {
            modelMap.put("employee", employeeRepository.findAll());
            return "redirect:/employee";
        }
        else
            return "redirect:/";
    }
}
