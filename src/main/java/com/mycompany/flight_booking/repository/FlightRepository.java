/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.repository;

import com.mycompany.flight_booking.entities.FlightEntity;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author TIEN
 */
@Repository
public interface FlightRepository extends CrudRepository<FlightEntity, Integer>, JpaRepository<FlightEntity, Integer>{
    
    @Query(value = "select f.* from flight f"
            + " where f.departure_date between ?1 and ?2", nativeQuery = true)
    public List<FlightEntity> getFlightsBetweenDate(Date startDate, Date endDate);
    
    @Query(value = "select f.* from flight f"
            + " where f.id in ?1", nativeQuery = true)
    public List<FlightEntity> findListFlightsByListFlightId(List<Integer> listFlightId);
    
    @Query(value = "select f.* from flight f"
            + " where f.departure_date >= ?1", nativeQuery = true)
    public List<FlightEntity> getFlightsFromDate(Date startDate);
    
    @Query(value = "select f.* from flight f"
            + " join booking_detail bd on bd.flight_id = f.id"
            + " join booking b on b.id = bd.booking_id"
            + " where b.id = ?1"
            + " group by f.id", nativeQuery = true)
    public List<FlightEntity> getListFlightByBookingId(int bookingId);
    
    @Query(value = "select f.* from flight f"
            + " join promotion_flight_relationship pfr on pfr.flight_id = f.id"
            + " join promotion p on p.id = pfr.promotion_id"
            + " where p.id = ?1"
            + " order by f.departure_date, f.departure_time", nativeQuery = true)
    public List<FlightEntity> getListFlightByPromotionId(int promotionId);
}
