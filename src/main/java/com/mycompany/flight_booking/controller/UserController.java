/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.controller;

import com.google.gson.Gson;
import static com.mycompany.flight_booking.controller.AdminController.encrytePassword;
import com.mycompany.flight_booking.entities.BookingDetailEntity;
import com.mycompany.flight_booking.entities.PromotionEntity;
import com.mycompany.flight_booking.entities.ServiceBookingEntity;
import com.mycompany.flight_booking.entities.UserEntity;
import com.mycompany.flight_booking.enums.Gender;
import com.mycompany.flight_booking.enums.SeatType;
import com.mycompany.flight_booking.service.AircraftSeatService;
import com.mycompany.flight_booking.service.AirportService;
import com.mycompany.flight_booking.service.BookingDetailService;
import com.mycompany.flight_booking.service.BookingService;
import com.mycompany.flight_booking.service.FlightService;
import com.mycompany.flight_booking.service.PromotionService;
import com.mycompany.flight_booking.service.ServiceBookingService;
import com.mycompany.flight_booking.service.ServiceService;
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
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private UserRoleService userRoleService;
    
    @Autowired
    private AirportService airportService;
    
    @Autowired
    private FlightService flightService;
    
    @Autowired
    private AircraftSeatService aircraftSeatService;
    
    @Autowired
    private BookingDetailService bookingDetailService;
    
    @Autowired
    private ServiceService serviceService;
    
    @Autowired
    private ServiceBookingService serviceBookingService;
    
    @Autowired
    private PromotionService promotionService;
    
    @Autowired
    private BCryptPasswordEncoder encode;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String userHomePage(Model model) {
        model.addAttribute("airports", airportService.getAirports());
        return "/user/home";
    }

    @RequestMapping(value = "/services", method = RequestMethod.GET)
    public String servicesPage(Model model) {
        return "/user/services";
    }

    @RequestMapping(value = "/promotions", method = RequestMethod.GET)
    public String promotionsPage(Model model) {
        return "/user/promotions";
    }

    @RequestMapping(value = "/contacts", method = RequestMethod.GET)
    public String contactsPage(Model model) {
        return "/user/contacts";
    }
    
    @ResponseBody
    @RequestMapping(value = "loadDestination/{departure}", method = RequestMethod.GET)
    public String loadAirportsByAirport(@PathVariable("departure") String departure) {
        Gson gson = new Gson();
        return gson.toJson(airportService.getDestinationAirports(departure));
    }

    @RequestMapping(value = "/userProfile", method = RequestMethod.GET)
    public String userProfilePage(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("user", userService.getUser(username));
        model.addAttribute("active1", "active");
        return "/user/userProflie";
    }

    @RequestMapping(value = "/changePassword", method = RequestMethod.GET)
    public String changePassword(Model model,
            @RequestParam("currentPassword") String currentPassword,
            @RequestParam("newPassword") String newPassword) { 
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
            return "/user/userProflie";
        }        
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
        model.addAttribute("userRoles", userRoleService.getUserRoles());
        model.addAttribute("userService", userService);
        return "/user/editUser";
    }

    @RequestMapping(value = "/userResult", method = RequestMethod.POST)
    public String userResult(Model model,
            @ModelAttribute("user") UserEntity userEntity,
            @RequestParam("listUserRoleId") List<Integer> listUserRoleId) {
            userService.saveUser(userEntity);
            userEntity.setUserRoles(userRoleService.getListUserRoles(listUserRoleId));
            userService.saveAndFlush(userEntity);
            
            return "redirect:/user/userProfile";
    }

    @RequestMapping(value = "/viewHistory/{phoneNumber}")
    public String viewHistory(Model model,
            @PathVariable("phoneNumber") String phoneNumber) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("user", userService.getUser(username));
        model.addAttribute("bookings", bookingService.viewHistory(phoneNumber));
        return "/user/viewHistory";
    }

    @RequestMapping(value = "/bookingDetails/{bookingId}", method = RequestMethod.GET)
    public String bookingDetailsPage(Model model,
            @PathVariable("bookingId") int bookingId) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("user", userService.getUser(username));
        model.addAttribute("booking", bookingService.getBookingById(bookingId));
        model.addAttribute("flightService", flightService);
        model.addAttribute("aircraftSeatService", aircraftSeatService);
        model.addAttribute("bookingDetailService", bookingDetailService);
        model.addAttribute("serviceService", serviceService);
        model.addAttribute("totalCost", totalCost(bookingDetailService.getListBookingDetailOfBooking(bookingId)));
        return "/user/bookingDetails";
    }
    
    public double totalCost(List<BookingDetailEntity> BookingDetailList) {
        double totalCost = 0;
        for (BookingDetailEntity bd : BookingDetailList) {
            totalCost += unitPriceOfBookingDetail(bd) - discountOfBookingDetail(bd);
//            totalCost += (bd.getUnitPrice() - bd.getDiscount());
        }
        return totalCost;
    }

    public double unitPriceOfBookingDetail(BookingDetailEntity bd) {
        double unitPrice = 0;

        double totalServicePrice = 0;
        for (ServiceBookingEntity sb : serviceBookingService.getListServiceBookingOfBookingDetail(bd.getId())) {
            totalServicePrice += sb.getPrice();
        }
        
        if (aircraftSeatService.getAircraftSeatOfBookingDetail(bd.getFlight().getId(), bd.getSeat().getId()).getSeatType().getSeatType() == SeatType.ECONOMY) {
            unitPrice = bd.getFlight().getFlightRoute().getEconomyPrice()
                + totalServicePrice;
        }
        else if (aircraftSeatService.getAircraftSeatOfBookingDetail(bd.getFlight().getId(), bd.getSeat().getId()).getSeatType().getSeatType() == SeatType.PREMIUM_ECONOMY) {
            unitPrice = bd.getFlight().getFlightRoute().getPremiumEconomyPrice()
                + totalServicePrice;
        }
        else if (aircraftSeatService.getAircraftSeatOfBookingDetail(bd.getFlight().getId(), bd.getSeat().getId()).getSeatType().getSeatType() == SeatType.BUSINESS) {
            unitPrice = bd.getFlight().getFlightRoute().getBusinessPrice()
                + totalServicePrice;
        }
        return unitPrice;
    }

    public double discountOfBookingDetail(BookingDetailEntity bd) {
        double discount = 0;

        double promotionDiscount = 0;
        for (PromotionEntity pro : promotionService.getListPromotionOfBookingDetail(bd.getId())) {
            promotionDiscount += pro.getDiscount() / 100;
        }

        double ticketTypeDiscount = bd.getTicketType().getRatio();

        return discount = (promotionDiscount + ticketTypeDiscount) * unitPriceOfBookingDetail(bd);
    }
}
