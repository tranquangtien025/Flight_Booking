/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.service;

import com.mycompany.flight_booking.entities.PromotionEntity;
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
public class PromotionService {
    
    @Autowired
    private PromotionRepository promotionRepository;
    
    public List<PromotionEntity> getPromotions() {
        return (List<PromotionEntity>) promotionRepository.findAll();
    }
    
    public PromotionEntity getPromotionById(int id) {
        Optional<PromotionEntity> optional = promotionRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        } else {
            return new PromotionEntity();
        }
    }
    
    public void savePromotion(PromotionEntity promotionEntity) {
        promotionRepository.save(promotionEntity);
    }
    
    public void deletePromotion(int id) {
        promotionRepository.deleteById(id);
    }
    
    public void saveAndFlush(PromotionEntity promotionEntity) {
        promotionRepository.saveAndFlush(promotionEntity);
    }
    
    public List<String> getListFlightsOfPromotion(int promotionId) {
        return promotionRepository.findListFlightsOfPromotion(promotionId);
    }
    
    public List<Integer> getListFlightIdOfPromotion(int promotionId) {
        return promotionRepository.findListFlightIdOfPromotion(promotionId);
    }
    
    public List<PromotionEntity> getListPromotionOfBookingDetail(int bookingDetailId) {
        return promotionRepository.getListPromotionOfBookingDetail(bookingDetailId);
    }
    
    public List<PromotionEntity> getListPromotionsAvailable() {
        return promotionRepository.getListPromotionsAvailable();
    }
    
    public List<PromotionEntity> getListPromotionNameLike(String name) {
        return promotionRepository.findByNameLike(name);
    }
}
