/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author TIEN
 */
@Entity
@Table(name = "image")
public class ImageEntity {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    private String name;
    
    @ManyToOne
    @JoinColumn(name = "service_id")
    private ServiceEntity service;
    
    @ManyToOne
    @JoinColumn(name = "aircraft_id")
    private AircraftEntity aircraft;
    
    @ManyToOne
    @JoinColumn(name = "airport_id")
    private AirportEntity airport;

    public ImageEntity() {
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

    public ServiceEntity getService() {
        return service;
    }

    public void setService(ServiceEntity service) {
        this.service = service;
    }

    public AircraftEntity getAircraft() {
        return aircraft;
    }

    public void setAircraft(AircraftEntity aircraft) {
        this.aircraft = aircraft;
    }

    public AirportEntity getAirport() {
        return airport;
    }

    public void setAirport(AirportEntity airport) {
        this.airport = airport;
    }
    
    
}
