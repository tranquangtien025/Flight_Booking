/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.service;

import com.mycompany.flight_booking.entities.AircraftEntity;
import com.mycompany.flight_booking.entities.CityEntity;
import com.mycompany.flight_booking.entities.CountryEntity;
import com.mycompany.flight_booking.repository.AircraftRepository;
import com.mycompany.flight_booking.repository.CityRepository;
import com.mycompany.flight_booking.repository.CountryRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author TIEN
 */
@Service
public class CityService {
    
    @Autowired
    private CityRepository cityRepository;
    
    public List<CityEntity> getCities() {
        return (List<CityEntity>) cityRepository.findAll();
    }
    
    public CityEntity getCityById(int id) {
        Optional<CityEntity> optional = cityRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        } else {
            return new CityEntity();
        }
    }
    
    public void saveCity(CityEntity cityEntity) {
        cityRepository.save(cityEntity);
    }
    
    public void deleteCity(int id) {
        cityRepository.deleteById(id);
    }
    
    public List<String> getCitiesByCountry(String countryName) {
        return (List<String>) cityRepository.findCitiesByCountry(countryName);
    }
}
