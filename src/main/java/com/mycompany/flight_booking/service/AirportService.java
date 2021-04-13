/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.service;

import com.mycompany.flight_booking.entities.AirportEntity;
import com.mycompany.flight_booking.repository.AirportRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author TIEN
 */
@Service
public class AirportService {
    
    @Autowired
    private AirportRepository airportRepository;
    
    public List<AirportEntity> getAirports() {
        return (List<AirportEntity>) airportRepository.findAll();
    }
    
    public List<String> getDestinationAirports(String name) {
        return (List<String>) airportRepository.findDestination(name);
    }
    
    public AirportEntity getAirportById(int id) {
        Optional<AirportEntity> optional = airportRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        } else {
            return new AirportEntity();
        }
    }
    
    public void saveAirport(AirportEntity airportEntity) {
        airportRepository.save(airportEntity);
    }
    
    public void deleteAirport(int id) {
        airportRepository.deleteById(id);
    }
    
    public List<AirportEntity> getAirportsByName(String name) {
        return airportRepository.findByNameLike(name);
    }
    
    public String findFirstImageOfAirport(int airportId) {
        return airportRepository.findFirstImageOfAirport(airportId);
    }
}
