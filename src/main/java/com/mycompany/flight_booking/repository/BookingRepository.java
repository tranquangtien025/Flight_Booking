/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.repository;

import com.mycompany.flight_booking.entities.BookingEntity;
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
public interface BookingRepository extends CrudRepository<BookingEntity, Integer>, JpaRepository<BookingEntity, Integer>{
    
    @Query(value = "select * from booking"
            + " where booking_date between ?1 and ?2", nativeQuery = true)
    public List<BookingEntity> getByBookingDateBetween(String from, String to);
    
    public List<BookingEntity> findByBookingNumberLike(String strSearch);
    
    @Query(value = "SELECT b.* FROM booking b "
            + "WHERE CONCAT(b.address, ' ', b.birthday, ' ', b.full_name, ' ', b.gender, ' ',"
            + " b.phone_number, ' ', b.booking_date, ' ', b.booking_number, ' ', b.status)"
            + " LIKE %?1%", nativeQuery = true)
    public List<BookingEntity> search(String keyword);
    
    public List<BookingEntity> findByPhoneNumberLike(String phoneNumber);
}
