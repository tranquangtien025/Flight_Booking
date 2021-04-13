/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.service;

import com.mycompany.flight_booking.entities.ServiceBookingEntity;
import com.mycompany.flight_booking.entities.ServiceEntity;
import com.mycompany.flight_booking.repository.ServiceBookingRepository;
import com.mycompany.flight_booking.repository.ServiceRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author TIEN
 */
@Service
public class ServiceBookingService {
    
    @Autowired
    private ServiceBookingRepository serviceBookingRepository;
    
    public List<ServiceBookingEntity> getListServiceBookingOfBookingDetail(int bookingDetailId) {
        return serviceBookingRepository.getListServiceBookingOfBookingDetail(bookingDetailId);
    }
}
