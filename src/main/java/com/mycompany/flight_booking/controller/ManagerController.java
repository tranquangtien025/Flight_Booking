/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.controller;

import com.google.gson.Gson;
import com.lowagie.text.DocumentException;
import static com.mycompany.flight_booking.controller.AdminController.encrytePassword;
import com.mycompany.flight_booking.entities.AircraftEntity;
import com.mycompany.flight_booking.entities.AirportEntity;
import com.mycompany.flight_booking.entities.BookingDetailEntity;
import com.mycompany.flight_booking.entities.BookingEntity;
import com.mycompany.flight_booking.entities.FlightEntity;
import com.mycompany.flight_booking.entities.FlightRouteEntity;
import com.mycompany.flight_booking.entities.ImageEntity;
import com.mycompany.flight_booking.entities.PromotionEntity;
import com.mycompany.flight_booking.entities.ServiceBookingEntity;
import com.mycompany.flight_booking.entities.ServiceEntity;
import com.mycompany.flight_booking.entities.UserEntity;
import com.mycompany.flight_booking.enums.AircraftStatus;
import com.mycompany.flight_booking.enums.AirportStatus;
import com.mycompany.flight_booking.enums.BookingStatus;
import com.mycompany.flight_booking.enums.FlightRouteStatus;
import com.mycompany.flight_booking.enums.FlightStatus;
import com.mycompany.flight_booking.enums.PromotionStatus;
import com.mycompany.flight_booking.enums.SeatType;
import com.mycompany.flight_booking.exporter.PDFExporter;
import com.mycompany.flight_booking.exporter.BookingExcelExporter;
import com.mycompany.flight_booking.service.AircraftSeatService;
import com.mycompany.flight_booking.service.AircraftService;
import com.mycompany.flight_booking.service.AirportService;
import com.mycompany.flight_booking.service.BookingDetailService;
import com.mycompany.flight_booking.service.BookingService;
import com.mycompany.flight_booking.service.CityService;
import com.mycompany.flight_booking.service.FlightRouteService;
import com.mycompany.flight_booking.service.FlightService;
import com.mycompany.flight_booking.service.ImageService;
import com.mycompany.flight_booking.service.OperationService;
import com.mycompany.flight_booking.service.PromotionService;
import com.mycompany.flight_booking.service.ServiceBookingService;
import com.mycompany.flight_booking.service.ServiceService;
import com.mycompany.flight_booking.service.UserService;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.scheduling.annotation.Scheduled;
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
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author TIEN
 */
