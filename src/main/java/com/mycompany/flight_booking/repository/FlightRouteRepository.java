/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.repository;

import com.mycompany.flight_booking.entities.FlightRouteEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author TIEN
 */
@Repository
public interface FlightRouteRepository extends CrudRepository<FlightRouteEntity, Integer>{
    
    @Query(value = "select fr.* from flight_route fr"
            + " join flight f on f.flight_route_id = fr.id"
            + " join promotion_flight_relationship pfr on pfr.flight_id = f.id"
            + " join promotion p on p.id = pfr.promotion_id"
            + " where p.id = ?1", nativeQuery = true)
    public List<FlightRouteEntity> getListFlightRoutesOfPromotion(int promotionId);
}
