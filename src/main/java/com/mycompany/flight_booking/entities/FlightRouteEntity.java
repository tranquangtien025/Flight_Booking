/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.entities;

import com.mycompany.flight_booking.enums.FlightRouteStatus;
import java.io.Serializable;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author TIEN
 */
@Entity
@Table(name = "flight_route")
public class FlightRouteEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    private String duration;
    
    private double distance;    
    
    @Column(name = "economy_price")
    private double economyPrice;
    
    @Column(name = "premium_economy_price")
    private double premiumEconomyPrice;
    
    @Column(name = "business_price")
    private double businessPrice;
    
    @Enumerated(EnumType.STRING)
    private FlightRouteStatus status;
    
    @OneToMany(mappedBy = "flightRoute")
    private Set<FlightEntity> flights;
    
    @ManyToOne
    @JoinColumn(name = "departure_id")
    private AirportEntity departure;
    
    @ManyToOne
    @JoinColumn(name = "destination_id")
    private AirportEntity destination;

    public FlightRouteEntity() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    public double getEconomyPrice() {
        return economyPrice;
    }

    public void setEconomyPrice(double economyPrice) {
        this.economyPrice = economyPrice;
    }

    public double getPremiumEconomyPrice() {
        return premiumEconomyPrice;
    }

    public void setPremiumEconomyPrice(double premiumEconomyPrice) {
        this.premiumEconomyPrice = premiumEconomyPrice;
    }

    public double getBusinessPrice() {
        return businessPrice;
    }

    public void setBusinessPrice(double businessPrice) {
        this.businessPrice = businessPrice;
    }

    public FlightRouteStatus getStatus() {
        return status;
    }

    public void setStatus(FlightRouteStatus status) {
        this.status = status;
    }

    public Set<FlightEntity> getFlights() {
        return flights;
    }

    public void setFlights(Set<FlightEntity> flights) {
        this.flights = flights;
    }

    public AirportEntity getDeparture() {
        return departure;
    }

    public void setDeparture(AirportEntity departure) {
        this.departure = departure;
    }

    public AirportEntity getDestination() {
        return destination;
    }

    public void setDestination(AirportEntity destination) {
        this.destination = destination;
    }
    
    
}
