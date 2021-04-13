/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.repository;

import com.mycompany.flight_booking.entities.BookingDetailEntity;
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
public interface BookingDetailRepository extends CrudRepository<BookingDetailEntity, Integer> ,JpaRepository<BookingDetailEntity, Integer> {
    
    @Query(value = "select bd.* from booking_detail bd"
            + " join booking b on b.id = bd.booking_id"
            + " join flight f on f.id = bd.flight_id"
            + " where b.id = ?1"
            + " and f.id = ?2", nativeQuery = true)
    public List<BookingDetailEntity> getListBookingDetailOfBookingAndFlight(int bookingId, int flightId);
    
    @Query(value = "select bd.* from booking_detail bd"
            + " join booking b on b.id = bd.booking_id"
            + " where b.id = ?1", nativeQuery = true)
    public List<BookingDetailEntity> getListBookingDetailOfBooking(int bookingId);
}
