/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.repository;

import com.mycompany.flight_booking.entities.AirportEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author TIEN
 */
@Repository
public interface AirportRepository extends CrudRepository<AirportEntity, Integer>{
    
    @Query(value = "select a.name from flight_route fr"
            + " join airport a on a.id = fr.destination_id"
            + " where fr.departure_id = (select a.id from airport a where a.name like ?1)"
            + " group by a.name;", nativeQuery = true)
    public List<String> findDestination(String departure);
    
//    @Query("select f.destinationAirport.name from FlightRouteEntity f where"
//            + " f.departureAirport.name like ?1"
//            + " group by f.destinationAirport.name")
//    public List<String> findDestination(String departure);
    
    public List<AirportEntity> findByNameLike(String name);
    
    @Query(value = "select i.name from image i"
            + " join airport a on a.id = i.airport_id"
            + " where a.id = ?1"
            + " limit 1", nativeQuery = true)
    public String findFirstImageOfAirport(int airportId);
}
