/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.repository;

import com.mycompany.flight_booking.entities.ServiceBookingEntity;
import com.mycompany.flight_booking.entities.ServiceEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author TIEN
 */
@Repository
public interface ServiceBookingRepository extends CrudRepository<ServiceBookingEntity, Integer>{
        
    
    @Query(value = "select sb.* from service_booking sb"
            + " join booking_detail bd on bd.id = sb.booking_detail_id"
            + " where bd.id = ?1", nativeQuery = true)
    public List<ServiceBookingEntity> getListServiceBookingOfBookingDetail(int bookingDetailId);
    
    
}
