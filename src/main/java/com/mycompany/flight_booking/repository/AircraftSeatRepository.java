/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.repository;

import com.mycompany.flight_booking.entities.AircraftSeatEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author TIEN
 */
@Repository
public interface AircraftSeatRepository extends CrudRepository<AircraftSeatEntity, Integer>{
    
    @Query(value = "select a.* from aircraft_seat a"
            + " join flight f on f.id = a.flight_id"
            + " join seat s on s.id = a.seat_id"
            + " where f.id = ?1"
            + " and s.id = ?2", nativeQuery = true)
    public AircraftSeatEntity getAircraftSeatOfBookingDetail(int flightId, int seatId);
    
}
