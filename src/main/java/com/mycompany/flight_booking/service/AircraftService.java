/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.service;

import com.mycompany.flight_booking.entities.AircraftEntity;
import com.mycompany.flight_booking.entities.ImageEntity;
import com.mycompany.flight_booking.repository.AircraftRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author TIEN
 */
@Service
public class AircraftService {
    
    @Autowired
    private AircraftRepository aircraftRepository;
    
    public List<AircraftEntity> getAircrafts() {
        return (List<AircraftEntity>) aircraftRepository.findAll();
    }
    
    public AircraftEntity getAircraftById(int id) {
        Optional<AircraftEntity> optional = aircraftRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        } else {
            return new AircraftEntity();
        }
    }
    
    public void saveAircraft(AircraftEntity aircraftEntity) {
        aircraftRepository.save(aircraftEntity);
    }
    
    public void deleteAircraft(int id) {
        aircraftRepository.deleteById(id);
    }
    
    public String findFirstImageOfAircraft(int aircraftId) {
        return aircraftRepository.findFirstImageOfAircraft(aircraftId);
    }
}
