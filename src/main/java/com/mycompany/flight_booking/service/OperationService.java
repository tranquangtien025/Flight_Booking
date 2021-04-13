/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.service;

import com.mycompany.flight_booking.entities.OperationEntity;
import com.mycompany.flight_booking.entities.PromotionEntity;
import com.mycompany.flight_booking.repository.OperationRepository;
import com.mycompany.flight_booking.repository.PromotionRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author TIEN
 */
@Service
public class OperationService {
    
    @Autowired
    private OperationRepository operationRepository;
    
    public List<OperationEntity> getOperations() {
        return (List<OperationEntity>) operationRepository.findAll();
    }
    
    public OperationEntity getOperationById(int id) {
        Optional<OperationEntity> optional = operationRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        } else {
            return new OperationEntity();
        }
    }
    
    public void saveOperation(OperationEntity operationEntity) {
        operationRepository.save(operationEntity);
    }
    
    public void deleteOperation(int id) {
        operationRepository.deleteById(id);
    }
}
