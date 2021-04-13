/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.repository;

import com.mycompany.flight_booking.entities.AircraftEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author TIEN
 */
@Repository
public interface AircraftRepository extends CrudRepository<AircraftEntity, Integer>{
    
    @Query(value = "select i.name from image i"
            + " join aircraft a on a.id = i.aircraft_id"
            + " where a.id = ?1"
            + " limit 1", nativeQuery = true)
    public String findFirstImageOfAircraft(int aircraftId);
}