@Controller
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    private AirportService airportService;

    @Autowired
    private CityService cityService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private AircraftService aircraftService;

    @Autowired
    private FlightRouteService flightRouteService;

    @Autowired
    private PromotionService promotionService;

    @Autowired
    private FlightService flightService;

    @Autowired
    private OperationService operationService;

    @Autowired
    private ServiceService serviceService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private UserService userService;

    @Autowired
    private BookingDetailService bookingDetailService;

    @Autowired
    private AircraftSeatService aircraftSeatService;

    @Autowired
    private ServiceBookingService serviceBookingService;
    
    @Autowired
    private BCryptPasswordEncoder encode;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String managerHomePage(Model model) {
        model.addAttribute("airports", airportService.getAirports());
        return "/manager/home";
    }

    @RequestMapping(value = "/services", method = RequestMethod.GET)
    public String servicesPage(Model model) {
        return "/manager/services";
    }

    @RequestMapping(value = "/promotions", method = RequestMethod.GET)
    public String promotionsPage(Model model) {
        return "/manager/promotions";
    }

    @RequestMapping(value = "/contacts", method = RequestMethod.GET)
    public String contactsPage(Model model) {
        return "/manager/contacts";
    }
    
    @ResponseBody
    @RequestMapping(value = "loadDestination/{departure}", method = RequestMethod.GET)
    public String loadAirportsByAirport(@PathVariable("departure") String departure) {
        Gson gson = new Gson();
        return gson.toJson(airportService.getDestinationAirports(departure));
    }

    @RequestMapping(value = "/managerProfile", method = RequestMethod.GET)
    public String managerProfilePage(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("user", userService.getUser(username));
        model.addAttribute("active1", "active");
        return "/manager/managerProflie";
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
            return "/manager/managerProflie";
        }      
    }

    //Manage Booking
    @RequestMapping(value = "/allBookings", method = RequestMethod.GET)
    public String allBookingPage(Model model, HttpServletRequest request,
            @RequestParam(name = "message", required = false) String message) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        HttpSession session = request.getSession();
        session.removeAttribute("bookings");
        model.addAttribute("bookings", bookingService.getBookings());
        model.addAttribute("message", message);
        return "/manager/allBookings";
    }

    @RequestMapping(value = "/searchByDate", method = RequestMethod.GET)
    public String searchByDate(Model model, HttpServletRequest request,
            @Param("from") String from,
            @Param("to") String to){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("bookings", bookingService.getByBookingDateBetween(from, to));
        HttpSession session = request.getSession();
        session.setAttribute("bookings", bookingService.getByBookingDateBetween(from, to));
        
        return "/manager/allBookings";
    }

    @RequestMapping(value = "/searchByBookingNumber", method = RequestMethod.GET)
    public String searchByBookingNumber(Model model, HttpServletRequest request,
            @ModelAttribute("bookingNumber") String bookingNumber) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("bookings", bookingService.findByBookingNumberLike(bookingNumber));
        model.addAttribute("bookingNumber", bookingNumber);
        HttpSession session = request.getSession();
        session.setAttribute("bookings", bookingService.findByBookingNumberLike(bookingNumber));

        return "/manager/allBookings";
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

        BookingEntity booking = bookingService.getBookingById(bookingId);
        model.addAttribute("booking", booking);
        model.addAttribute("statuses", BookingStatus.values());
        model.addAttribute("flightService", flightService);
        model.addAttribute("aircraftSeatService", aircraftSeatService);
        model.addAttribute("bookingDetailService", bookingDetailService);
        model.addAttribute("serviceService", serviceService);
        model.addAttribute("totalCost", totalCost(bookingDetailService.getListBookingDetailOfBooking(bookingId)));
        return "/manager/bookingDetails";
    }

    public double totalCost(List<BookingDetailEntity> BookingDetailList) {
        double totalCost = 0;
        for (BookingDetailEntity bd : BookingDetailList) {
            totalCost += unitPriceOfBookingDetail(bd) - discountOfBookingDetail(bd);
//            totalCost += bd.getUnitPrice() - bd.getDiscount();
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

    @RequestMapping(value = "/changeBookingStatus", method = RequestMethod.POST)
    public String changeBookingStatus(Model model,
            @RequestParam("id") Integer id,
            @RequestParam("status") BookingStatus status) {
        BookingEntity booking = bookingService.getBookingById(id);
        booking.setStatus(status);
        bookingService.saveBooking(booking);
        return "redirect:/manager/allBookings";
    }
    
    @RequestMapping(value = "/deleteBooking/{bookingId}")
    public String deleteBooking(Model model,
            @PathVariable("bookingId") int bookingId) {
        for (BookingDetailEntity bd : bookingDetailService.getListBookingDetailOfBooking(bookingId)) {
            aircraftSeatService.deleteAircraftSeatOfBookingDetail(bd.getFlight().getId(), bd.getSeat().getId());
        }
        if (!bookingService.deleteBooking(bookingId)) {            
            return "redirect:/manager/allBookings?"
                    + "message=Delete success";
        } else {
            return "redirect:/manager/allBookings?"
                    + "message=Delete fail";
        }
    }

    //Manage Flight
    @RequestMapping(value = "/allFlights", method = RequestMethod.GET)
    public String allFlightsPage(Model model,
            @RequestParam(name = "message", required = false) String message) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("flights", flightService.getFlights());
        model.addAttribute("message", message);
        return "/manager/allFlights";
    }

    @RequestMapping(value = "/addFlight", method = RequestMethod.GET)
    public String addFlightPage(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("flight", new FlightEntity());
        model.addAttribute("statuses", FlightStatus.values());
        model.addAttribute("aircrafts", aircraftService.getAircrafts());
        model.addAttribute("flightRoutes", flightRouteService.getFlightRoutes());
        model.addAttribute("operations", operationService.getOperations());
        model.addAttribute("action", "add");
        return "/manager/flight";
    }

    @RequestMapping(value = "/flightResult/{action}", method = RequestMethod.POST)
    public String flightResult(Model model,
            @ModelAttribute("flight") FlightEntity flightEntity,
            @PathVariable("action") String action) {
            flightService.saveFlight(flightEntity);
            return "redirect:/manager/allFlights?message=Manipulation has been success";
    }

    @RequestMapping(value = "/editFlight/{flightId}", method = RequestMethod.GET)
    public String editFlightPage(Model model,
            @PathVariable("flightId") int flightId) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("flight", flightService.getFlightById(flightId));
        model.addAttribute("statuses", FlightStatus.values());
        model.addAttribute("aircrafts", aircraftService.getAircrafts());
        model.addAttribute("flightRoutes", flightRouteService.getFlightRoutes());
        model.addAttribute("operations", operationService.getOperations());
        model.addAttribute("action", "edit");
        return "/manager/flight";
    }

    //Manage Flight Routes
    @RequestMapping(value = "/allFlightRoutes", method = RequestMethod.GET)
    public String allFlightRoutesPage(Model model,
            @RequestParam(name = "message", required = false) String message) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("flightRoutes", flightRouteService.getFlightRoutes());
        model.addAttribute("message", message);
        return "/manager/allFlightRoutes";
    }

    @RequestMapping(value = "/addFlightRoute", method = RequestMethod.GET)
    public String addFlightRoutePage(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("statuses", FlightRouteStatus.values());
        model.addAttribute("flightRoute", new FlightRouteEntity());
        model.addAttribute("airports", airportService.getAirports());
        model.addAttribute("action", "add");
        return "/manager/flightRoute";
    }

    @RequestMapping(value = "/flightRouteResult/{action}", method = RequestMethod.POST)
    public String flightRouteResult(Model model,
            @ModelAttribute("flightRoute") FlightRouteEntity flightRouteEntity,
            @PathVariable("action") String action) {
            flightRouteService.saveFlightRoute(flightRouteEntity);
            return "redirect:/manager/allFlightRoutes?message=Manipulation has been success";
    }

    @RequestMapping(value = "/editFlightRoute/{flightRouteId}", method = RequestMethod.GET)
    public String editFlightRoutePage(Model model,
            @PathVariable("flightRouteId") int flightRouteId) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("statuses", FlightRouteStatus.values());
        model.addAttribute("flightRoute", flightRouteService.getFlightRouteById(flightRouteId));
        model.addAttribute("airports", airportService.getAirports());
        model.addAttribute("action", "edit");
        return "/manager/flightRoute";
    }

    //Manage Airport
    @RequestMapping(value = "/allAirports", method = RequestMethod.GET)
    public String allAirportsPage(Model model,
            @RequestParam(name = "message", required = false) String message) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("airports", airportService.getAirports());
        model.addAttribute("airportService", airportService);
        model.addAttribute("message", message);
        return "/manager/allAirports";
    }

    @RequestMapping(value = "/addAirport", method = RequestMethod.GET)
    public String addAirportPage(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("cities", cityService.getCities());
        model.addAttribute("statuses", AirportStatus.values());
        model.addAttribute("airport", new AirportEntity());
        model.addAttribute("action", "add");
        return "/manager/airport";
    }

    @RequestMapping(value = "/airportResult/{action}", method = RequestMethod.POST)
    public String airportResult(Model model,
            @ModelAttribute("airport") AirportEntity airportEntity,
            @PathVariable("action") String action,
            @RequestParam("files") MultipartFile[] files,
            HttpServletRequest request) {
            airportService.saveAirport(airportEntity);

            for (MultipartFile file : files) {
                if (!file.isEmpty()) {
                    ImageEntity imageEntity = new ImageEntity();
                    //Create custom filename 
                    String fileName = file.getOriginalFilename();
                    String newFileName = "";

                    //check image name exsits or not           
                    if (imageService.getListImageNameLike(fileName).isEmpty()) {
                        newFileName = fileName;
                    } else {
                        boolean cont = true;
                        do {
                            newFileName = RandomStringUtils.randomAlphabetic(4) + '_' + fileName;
                            if (imageService.getListImageNameLike(newFileName).isEmpty()) {
                                cont = false;
                            }
                        } while (cont);
                    }

                    imageEntity.setName(newFileName);
                    imageEntity.setAirport(airportEntity);
                    imageService.saveImage(imageEntity);

                    //save file to server
                    try {
                        byte[] bytes = file.getBytes();
                        ServletContext context = request.getServletContext();
                        String pathUrl = context.getRealPath("/img");

                        int index = pathUrl.indexOf("target");
                        String pathFolder = pathUrl.substring(0, index) + "\\src\\main\\webapp\\resources-management\\img";
                        Path path = Paths.get(pathFolder + File.separator + newFileName);
                        Files.write(path, bytes);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }

            return "redirect:/manager/allAirports?message=Manipulation has been success";
    }

    @RequestMapping(value = "/editAirport/{airportId}", method = RequestMethod.GET)
    public String editAirportPage(Model model,
            @PathVariable("airportId") int airportId) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("cities", cityService.getCities());
        model.addAttribute("statuses", AirportStatus.values());
        model.addAttribute("airport", airportService.getAirportById(airportId));
        model.addAttribute("action", "edit");
        return "/manager/airport";
    }

    @RequestMapping("/deleteImageOfAirport/{airportId}/{imageId}")
    public String deleteImageOfAirport(Model model,
            @PathVariable("airportId") int airportId,
            @PathVariable("imageId") int imageId,
            HttpServletRequest request) {

        //delete file on server
        try {
            ServletContext context = request.getServletContext();
            String pathUrl = context.getRealPath("/img");
            //file and image have same name
            String fileName = imageService.getImageById(imageId).getName();

            int index = pathUrl.indexOf("target");
            String pathFolder = pathUrl.substring(0, index) + "\\src\\main\\webapp\\resources-management\\img";

            Path path = Paths.get(pathFolder + File.separator + fileName);

            Files.delete(path);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //delete image in database
        imageService.deleteImage(imageId);

        model.addAttribute("cities", cityService.getCities());
        model.addAttribute("statuses", AirportStatus.values());
        model.addAttribute("airport", airportService.getAirportById(airportId));
        model.addAttribute("action", "edit");
        return "/manager/airport";
    }

    //Manage Aircraft
    @RequestMapping(value = "/allAircrafts", method = RequestMethod.GET)
    public String allAircraftsPage(Model model,
            @RequestParam(name = "message", required = false) String message) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("aircrafts", aircraftService.getAircrafts());
        model.addAttribute("aircraftService", aircraftService);
        model.addAttribute("message", message);
        return "/manager/allAircrafts";
    }

    @RequestMapping(value = "/addAircraft", method = RequestMethod.GET)
    public String addAircraftPage(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("aircraft", new AircraftEntity());
        model.addAttribute("statuses", AircraftStatus.values());
        model.addAttribute("action", "add");
        return "/manager/aircraft";
    }

    @RequestMapping(value = "/aircraftResult/{action}", method = RequestMethod.POST)
    public String aircraftResult(Model model,
            @ModelAttribute("aircraft") AircraftEntity aircraftEntity,
            @PathVariable("action") String action,
            @RequestParam("files") MultipartFile[] files,
            HttpServletRequest request) {
            aircraftService.saveAircraft(aircraftEntity);

            for (MultipartFile file : files) {
                if (!file.isEmpty()) {
                    ImageEntity imageEntity = new ImageEntity();
                    //Create custom filename 
                    String fileName = file.getOriginalFilename();
                    String newFileName = "";

                    //check image name exsits or not           
                    if (imageService.getListImageNameLike(fileName).isEmpty()) {
                        newFileName = fileName;
                    } else {
                        boolean cont = true;
                        do {
                            newFileName = RandomStringUtils.randomAlphabetic(4) + '_' + fileName;
                            if (imageService.getListImageNameLike(newFileName).isEmpty()) {
                                cont = false;
                            }
                        } while (cont);
                    }

                    imageEntity.setName(newFileName);
                    imageEntity.setAircraft(aircraftEntity);
                    imageService.saveImage(imageEntity);

                    //save file to server
                    try {
                        byte[] bytes = file.getBytes();
                        ServletContext context = request.getServletContext();
                        String pathUrl = context.getRealPath("/img");

                        int index = pathUrl.indexOf("target");
                        String pathFolder = pathUrl.substring(0, index) + "\\src\\main\\webapp\\resources-management\\img";
                        Path path = Paths.get(pathFolder + File.separator + newFileName);
                        Files.write(path, bytes);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }

            return "redirect:/manager/allAircrafts?message=Manipulation has been success";
    }

    @RequestMapping(value = "/editAircraft/{aircraftId}", method = RequestMethod.GET)
    public String editAircraftPage(Model model,
            @PathVariable("aircraftId") int id) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("aircraft", aircraftService.getAircraftById(id));
        model.addAttribute("statuses", AircraftStatus.values());
        model.addAttribute("action", "edit");
        return "/manager/aircraft";
    }

    @RequestMapping("/deleteImageOfAircraft/{aircraftId}/{imageId}")
    public String deleteImageOfAircraft(Model model,
            @PathVariable("aircraftId") int aicrafrtId,
            @PathVariable("imageId") int imageId,
            HttpServletRequest request) {

        //delete file on server
        try {
            ServletContext context = request.getServletContext();
            String pathUrl = context.getRealPath("/img");
            //file and image have same name
            String fileName = imageService.getImageById(imageId).getName();

            int index = pathUrl.indexOf("target");
            String pathFolder = pathUrl.substring(0, index) + "\\src\\main\\webapp\\resources-management\\img";

            Path path = Paths.get(pathFolder + File.separator + fileName);

            Files.delete(path);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //delete image in database
        imageService.deleteImage(imageId);

        model.addAttribute("statuses", AircraftStatus.values());
        model.addAttribute("aircraft", aircraftService.getAircraftById(aicrafrtId));
        model.addAttribute("action", "edit");
        return "/manager/aircraft";
    }

    //Manage Promotions
    @RequestMapping(value = "/allPromotions", method = RequestMethod.GET)
    public String allPromotionsPage(Model model,
            @RequestParam(name = "message", required = false) String message) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("promotions", promotionService.getPromotions());
        model.addAttribute("flightService", flightService);
        model.addAttribute("message", message);
        return "/manager/allPromotions";
    }

    @RequestMapping(value = "/addPromotion", method = RequestMethod.GET)
    public String addPromotionPage(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("promotion", new PromotionEntity());
        model.addAttribute("promotionService", promotionService);
        model.addAttribute("flights", flightService.getFlightsFromDate((Date) new Date()));
        model.addAttribute("statuses", PromotionStatus.values());
        model.addAttribute("action", "add");
        return "/manager/promotion";
    }

    @RequestMapping(value = "/promotionResult/{action}", method = RequestMethod.POST)
    public String promotionResult(Model model,
            @ModelAttribute("promotion") PromotionEntity promotion,
            @PathVariable("action") String action,
            @RequestParam(value = "listFlightId", required = false) List<Integer> listFlightId) {
            promotionService.savePromotion(promotion);
            if (listFlightId != null) {
                promotion.setFlights(flightService.getListFlightsByListFlightId(listFlightId));
                promotionService.saveAndFlush(promotion);
            }

            return "redirect:/manager/allPromotions?message=Manipulation has been success";
    }

    @RequestMapping(value = "/editPromotion/{promotionId}", method = RequestMethod.GET)
    public String editPromotionPage(Model model,
            @PathVariable("promotionId") int promotionId) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        PromotionEntity promotion = promotionService.getPromotionById(promotionId);
        model.addAttribute("promotion", promotion);
        model.addAttribute("promotionService", promotionService);
        model.addAttribute("flights", flightService.getFlightsBetweenDate((Date) promotion.getStartDate(), (Date) promotion.getEndDate()));
        model.addAttribute("statuses", PromotionStatus.values());
        model.addAttribute("action", "edit");
        return "/manager/promotion";
    }

    //Schedule for Promotion
    @Scheduled(fixedDelay = 5*1000)
//    @Scheduled(cron="0 0 * * * *")
    public void autoUpdatePromotionsStatus() {
        Date today = new Date();
        for (PromotionEntity pro : promotionService.getListPromotionsAvailable()) {
            if (pro.getEndDate().compareTo(today) < 0) {
                pro.setStatus(PromotionStatus.EXPIRED);
                promotionService.savePromotion(pro);
            } 
        }
    }

    //Manage Services
    @RequestMapping(value = "/allServices", method = RequestMethod.GET)
    public String allServicesPage(Model model,
            @RequestParam(name = "message", required = false) String message) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("services", serviceService.getServices());
        model.addAttribute("serviceService", serviceService);
        model.addAttribute("message", message);
        return "/manager/allServices";
    }

    @RequestMapping(value = "/addService", method = RequestMethod.GET)
    public String addServicePage(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("service", new ServiceEntity());
        model.addAttribute("action", "add");
        return "/manager/service";
    }

    @RequestMapping(value = "/serviceResult/{action}", method = RequestMethod.POST)
    public String serviceResult(Model model,
            @ModelAttribute("service") ServiceEntity serviceEntity,
            @PathVariable("action") String action,
            @RequestParam("files") MultipartFile[] files,
            HttpServletRequest request) {
            serviceService.saveService(serviceEntity);

            for (MultipartFile file : files) {
                if (!file.isEmpty()) {
                    ImageEntity imageEntity = new ImageEntity();
                    //Create custom filename 
                    String fileName = file.getOriginalFilename();
                    String newFileName = "";

                    //check image name exsits or not           
                    if (imageService.getListImageNameLike(fileName).isEmpty()) {
                        newFileName = fileName;
                    } else {
                        boolean cont = true;
                        do {
                            newFileName = RandomStringUtils.randomAlphabetic(4) + '_' + fileName;
                            if (imageService.getListImageNameLike(newFileName).isEmpty()) {
                                cont = false;
                            }
                        } while (cont);
                    }

                    imageEntity.setName(newFileName);
                    imageEntity.setService(serviceEntity);
                    imageService.saveImage(imageEntity);

                    //save file to server
                    try {
                        byte[] bytes = file.getBytes();
                        ServletContext context = request.getServletContext();
                        String pathUrl = context.getRealPath("/img");

                        int index = pathUrl.indexOf("target");
                        String pathFolder = pathUrl.substring(0, index) + "\\src\\main\\webapp\\resources-management\\img";
                        Path path = Paths.get(pathFolder + File.separator + newFileName);
                        Files.write(path, bytes);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }

            return "redirect:/manager/allServices?message=Manipulation has been success";
    }

    @RequestMapping(value = "/editService/{serviceId}", method = RequestMethod.GET)
    public String editServicePage(Model model,
            @PathVariable("serviceId") int serviceId) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        model.addAttribute("userFullName", userService.getUser(username).getFullName());

        model.addAttribute("service", serviceService.getServiceById(serviceId));
        model.addAttribute("action", "edit");
        return "/manager/service";
    }

    @RequestMapping("/deleteImageOfService/{serviceId}/{imageId}")
    public String deleteImageOfService(Model model,
            @PathVariable("serviceId") int serviceId,
            @PathVariable("imageId") int imageId,
            HttpServletRequest request) {

        //delete file on server
        try {
            ServletContext context = request.getServletContext();
            String pathUrl = context.getRealPath("/img");
            //file and image have same name
            String fileName = imageService.getImageById(imageId).getName();

            int index = pathUrl.indexOf("target");
            String pathFolder = pathUrl.substring(0, index) + "\\src\\main\\webapp\\resources-management\\img";

            Path path = Paths.get(pathFolder + File.separator + fileName);

            Files.delete(path);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //delete image in database
        imageService.deleteImage(imageId);

        model.addAttribute("service", serviceService.getServiceById(serviceId));
        model.addAttribute("action", "edit");
        return "/manager/service";
    }

    //Export Excel
    @RequestMapping("/bookings/export/excel")
    public void exportToExcel(HttpServletResponse response, HttpServletRequest request) throws IOException {

        response.setContentType("application/octet-stream");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=bookings_" + currentDateTime + ".xlsx";
        response.setHeader(headerKey, headerValue);

        HttpSession session = request.getSession();
        List<BookingEntity> listBookings = (List<BookingEntity>) session.getAttribute("bookings");
        
        if(listBookings == null) {
            listBookings = bookingService.listAll();
        }

        BookingExcelExporter excelExporter = new BookingExcelExporter(listBookings);
        session.removeAttribute("bookings");

        excelExporter.export(response);
    }

    //Export PDF
    @RequestMapping(value = "/bookingDetails/export/pdf/{bookingId}", method = RequestMethod.GET)
    public void exportToPDF(HttpServletResponse response, HttpServletRequest request,
            @PathVariable("bookingId") int bookingId) throws DocumentException, IOException {
        response.setContentType("application/pdf");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=bookingDetails_" + currentDateTime + ".pdf";
        response.setHeader(headerKey, headerValue);

        BookingEntity booking = bookingService.getBookingById(bookingId);

        PDFExporter pdfExporter = new PDFExporter(booking,
                flightService, bookingDetailService,
                aircraftSeatService, serviceService,
                serviceBookingService, promotionService);
        pdfExporter.export(response, request);

    }
}
