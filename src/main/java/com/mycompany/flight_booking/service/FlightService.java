/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.service;

import com.mycompany.flight_booking.entities.FlightEntity;
import com.mycompany.flight_booking.repository.FlightRepository;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author TIEN
 */
@Service
public class FlightService {
    
    @Autowired
    private FlightRepository flightRepository;
    
    public List<FlightEntity> getFlights() {
        return (List<FlightEntity>) flightRepository.findAll();
    }
    
    public FlightEntity getFlightById(int id) {
        Optional<FlightEntity> optional = flightRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        } else {
            return new FlightEntity();
        }
    }
    
    public void saveFlight(FlightEntity flightEntity) {
        flightRepository.save(flightEntity);
    }
    
    public void deleteFlight(int id) {
        flightRepository.deleteById(id);
    }
    
    public List<FlightEntity> getFlightsBetweenDate(Date startDate, Date endDate) {
        return flightRepository.getFlightsBetweenDate(startDate, endDate);
    }
    
    public List<FlightEntity> getListFlightsByListFlightId(List<Integer> listFlightId) {
        return flightRepository.findListFlightsByListFlightId(listFlightId);
    }
    
    public List<FlightEntity> getFlightsFromDate(Date startDate) {
        return flightRepository.getFlightsFromDate(startDate);
    }
    
    public List<FlightEntity> getListFlightByBookingId(int bookingId) {
        return flightRepository.getListFlightByBookingId(bookingId);
    }
    
    public List<FlightEntity> getListFlightByPromotionId(int promotionId) {
        return flightRepository.getListFlightByPromotionId(promotionId);
    }
}
