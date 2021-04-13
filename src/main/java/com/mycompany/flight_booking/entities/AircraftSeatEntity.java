/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.DecimalMin;

/**
 *
 * @author TIEN
 */
@Entity
@Table(name = "aircraft_seat")
public class AircraftSeatEntity {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    private double price;
    
    @ManyToOne
    @JoinColumn(name = "aircraft_id")
    private AircraftEntity aircraft;
    
    @ManyToOne
    @JoinColumn(name = "flight_id")
    private FlightEntity flight;
    
    @ManyToOne
    @JoinColumn(name = "seat_id")
    private SeatEntity seat;
    
    @ManyToOne
    @JoinColumn(name = "seat_status_id")
    private SeatStatusEntity seatStatus;
    
    @ManyToOne
    @JoinColumn(name = "seat_type_id")
    private SeatTypeEntity seatType;

    public AircraftSeatEntity() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public AircraftEntity getAircraft() {
        return aircraft;
    }

    public void setAircraft(AircraftEntity aircraft) {
        this.aircraft = aircraft;
    }

    public FlightEntity getFlight() {
        return flight;
    }

    public void setFlight(FlightEntity flight) {
        this.flight = flight;
    }

    public SeatEntity getSeat() {
        return seat;
    }

    public void setSeat(SeatEntity seat) {
        this.seat = seat;
    }

    public SeatStatusEntity getSeatStatus() {
        return seatStatus;
    }

    public void setSeatStatus(SeatStatusEntity seatStatus) {
        this.seatStatus = seatStatus;
    }

    public SeatTypeEntity getSeatType() {
        return seatType;
    }

    public void setSeatType(SeatTypeEntity seatType) {
        this.seatType = seatType;
    }
    
    
}
