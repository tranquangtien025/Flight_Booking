/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.DecimalMin;

/**
 *
 * @author TIEN
 */
@Entity
@Table(name = "service_booking")
public class ServiceBookingEntity {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    private double price;
    
    @ManyToOne
    @JoinColumn(name = "booking_detail_id")
    private BookingDetailEntity bookingDetail;
    
    @ManyToOne
    @JoinColumn(name = "service_id")
    private ServiceEntity service;

    public ServiceBookingEntity() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public BookingDetailEntity getBookingDetail() {
        return bookingDetail;
    }

    public void setBookingDetail(BookingDetailEntity bookingDetail) {
        this.bookingDetail = bookingDetail;
    }

    public ServiceEntity getService() {
        return service;
    }

    public void setService(ServiceEntity service) {
        this.service = service;
    }
    
    
}
