/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.repository;

import com.mycompany.flight_booking.entities.PromotionEntity;
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
public interface PromotionRepository extends CrudRepository<PromotionEntity, Integer>, JpaRepository<PromotionEntity, Integer>{
    
    @Query(value = "select f.flight_number from flight f"
            + " join promotion_flight_relationship pfr on pfr.flight_id = f.id"
            + " join promotion p on p.id = pfr.promotion_id"
            + " where p.id = ?1", nativeQuery = true)
    public List<String> findListFlightsOfPromotion(int promotionId);
    
    @Query(value = "select f.id from flight f"
            + " join promotion_flight_relationship pfr on pfr.flight_id = f.id"
            + " join promotion p on p.id = pfr.promotion_id"
            + " where p.id = ?1", nativeQuery = true)
    public List<Integer> findListFlightIdOfPromotion(int promotionId);
    
    @Query(value = "select p.* from promotion p"
            + " join promotion_flight_relationship pfr on pfr.promotion_id = p.id"
            + " join flight f on f.id = pfr.flight_id"
            + " join booking_detail bd on bd.flight_id = f.id"
            + " where bd.id = ?1", nativeQuery = true)
    public List<PromotionEntity> getListPromotionOfBookingDetail(int bookingDetailId);
    
    @Query(value = "select * from promotion"
            + " where status like 'AVAILABLE'", nativeQuery = true)
    public List<PromotionEntity> getListPromotionsAvailable();
    
    public List<PromotionEntity> findByNameLike(String name);
}
