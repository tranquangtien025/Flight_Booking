/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.service;

import com.mycompany.flight_booking.entities.AircraftEntity;
import com.mycompany.flight_booking.entities.AircraftSeatEntity;
import com.mycompany.flight_booking.repository.AircraftSeatRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author TIEN
 */
@Service
public class AircraftSeatService {
    
    @Autowired
    private AircraftSeatRepository aircraftSeatRepository;
    
    public List<AircraftSeatEntity> getAircraftSeats() {
        return (List<AircraftSeatEntity>) aircraftSeatRepository.findAll();
    }
    
    public AircraftSeatEntity getAircraftSeatById(int id) {
        Optional<AircraftSeatEntity> optional = aircraftSeatRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        } else {
            return new AircraftSeatEntity();
        }
    }
    
    public void saveAircraftSeat(AircraftSeatEntity aircraftSeatEntity) {
        aircraftSeatRepository.save(aircraftSeatEntity);
    }
    
    public void deleteAircraftSeat(int id) {
        aircraftSeatRepository.deleteById(id);
    }
    
    public AircraftSeatEntity getAircraftSeatOfBookingDetail(int flightId, int seatId) {
        return aircraftSeatRepository.getAircraftSeatOfBookingDetail(flightId, seatId);
    }
    
    public void deleteAircraftSeatOfBookingDetail(int flightId, int seatId) {
        AircraftSeatEntity a = aircraftSeatRepository.getAircraftSeatOfBookingDetail(flightId, seatId);
        aircraftSeatRepository.delete(a);
    }
}
