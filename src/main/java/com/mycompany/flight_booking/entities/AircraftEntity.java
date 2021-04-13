/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.entities;

import com.mycompany.flight_booking.enums.AircraftStatus;
import java.io.Serializable;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author TIEN
 */
@Entity
@Table(name = "aircraft")
public class AircraftEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    private String name;
    
    private String number;
    
    @Column(name = "economy_begin_row")
    private Integer economyBeginRow;
    
    @Column(name = "economy_end_row")
    private Integer economyEndRow;
    
    @Column(name = "premium_economy_begin_row")
    private Integer premiumEconomyBeginRow;
    
    @Column(name = "premium_economy_end_row")
    private Integer premiumEconomyEndRow;
    
    @Column(name = "business_begin_row")
    private Integer businessBeginRow;
    
    @Column(name = "business_end_row")
    private Integer businessEndRow;
    
    @Column(name = "economy_cols")
    private String economyCols;
    
    @Column(name = "premium_economy_cols")
    private String premiumEconomyCols;
    
    @Column(name = "business_cols")
    private String businessCols;
    
    @Enumerated(EnumType.STRING)
    private AircraftStatus status;
    
    @OneToMany(mappedBy = "aircraft", fetch = FetchType.EAGER)
    private Set<ImageEntity> images;
    
    @OneToMany(mappedBy = "aircraft")
    private Set<FlightEntity> flights;
    
    @OneToMany(mappedBy = "aircraft")
    private Set<AircraftSeatEntity> airraftSeats;

    public AircraftEntity() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public Integer getEconomyBeginRow() {
        return economyBeginRow;
    }

    public void setEconomyBeginRow(Integer economyBeginRow) {
        this.economyBeginRow = economyBeginRow;
    }

    public Integer getEconomyEndRow() {
        return economyEndRow;
    }

    public void setEconomyEndRow(Integer economyEndRow) {
        this.economyEndRow = economyEndRow;
    }

    public Integer getPremiumEconomyBeginRow() {
        return premiumEconomyBeginRow;
    }

    public void setPremiumEconomyBeginRow(Integer premiumEconomyBeginRow) {
        this.premiumEconomyBeginRow = premiumEconomyBeginRow;
    }

    public Integer getPremiumEconomyEndRow() {
        return premiumEconomyEndRow;
    }

    public void setPremiumEconomyEndRow(Integer premiumEconomyEndRow) {
        this.premiumEconomyEndRow = premiumEconomyEndRow;
    }

    public Integer getBusinessBeginRow() {
        return businessBeginRow;
    }

    public void setBusinessBeginRow(Integer businessBeginRow) {
        this.businessBeginRow = businessBeginRow;
    }

    public Integer getBusinessEndRow() {
        return businessEndRow;
    }

    public void setBusinessEndRow(Integer businessEndRow) {
        this.businessEndRow = businessEndRow;
    }

    public String getEconomyCols() {
        return economyCols;
    }

    public void setEconomyCols(String economyCols) {
        this.economyCols = economyCols;
    }

    public String getPremiumEconomyCols() {
        return premiumEconomyCols;
    }

    public void setPremiumEconomyCols(String premiumEconomyCols) {
        this.premiumEconomyCols = premiumEconomyCols;
    }

    public String getBusinessCols() {
        return businessCols;
    }

    public void setBusinessCols(String businessCols) {
        this.businessCols = businessCols;
    }

    

    public AircraftStatus getStatus() {
        return status;
    }

    public void setStatus(AircraftStatus status) {
        this.status = status;
    }

    public Set<ImageEntity> getImages() {
        return images;
    }

    public void setImages(Set<ImageEntity> images) {
        this.images = images;
    }

    public Set<FlightEntity> getFlights() {
        return flights;
    }

    public void setFlights(Set<FlightEntity> flights) {
        this.flights = flights;
    }

    public Set<AircraftSeatEntity> getAirraftSeats() {
        return airraftSeats;
    }

    public void setAirraftSeats(Set<AircraftSeatEntity> airraftSeats) {
        this.airraftSeats = airraftSeats;
    }

    
}
