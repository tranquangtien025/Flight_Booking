/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.service;

import com.mycompany.flight_booking.entities.AircraftEntity;
import com.mycompany.flight_booking.entities.FlightRouteEntity;
import com.mycompany.flight_booking.repository.AircraftRepository;
import com.mycompany.flight_booking.repository.FlightRouteRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author TIEN
 */
@Service
public class FlightRouteService {
    
    @Autowired
    private FlightRouteRepository flightRouteRepository;
    
    public List<FlightRouteEntity> getFlightRoutes() {
        return (List<FlightRouteEntity>) flightRouteRepository.findAll();
    }
    
    public FlightRouteEntity getFlightRouteById(int id) {
        Optional<FlightRouteEntity> optional = flightRouteRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        } else {
            return new FlightRouteEntity();
        }
    }
    
    public void saveFlightRoute(FlightRouteEntity flightRouteEntity) {
        flightRouteRepository.save(flightRouteEntity);
    }
    
    public void deleteFlightRoute(int id) {
        flightRouteRepository.deleteById(id);
    }
    
    public List<FlightRouteEntity> getListFlightRoutesOfPromotion(int promotionId) {
        return flightRouteRepository.getListFlightRoutesOfPromotion(promotionId);
    }
}
