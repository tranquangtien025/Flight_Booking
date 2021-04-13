/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.controller;

import com.google.gson.Gson;
import com.mycompany.flight_booking.entities.UserEntity;
import com.mycompany.flight_booking.enums.Gender;
import com.mycompany.flight_booking.enums.UserStatus;
import com.mycompany.flight_booking.service.AirportService;
import com.mycompany.flight_booking.service.UserRoleService;
import com.mycompany.flight_booking.service.UserService;
import com.mycompany.flight_booking.utils.SecurityUtils;
import java.util.List;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author TIEN
 */
@Controller
public class HomeController {

    @Autowired
    private AirportService airportService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    public JavaMailSender emailSender;

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String welcomePage(Model model) {
        List<String> roles = SecurityUtils.getRolesOfUser();
        if (!CollectionUtils.isEmpty(roles) && (roles.contains("ROLE_USER"))) {
            return "redirect:/user/home";
        }
        if (!CollectionUtils.isEmpty(roles) && (roles.contains("ROLE_ADMIN"))) {
            return "redirect:/admin/home";
        }
        if (!CollectionUtils.isEmpty(roles) && (roles.contains("ROLE_MANAGER"))) {
            return "redirect:/manager/home";
        }
        model.addAttribute("airports", airportService.getAirports());
        return "home";
    }

    @RequestMapping(value = "/services", method = RequestMethod.GET)
    public String services(Model model) {
        return "services";
    }

    @RequestMapping(value = "/promotions", method = RequestMethod.GET)
    public String promotions(Model model) {
        return "promotions";
    }

    @RequestMapping(value = "/contacts", method = RequestMethod.GET)
    public String contacts(Model model) {
        return "contacts";
    }

    @RequestMapping("/login")
    public String loginPage(Model model,
            @RequestParam(value = "error", required = false) boolean error) {
        if (error) {
            model.addAttribute("message", "Login Fail!");
        }
        return "login";
    }

    @RequestMapping("/403")
    public String accessDenied(Model model) {
        return "403Page";
    }

    @ResponseBody
    @RequestMapping(value = "loadDestination/{departure}", method = RequestMethod.GET)
    public String loadAirportsByAirport(@PathVariable("departure") String departure) {
        Gson gson = new Gson();
        return gson.toJson(airportService.getDestinationAirports(departure));
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerPage(Model model) {
        model.addAttribute("user", new UserEntity());
        model.addAttribute("genders", Gender.values());
        return "register";
    }

    @RequestMapping(value = "/registerResult", method = RequestMethod.POST)
    public String registerResult(Model model,
            @ModelAttribute("user") UserEntity userEntity
    ) throws MessagingException {
        if (!userService.isEmailExist(userEntity.getEmail()) && !userService.isPhoneNumberExist(userEntity.getPhoneNumber())) {

            String password = encrytePassword(userEntity.getPassword());
            userEntity.setPassword(password);
            userService.saveUser(userEntity);

            userEntity.setUserRoles(userRoleService.findByRoleName("ROLE_USER"));
            userService.saveAndFlush(userEntity);

            model.addAttribute("message", "Register Success! Please check active link in your email to login!");

            //Create a Mail Message
            MimeMessage message = emailSender.createMimeMessage();
            boolean multipart = true;
            MimeMessageHelper helper = new MimeMessageHelper(message, multipart, "utf-8");
            String htmlMsg = "<h3>Click bellow link to active your just created account:</h3>"
                    + "http://localhost:8080/Flight_Booking/activeAccount/" + userEntity.getId();
            message.setContent(htmlMsg, "text/html");
            helper.setTo(userEntity.getEmail());
            helper.setSubject("Mail To Active Account");

            //Send Message
            emailSender.send(message);

            return "login";
        } else if (userService.isEmailExist(userEntity.getEmail()) && userService.isPhoneNumberExist(userEntity.getPhoneNumber())) {
            model.addAttribute("user", userEntity);
            model.addAttribute("genders", Gender.values());
            model.addAttribute("message", "This account already existed!");
            return "register";
        } else if (userService.isEmailExist(userEntity.getEmail())) {
            model.addAttribute("user", userEntity);
            model.addAttribute("genders", Gender.values());
            model.addAttribute("message", "This email already registered!");
            return "register";
        } else {
            model.addAttribute("user", userEntity);
            model.addAttribute("genders", Gender.values());
            model.addAttribute("message", "This phone number already registered!");
            return "register";
        } 
    }

    public static String encrytePassword(String password) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.encode(password);
    }

    @RequestMapping(value = "/activeAccount/{userId}", method = RequestMethod.GET)
    public String activeAccount(Model model,
            @PathVariable("userId") int userId) {
        UserEntity userEntity = userService.getUserById(userId);
        userEntity.setStatus(UserStatus.ACTIVE);
        userService.saveUser(userEntity);
        return "redirect:/login";
    }
}
