/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.entities;

import com.mycompany.flight_booking.enums.SeatStatus;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
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
@Table(name = "seat_status")
public class SeatStatusEntity {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    @Enumerated(EnumType.STRING)
    private SeatStatus status;
    
    @OneToMany(mappedBy = "seatStatus")
    private Set<AircraftSeatEntity> aircraftSeats;

    public SeatStatusEntity() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public SeatStatus getStatus() {
        return status;
    }

    public void setStatus(SeatStatus status) {
        this.status = status;
    }

    public Set<AircraftSeatEntity> getAircraftSeats() {
        return aircraftSeats;
    }

    public void setAircraftSeats(Set<AircraftSeatEntity> aircraftSeats) {
        this.aircraftSeats = aircraftSeats;
    }
    
    
    
}
