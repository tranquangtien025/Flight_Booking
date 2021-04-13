/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.service;

import com.mycompany.flight_booking.entities.AircraftEntity;
import com.mycompany.flight_booking.entities.CountryEntity;
import com.mycompany.flight_booking.repository.AircraftRepository;
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
public class CountryService {
    
    @Autowired
    private CountryRepository countryRepository;
    
    public List<CountryEntity> getCountries() {
        return (List<CountryEntity>) countryRepository.findAll();
    }
    
    public CountryEntity getCountryById(int id) {
        Optional<CountryEntity> optional = countryRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        } else {
            return new CountryEntity();
        }
    }
    
    public void saveCountry(CountryEntity countryEntity) {
        countryRepository.save(countryEntity);
    }
    
    public void deleteAircraft(int id) {
        countryRepository.deleteById(id);
    }
}
