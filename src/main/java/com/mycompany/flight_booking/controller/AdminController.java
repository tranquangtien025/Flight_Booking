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
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private AirportService airportService;
    
    @Autowired
    private BCryptPasswordEncoder encode;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String adminHomePage(Model model) {
        model.addAttribute("airports", airportService.getAirports());
        return "admin/home";
    }

    @RequestMapping(value = "/services", method = RequestMethod.GET)
    public String servicesPage(Model model) {
        return "/admin/services";
    }

    @RequestMapping(value = "/promotions", method = RequestMethod.GET)
    public String promotionsPage(Model model) {
        return "/admin/promotions";
    }

    @RequestMapping(value = "/contacts", method = RequestMethod.GET)
    public String contactsPage(Model model) {
        return "/admin/contacts";
    }
    
    @ResponseBody
    @RequestMapping(value = "loadDestination/{departure}", method = RequestMethod.GET)
    public String loadAirportsByAirport(@PathVariable("departure") String departure) {
        Gson gson = new Gson();
        return gson.toJson(airportService.getDestinationAirports(departure));
    }

    @RequestMapping(value = "/adminProfile", method = RequestMethod.GET)
    public String adminProfilePage(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("user", userService.getUser(username));
        model.addAttribute("active1", "active");
        return "/admin/adminProflie";
    }

    @RequestMapping(value = "/changePassword", method = RequestMethod.GET)
    public String changePassword(Model model,
            @RequestParam("newPassword") String newPassword,
            @RequestParam("currentPassword") String currentPassword) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        UserEntity userEntity = userService.getUser(username);

        if (encode.matches(currentPassword, userEntity.getPassword())) {
            String password = encrytePassword(newPassword);
            userEntity.setPassword(password);
            userService.saveUser(userEntity);

            return "redirect:/login";
        } else {
            model.addAttribute("active2", "active");
            model.addAttribute("error", "Your current password is not correct");
            model.addAttribute("userFullName", userService.getUser(username).getFullName());
            model.addAttribute("user", userService.getUser(username));
            return "/admin/adminProflie";
        }        
    }

    //Manage Accounts
    @RequestMapping(value = "/allUsers", method = RequestMethod.GET)
    public String allUsersPage(Model model,
            @RequestParam(name = "message", required = false) String message) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("users", userService.getUsers());
        model.addAttribute("userService", userService);
        model.addAttribute("message", message);
        return "/admin/allUsers";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.GET)
    public String addAccountPage(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("user", new UserEntity());
        model.addAttribute("genders", Gender.values());
        model.addAttribute("statuses", UserStatus.values());
        model.addAttribute("userRoles", userRoleService.getUserRoles());
        model.addAttribute("action", "add");
        return "/admin/user";
    }

    @RequestMapping(value = "/userResult/{action}", method = RequestMethod.POST)
    public String userResult(Model model,
            @ModelAttribute("user") UserEntity userEntity,
            @PathVariable("action") String action,
            @RequestParam(value = "listUserRoleId", required = false) List<Integer> listUserRoleId) {
            String password = encrytePassword(userEntity.getPassword());
            userEntity.setPassword(password);
            userService.saveUser(userEntity);
            if(listUserRoleId != null) {
            userEntity.setUserRoles(userRoleService.getListUserRoles(listUserRoleId));            
            userService.saveAndFlush(userEntity);
            }

            return "redirect:/admin/allUsers?message=Manipulation has been success";
    }

    public static String encrytePassword(String password) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.encode(password);
    }

    @RequestMapping(value = "/editUser/{userId}", method = RequestMethod.GET)
    public String editUserPage(Model model,
            @PathVariable("userId") int userId) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());
        
        model.addAttribute("user", userService.getUserById(userId));
        model.addAttribute("genders", Gender.values());
        model.addAttribute("statuses", UserStatus.values());
        model.addAttribute("userRoles", userRoleService.getUserRoles());
        model.addAttribute("action", "edit");
        model.addAttribute("userService", userService);
        return "/admin/user";
    }
}
