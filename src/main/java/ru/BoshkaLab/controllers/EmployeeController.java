package ru.BoshkaLab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import ru.BoshkaLab.entities.Answer;
import ru.BoshkaLab.entities.Employee;
import ru.BoshkaLab.entities.Question;
import ru.BoshkaLab.repositories.AnswerRepository;
import ru.BoshkaLab.repositories.EmployeeRepository;
import ru.BoshkaLab.repositories.QuestionRepository;
import ru.BoshkaLab.services.EmployeeServiceImpl;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("employee")
public class EmployeeController {
    @Autowired
    private EmployeeRepository employeeRepository;
    @Autowired
    private EmployeeServiceImpl employeeService;
    @Autowired
    private QuestionRepository questionRepository;
    @Autowired
    private AnswerRepository answerRepository;
//    @GetMapping("/all")
//    public Iterable<Employee> getAll() {
//        return employeeRepository.findAll();
//    }
//
//    @GetMapping("/{id}")
//    public Employee getOne(@PathVariable Integer id) {
//        return employeeRepository.getOne(id);
//    }
//
//    @PostMapping("/add")
//    public void add(@RequestBody Map<String, String> newEmployee) {
//        String slackId;
//        String fullName;
//
//        try {
//            slackId = newEmployee.get("slackId");
//            fullName = newEmployee.get("fullName");
//
//            employeeService.add(slackId, fullName);
//        }
//        catch (Exception e) {
//            return;
//        }
//    }

    @RequestMapping(method = RequestMethod.GET)
    public String employeeList(ModelMap modelMap){
        modelMap.put("employee", employeeRepository.findAll());
        return "employee/employee";
    }

    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public String employeeList(@PathVariable(value = "id") int id, ModelMap modelMap){
        Optional<Employee> employee = employeeRepository.findById(id);
        ArrayList<Employee> res = new ArrayList<>();
        employee.ifPresent(res::add);
        modelMap.put("employee", res);
        modelMap.put("question", questionRepository.findAll());
        return "employee/employeeSingle";
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String create(HttpServletRequest request){
        String name = request.getParameter("name").trim();
        String surname = request.getParameter("surname");
        String slackId = request.getParameter("slackId").trim();
        employeeService.add(slackId, name, surname);
        return "redirect: ";
    }

    @GetMapping("progress/{id}")
    public double getProgress(@PathVariable int id) {
        return employeeService.getProgress(id);
    }
}
