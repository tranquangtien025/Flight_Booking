package com.mycompany.flight_booking.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;


/**
 * The persistent class for the booking database table.
 *
 */
@Entity
@Table(name = "booking_detail")
public class BookingDetailEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "unit_price")
    private double unitPrice;

    private double discount;

    @ManyToOne
    @JoinColumn(name = "flight_id")
    private FlightEntity flight;

    @ManyToOne
    @JoinColumn(name = "booking_id")
    private BookingEntity booking;

    @ManyToOne
    @JoinColumn(name = "ticket_type_id")
    private TicketTypeEntity ticketType;

    @ManyToOne
    @JoinColumn(name = "seat_id")
    private SeatEntity seat;
    
    @ManyToOne
    @JoinColumn(name = "passenger_id")
    private PassengerEntity passenger;
 
    @OneToMany(mappedBy = "bookingDetail", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<ServiceBookingEntity> serviceBookings;

    public BookingDetailEntity() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public FlightEntity getFlight() {
        return flight;
    }

    public void setFlight(FlightEntity flight) {
        this.flight = flight;
    }

    public BookingEntity getBooking() {
        return booking;
    }

    public void setBooking(BookingEntity booking) {
        this.booking = booking;
    }

    public TicketTypeEntity getTicketType() {
        return ticketType;
    }

    public void setTicketType(TicketTypeEntity ticketType) {
        this.ticketType = ticketType;
    }

    public SeatEntity getSeat() {
        return seat;
    }

    public void setSeat(SeatEntity seat) {
        this.seat = seat;
    }

    public PassengerEntity getPassenger() {
        return passenger;
    }

    public void setPassenger(PassengerEntity passenger) {
        this.passenger = passenger;
    }

    public List<ServiceBookingEntity> getServiceBookings() {
        return serviceBookings;
    }

    public void setServiceBookings(List<ServiceBookingEntity> serviceBookings) {
        this.serviceBookings = serviceBookings;
    }

    

    
}
