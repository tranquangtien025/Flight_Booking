/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.service;

import com.mycompany.flight_booking.entities.ServiceEntity;
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
public class ServiceService {
    
    @Autowired
    private ServiceRepository serviceRepository;
    
    public List<ServiceEntity> getServices() {
        return (List<ServiceEntity>) serviceRepository.findAll();
    }
        
    public ServiceEntity getServiceById(int id) {
        Optional<ServiceEntity> optional = serviceRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        } else {
            return new ServiceEntity();
        }
    }
    
    public void saveService(ServiceEntity serviceEntity) {
        serviceRepository.save(serviceEntity);
    }
    
    public void deleteService(int serviceId) {
        serviceRepository.deleteById(serviceId);
    }
        
    public String findFirstImageOfService(int serviceId) {
        return serviceRepository.findFirstImageOfService(serviceId);
    }
    
    public List<ServiceEntity> getListServiceOfPassenger(int bookingDetailId) {
        return serviceRepository.findListServiceOfBookingDetail(bookingDetailId);
    }
    
    public List<String> getListServiceNamesOfBookingDetail(int bookingDetailId) {
        return serviceRepository.getListServiceNamesOfBookingDetail(bookingDetailId);
    }
}
