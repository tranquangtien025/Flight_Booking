/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.exporter;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.mycompany.flight_booking.entities.BookingDetailEntity;
import com.mycompany.flight_booking.entities.BookingEntity;
import com.mycompany.flight_booking.entities.FlightEntity;
import com.mycompany.flight_booking.entities.PromotionEntity;
import com.mycompany.flight_booking.entities.ServiceBookingEntity;
import com.mycompany.flight_booking.enums.SeatType;
import com.mycompany.flight_booking.service.AircraftSeatService;
import com.mycompany.flight_booking.service.BookingDetailService;
import com.mycompany.flight_booking.service.FlightService;
import com.mycompany.flight_booking.service.PromotionService;
import com.mycompany.flight_booking.service.ServiceBookingService;
import com.mycompany.flight_booking.service.ServiceService;
import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TIEN
 */
public class PDFExporter {

    private BookingEntity booking;
    private FlightService flightService;
    private AircraftSeatService aircraftSeatService;
    private BookingDetailService bookingDetailService;
    private ServiceService serviceService;
    private ServiceBookingService serviceBookingService;
    private PromotionService promotionService;

    public PDFExporter(BookingEntity booking,
            FlightService flightService,
            BookingDetailService bookingDetailService,
            AircraftSeatService aircraftSeatService,
            ServiceService serviceService,
            ServiceBookingService serviceBookingService,
            PromotionService promotionService) {
        this.booking = booking;
        this.flightService = flightService;
        this.bookingDetailService = bookingDetailService;
        this.aircraftSeatService = aircraftSeatService;
        this.serviceService = serviceService;
        this.serviceBookingService = serviceBookingService;
        this.promotionService = promotionService;
    }

    //bookingTable
    private PdfPTable bookingTable() {
        PdfPTable bookingTable = new PdfPTable(3);
        bookingTable.setWidthPercentage(100f);
        bookingTable.setWidths(new float[]{3.0f, 3.0f, 3.0f});
        bookingTable.setSpacingBefore(10);

        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(Color.darkGray);
        cell.setPadding(8);

        Font font = FontFactory.getFont(FontFactory.HELVETICA);
        font.setColor(Color.WHITE);

        cell.setPhrase(new Phrase("Booking Date", font));
        bookingTable.addCell(cell);

        cell.setPhrase(new Phrase("Booking Number", font));
        bookingTable.addCell(cell);

        cell.setPhrase(new Phrase("Booking Status", font));
        bookingTable.addCell(cell);

        SimpleDateFormat formatter1 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        
        bookingTable.addCell(formatter1.format(booking.getBookingDate()));
        bookingTable.addCell(booking.getBookingNumber());
        bookingTable.addCell(booking.getStatus().toString());

        return bookingTable;
    }

    //flightTable
    private List<PdfPTable> listTables() {
        List<PdfPTable> listTables = new ArrayList<PdfPTable>();

        for (FlightEntity flight : flightService.getListFlightByBookingId(booking.getId())) {
            PdfPTable flightTable = new PdfPTable(4);
            flightTable.setWidthPercentage(100f);
            flightTable.setWidths(new float[]{3.0f, 3.0f, 3.0f, 3.0f});
            flightTable.setSpacingBefore(10);

            PdfPCell cell;
            
            SimpleDateFormat formatter2 = new SimpleDateFormat("EEEEE dd MMMMM yyyy");
            
            cell = new PdfPCell(new Phrase("DEPARTURE: " + formatter2.format(flight.getDepartureDate()) + " - ARRIVAL: " + formatter2.format(flight.getArrivalDate())));
            cell.setColspan(4);
            cell.setBackgroundColor(Color.LIGHT_GRAY);
            flightTable.addCell(cell);

            cell = new PdfPCell(new Phrase(flight.getOperation().getName() + "\n" + flight.getFlightNumber() + "\n\nDuration:\n" + flight.getFlightRoute().getDuration()));
            cell.setRowspan(2);
            flightTable.addCell(cell);

            cell = new PdfPCell(new Phrase(flight.getFlightRoute().getDeparture().getName() + " > " + flight.getFlightRoute().getDestination().getName()));
            cell.setColspan(2);
            flightTable.addCell(cell);

            cell = new PdfPCell(new Phrase("Aircraft:\n" + flight.getAircraft().getName() + "\n" + flight.getAircraft().getNumber() + "\n\n" + flight.getStatus()));
            cell.setRowspan(2);
            flightTable.addCell(cell);

            flightTable.addCell("Departing At:\n" + flight.getDepartureTime() + "\n\nTerminal:\nTERMINAL 2");
            flightTable.addCell("Arriving At:\n" + flight.getArrivalTime() + "\n\nTerminal:\nTERMINAL 2");

            cell = new PdfPCell(passengerTable(flight));
            cell.setColspan(4);
            flightTable.addCell(cell);

            listTables.add(flightTable);
        }
        return listTables;
    }

