/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.entities;

import com.mycompany.flight_booking.enums.SeatType;
import java.io.Serializable;
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
@Table(name = "seat_type")
public class SeatTypeEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    @Enumerated(EnumType.STRING)
    private SeatType seatType = SeatType.ECONOMY;
    
    @OneToMany(mappedBy = "seatType")
    private Set<AircraftSeatEntity> aircraftSeats;

    public SeatTypeEntity() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public SeatType getSeatType() {
        return seatType;
    }

    public void setSeatType(SeatType seatType) {
        this.seatType = seatType;
    }
    
    public Set<AircraftSeatEntity> getAircraftSeats() {
        return aircraftSeats;
    }

    public void setAircraftSeats(Set<AircraftSeatEntity> aircraftSeats) {
        this.aircraftSeats = aircraftSeats;
    }

    
}
