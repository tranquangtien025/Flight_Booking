/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.entities;

import com.mycompany.flight_booking.enums.AirportStatus;
import java.io.Serializable;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
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
@Table(name = "airport")
public class AirportEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    private String name;
    
    @Enumerated(EnumType.STRING)
    private AirportStatus status;
    
    @OneToMany(mappedBy = "departure")
    private Set<FlightRouteEntity> flightRoutes1;
    
    @OneToMany(mappedBy = "destination")
    private Set<FlightRouteEntity> flightRoutes2;
    
    @OneToMany(mappedBy = "airport", fetch = FetchType.EAGER)
    private Set<ImageEntity> images;
    
    @ManyToOne
    @JoinColumn(name = "city_id")
    private CityEntity city;

    public AirportEntity() {
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

    public AirportStatus getStatus() {
        return status;
    }

    public void setStatus(AirportStatus status) {
        this.status = status;
    }

    public Set<FlightRouteEntity> getFlightRoutes1() {
        return flightRoutes1;
    }

    public void setFlightRoutes1(Set<FlightRouteEntity> flightRoutes1) {
        this.flightRoutes1 = flightRoutes1;
    }

    public Set<FlightRouteEntity> getFlightRoutes2() {
        return flightRoutes2;
    }

    public void setFlightRoutes2(Set<FlightRouteEntity> flightRoutes2) {
        this.flightRoutes2 = flightRoutes2;
    }

    public Set<ImageEntity> getImages() {
        return images;
    }

    public void setImages(Set<ImageEntity> images) {
        this.images = images;
    }

    public CityEntity getCity() {
        return city;
    }

    public void setCity(CityEntity city) {
        this.city = city;
    }

    
    
}