    //passengerTable
    private PdfPTable passengerTable(FlightEntity flight) {
        PdfPTable passengerTable = new PdfPTable(6);
        passengerTable.setWidthPercentage(100f);
        passengerTable.setWidths(new float[]{3.0f, 3.0f, 3.0f, 3.0f, 3.0f, 3.0f});
        passengerTable.setSpacingBefore(10);

        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(Color.darkGray);
        cell.setPadding(8);

        Font font = FontFactory.getFont(FontFactory.HELVETICA);
        font.setColor(Color.WHITE);

        cell.setPhrase(new Phrase("Passenger Name", font));
        passengerTable.addCell(cell);

        cell.setPhrase(new Phrase("Gender", font));
        passengerTable.addCell(cell);

        cell.setPhrase(new Phrase("Seat", font));
        passengerTable.addCell(cell);

        cell.setPhrase(new Phrase("Class", font));
        passengerTable.addCell(cell);

        cell.setPhrase(new Phrase("Ticket", font));
        passengerTable.addCell(cell);

        cell.setPhrase(new Phrase("Service", font));
        passengerTable.addCell(cell);

        for (BookingDetailEntity bd : bookingDetailService.getListBookingDetailOfBookingAndFlight(booking.getId(), flight.getId())) {
            passengerTable.addCell(bd.getPassenger().getFullName());
            passengerTable.addCell(bd.getPassenger().getGender().toString());
            passengerTable.addCell(bd.getSeat().getNumber());
            passengerTable.addCell(aircraftSeatService.getAircraftSeatOfBookingDetail(bd.getFlight().getId(), bd.getSeat().getId()).getSeatType().getSeatType().toString());
            passengerTable.addCell(bd.getTicketType().getTicketType().toString());
            passengerTable.addCell(new PdfPCell(serviceTable(bd)));
        }
        return passengerTable;
    }

    private PdfPTable serviceTable(BookingDetailEntity bd) {
        PdfPTable serviceTable = new PdfPTable(1);
        serviceTable.setWidths(new float[]{1.5f});
        for (String serviceName : serviceService.getListServiceNamesOfBookingDetail(bd.getId())) {
            serviceTable.addCell(serviceName);
        }

        return serviceTable;
    }

    public void export(HttpServletResponse response, HttpServletRequest request) throws DocumentException, IOException {
        Document document = new Document(PageSize.A4);
        PdfWriter.getInstance(document, response.getOutputStream());

        document.open();
        Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
        font.setSize(18);
        font.setColor(Color.darkGray);

        ServletContext context = request.getServletContext();
        String pathUrl = context.getRealPath("/img");

        int index = pathUrl.indexOf("target");
        String pathFolder = pathUrl.substring(0, index) + "\\src\\main\\webapp\\resources-management\\img";
        Image image = Image.getInstance(pathFolder + File.separator + "logo.png");
        image.scaleAbsolute(50f, 50f);
        image.setAlignment(image.ALIGN_CENTER);
        document.add(image);

        Paragraph p = new Paragraph("INVOICE", font);
        p.setAlignment(Paragraph.ALIGN_CENTER);

        document.add(p);

        document.add(bookingTable());

        for (PdfPTable table : listTables()) {
            document.add(table);
        }

        Font totalFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
        font.setSize(14);
        font.setColor(Color.darkGray);

        Paragraph total = new Paragraph("Total Cost: " + totalCost(bookingDetailService.getListBookingDetailOfBooking(booking.getId())) + " VND", totalFont);
        total.setAlignment(Paragraph.ALIGN_RIGHT);

        document.add(total);

        document.close();
    }

    public String totalCost(List<BookingDetailEntity> BookingDetailList) {
        double totalCost = 0;
        for (BookingDetailEntity bd : BookingDetailList) {
            totalCost += unitPriceOfBookingDetail(bd) - discountOfBookingDetail(bd);
//            totalCost += bd.getUnitPrice() - bd.getDiscount();
        }

        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getInstance(localeVN);
        return (String) currencyVN.format(totalCost);
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
