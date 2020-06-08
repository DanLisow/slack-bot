package ru.BoshkaLab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import ru.BoshkaLab.entities.SendingTimetable;
import ru.BoshkaLab.repositories.SendingTimetableRepository;

import java.util.Map;

@RestController
@RequestMapping("timetable")
public class SendingTimetableController {
    @Autowired
    private SendingTimetableRepository timetableRepository;

    @GetMapping("all")
    public Iterable<SendingTimetable> getAll() {
        return timetableRepository.findAll();
    }

    @GetMapping("/{id}")
    public SendingTimetable getOne(@PathVariable long id) {
        return timetableRepository.getOne(id);
    }
}
