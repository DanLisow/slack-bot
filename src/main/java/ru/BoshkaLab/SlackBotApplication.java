package ru.BoshkaLab;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Import;
import ru.BoshkaLab.slackbot.ScheduledTasks;

@SpringBootApplication
@Import(ScheduledTasks.class)
public class SlackBotApplication {

	public static void main(String[] args) {
		SpringApplication.run(SlackBotApplication.class, args);
	}

}
