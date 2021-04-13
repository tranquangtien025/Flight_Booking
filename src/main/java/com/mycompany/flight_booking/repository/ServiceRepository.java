/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.repository;

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
public interface ServiceRepository extends CrudRepository<ServiceEntity, Integer>{
        
    @Query(value = "select i.name from image i"
            + " join service s on s.id = i.service_id"
            + " where s.id = ?1"
            + " limit 1", nativeQuery = true)
    public String findFirstImageOfService(int serviceId);
    
    @Query(value = "select s from service s"
            + " join service_booking sb on sb.service_id = s.id"
            + " join booking_detail bd on bd.id = sb.booking_id"
            + " where bd.id = ?1", nativeQuery = true)
    public List<ServiceEntity> findListServiceOfBookingDetail(int bookingDetailId);
    
    @Query(value = "select s.name from service s"
            + " join service_booking sb on sb.service_id = s.id"
            + " join booking_detail bd on bd.id = sb.booking_detail_id"
            + " where bd.id = ?1", nativeQuery = true)
    public List<String> getListServiceNamesOfBookingDetail(int bookingDetailId);
}
