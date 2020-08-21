package ru.BoshkaLab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ru.BoshkaLab.entities.Question;
import ru.BoshkaLab.repositories.QuestionRepository;
import ru.BoshkaLab.services.QuestionService;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("question")
public class QuestionController {
    @Autowired
    private QuestionRepository questionRepository;
    @Autowired
    private QuestionService questionService;

//    @GetMapping("all")
//    public Iterable<Question> getAll() {
//        return questionRepository.findAll();
//    }
//
//    @GetMapping("/{id}")
//    public Question getOne(@PathVariable long id) {
//        return questionRepository.getOne(id);
//    }
//
//    @PostMapping("/add")
//    public void add(@RequestBody Map<String, String> newQuestion) {
//        try {
//            String text = newQuestion.get("text");
//            Integer interval = Integer.parseInt(newQuestion.get("interval"));
//            questionService.add(text, interval);
//        }
//        catch (Exception e) {
//            return;
//        }
//    }
//
//    @PutMapping("/update")
//    public Question update(@RequestBody Question question) {
//        questionRepository.saveAndFlush(question);
//        return question;
//    }

    @RequestMapping(method = RequestMethod.GET)
    public String questionList(ModelMap modelMap){
        modelMap.put("question" ,questionRepository.findAll());
        return "question/questions";
    }

    @GetMapping("/{id}")
    public String delete(@PathVariable(value = "id") long id, Model model){
        Question question = questionRepository.findById(id).orElseThrow(IllegalStateException::new);
        questionRepository.delete(question);
        return "redirect: ";
    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String questionAdd(HttpServletRequest request){
        int day = (Integer.parseInt(request.getParameter("day").trim()));
        int interval = Integer.parseInt(request.getParameter("day").trim());
        String text = request.getParameter("text").trim();
        questionService.add(text, interval, day);
        return "redirect: ";
    }
}
