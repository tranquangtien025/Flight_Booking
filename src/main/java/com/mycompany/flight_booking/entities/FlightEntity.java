package com.mycompany.flight_booking.entities;

import com.mycompany.flight_booking.enums.FlightStatus;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name = "flight")
public class FlightEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(name = "flight_number")
    private String flightNumber;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "departure_date")
    private Date departureDate;
    
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "arrival_date")
    private Date arrivalDate;
    
    @Column(name = "arrival_time")
    private String arrivalTime;

    @Column(name = "departure_time")
    private String departureTime;
    
    @Enumerated(EnumType.STRING)
    private FlightStatus status;
    
    @ManyToOne
    @JoinColumn(name = "flight_route_id")
    private FlightRouteEntity flightRoute;

    @ManyToOne
    @JoinColumn(name = "aircraft_id")
    private AircraftEntity aircraft;
    
    @ManyToMany(mappedBy = "flights")
    private List<PromotionEntity> promotions;
    
    @ManyToOne
    @JoinColumn(name = "operation_id")
    private OperationEntity operation;
    
    @OneToMany(mappedBy = "flight")
    private List<BookingDetailEntity> bookingDetails;
    
    @OneToMany(mappedBy = "flight")
    private List<AircraftSeatEntity> aircraftSeats;

    public FlightEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFlightNumber() {
        return flightNumber;
    }

    public void setFlightNumber(String flightNumber) {
        this.flightNumber = flightNumber;
    }

    public Date getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(Date departureDate) {
        this.departureDate = departureDate;
    }

    public Date getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(Date arrivalDate) {
        this.arrivalDate = arrivalDate;
    }    

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public FlightStatus getStatus() {
        return status;
    }

    public void setStatus(FlightStatus status) {
        this.status = status;
    }

    public FlightRouteEntity getFlightRoute() {
        return flightRoute;
    }

    public void setFlightRoute(FlightRouteEntity flightRoute) {
        this.flightRoute = flightRoute;
    }

    public AircraftEntity getAircraft() {
        return aircraft;
    }

    public void setAircraft(AircraftEntity aircraft) {
        this.aircraft = aircraft;
    }

    public List<PromotionEntity> getPromotions() {
        return promotions;
    }

    public void setPromotions(List<PromotionEntity> promotions) {
        this.promotions = promotions;
    }

    public OperationEntity getOperation() {
        return operation;
    }

    public void setOperation(OperationEntity operation) {
        this.operation = operation;
    }

    public List<BookingDetailEntity> getBookingDetails() {
        return bookingDetails;
    }

    public void setBookingDetails(List<BookingDetailEntity> bookingDetails) {
        this.bookingDetails = bookingDetails;
    }

    public List<AircraftSeatEntity> getAircraftSeats() {
        return aircraftSeats;
    }

    public void setAircraftSeats(List<AircraftSeatEntity> aircraftSeats) {
        this.aircraftSeats = aircraftSeats;
    }

    

    
    
}
