package ru.BoshkaLab.slackbot;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import ru.BoshkaLab.entities.Answer;
import ru.BoshkaLab.entities.Channel;
import ru.BoshkaLab.entities.Employee;
import ru.BoshkaLab.entities.SendingTimetable;
import ru.BoshkaLab.repositories.AnswerRepository;
import ru.BoshkaLab.repositories.ChannelRepository;
import ru.BoshkaLab.repositories.EmployeeRepository;
import ru.BoshkaLab.repositories.SendingTimetableRepository;
import ru.BoshkaLab.services.EmployeeService;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@EnableScheduling
public class ScheduledTasks {
    @Autowired
    SendingTimetableRepository timetableRepository;
    @Autowired
    EmployeeRepository employeeRepository;
    @Autowired
    EmployeeService employeeService;
    @Autowired
    ChannelRepository channelRepository;
    @Autowired
    AnswerRepository answerRepository;

    private static final String domain;

    static {
        Properties prop = new Properties();
        try (InputStream input = Request.class.getClassLoader().getResourceAsStream("bot.properties")) {
            prop.load(input);
        } catch (IOException e) {
            e.printStackTrace();
        }
        domain = prop.getProperty("email_domain");
    }

    @Scheduled(fixedRate = 10000)
    public void updateUserList() throws IOException {
        String usersJsonStr = Request.getUsers();

        JSONObject jsonObject = new JSONObject(usersJsonStr);
        JSONArray members = jsonObject.getJSONArray("members");
        for (int i = 0; i < members.length(); i++) {
            JSONObject user = members.getJSONObject(i);

            if(user.getBoolean("deleted"))
                continue;

            if (user.getString("name").equals("slackbot") || user.getString("name").equals("boshkabot"))
                continue;

            String slackId = user.getString("id");
            if (employeeRepository.existsBySlackId(slackId))
                continue;

            JSONObject profile = user.getJSONObject("profile");
            String name;
            String surname;

            try{
                name = profile.getString("first_name");
                surname = profile.getString("last_name");
            }
            catch (Exception e){
                String[] fullname = user.getString("real_name").split(" ");
                name = fullname[0];
                surname = fullname[1];
            }

            // Check user's domain
            String email = profile.getString("email");
            if (!email.endsWith(domain))
                continue;

            employeeService.add(slackId, name, surname);
        }
    }

    @Scheduled(fixedRate = 15000)
    public void postMessage() throws IOException {
        Date currentTime = new Date(System.currentTimeMillis());
        List<SendingTimetable> timetable = timetableRepository.findAllByPostedIsFalseAndTimeLessThanEqual(currentTime);
        for (var record : timetable) {
            Employee employee = record.getEmployee();
            List<SendingTimetable> postedMessages = timetableRepository.findAllByPostedIsTrueAndEmployee(employee,
                    Sort.by(Sort.Direction.ASC, "time"));
            if (postedMessages.size() > 0) {
                SendingTimetable lastPostedMessage = postedMessages.get(postedMessages.size() - 1);
                if (!answerRepository.existsByEmployeeAndQuestion(employee, lastPostedMessage.getQuestion()))
                    continue;
            }

            String message = record.getQuestion().getText();
            String slackId = record.getEmployee().getSlackId();

            String answerStr = Request.postMessage(message, slackId);

            if (!channelRepository.existsByEmployee(employee)) {
                JSONObject answer = new JSONObject(answerStr);
                String channel = answer.getString("channel");
                Channel newChannel = new Channel(channel, record.getEmployee());
                channelRepository.saveAndFlush(newChannel);
            }

            record.setPosted(true);
            timetableRepository.saveAndFlush(record);
        }
    }

    @Scheduled(fixedRate = 30000)
    public void getAnswers() throws IOException {
        List<Employee> employeeList = employeeRepository.findAllByTimeOfEnding(null);
        for (Employee employee : employeeList) {
            List<SendingTimetable> records = timetableRepository.findAllByPostedIsTrueAndEmployee(employee,
                    Sort.by(Sort.Direction.ASC, "time"));
            if (records.size() == 0)
                continue;

            SendingTimetable record = records.get(records.size() - 1);
            if (answerRepository.existsByEmployeeAndQuestion(employee, record.getQuestion()))
                continue;

            String channel = channelRepository.findByEmployee(employee).getChannel();

            String answerBody = Request.getAnswer(channel);
            String answerText = parseAnswer(answerBody, record.getQuestion().getText());
            if (answerText.length() == 0)
                continue;
            Date currentTime = new Date(System.currentTimeMillis());

            Answer answer = new Answer(answerText, currentTime, employee, record.getQuestion());
            answerRepository.saveAndFlush(answer);
        }
    }

    private String parseAnswer(String answer, String question) {
        JSONObject jsonAnswer = new JSONObject(answer);
        JSONArray messages = jsonAnswer.getJSONArray("messages");
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < messages.length(); i++) {
            JSONObject message = messages.getJSONObject(i);
            String text = decodeString(message.getString("text"));

            if (text.equals(question))
                break;

            if (result.length() != 0)
                result.append("\n");
            result.append(text);
        }
        return result.toString();
    }

    private String decodeString(String str) {
        String newStr = str;
        Set<String> hexItems = new HashSet<>();

        Matcher m = Pattern.compile("\\\\u[a-fA-f0-9]{4}").matcher(str);
        while (m.find()) {
            hexItems.add(m.group());
        }

        for (String unicodeHex : hexItems) {
            int hexVal = Integer.parseInt(unicodeHex.substring(2), 16);
            newStr = newStr.replace(unicodeHex, "" + ((char) hexVal));
        }

        return newStr;
    }
}
