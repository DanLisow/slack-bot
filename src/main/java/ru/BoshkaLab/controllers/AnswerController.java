package ru.BoshkaLab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.BoshkaLab.entities.Answer;
import ru.BoshkaLab.repositories.AnswerRepository;

@RestController
@RequestMapping("answer")
public class AnswerController {
    @Autowired
    private AnswerRepository answerRepository;

    @GetMapping("/all")
    public Iterable<Answer> getAll() {
        return answerRepository.findAll();
    }

    @GetMapping("/{id}")
    public String getOne(@PathVariable int id, ModelMap answer) {
        answer.put("answer", answerRepository.findById(id));
        return "employeeSingle";
    }
}
