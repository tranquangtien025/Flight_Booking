/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.service;

import com.mycompany.flight_booking.entities.BookingDetailEntity;
import com.mycompany.flight_booking.repository.BookingDetailRepository;
import java.util.List;
import java.util.Optional;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author TIEN
 */
@Service
@Transactional
public class BookingDetailService {
    
    @Autowired
    private BookingDetailRepository bookingDetailRepository;
    
    public List<BookingDetailEntity> listAll() {
        return bookingDetailRepository.findAll();
    }
    
    public BookingDetailEntity getBookingDetailById(int id) {
        Optional<BookingDetailEntity> optional = bookingDetailRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        } else {
            return new BookingDetailEntity();
        }
    }
    
    public void saveBookingDetail(BookingDetailEntity bookingDetailEntity) {
        bookingDetailRepository.save(bookingDetailEntity);
    }
    
    public List<BookingDetailEntity> getListBookingDetailOfBookingAndFlight(int bookingId, int flightId) {
        return bookingDetailRepository.getListBookingDetailOfBookingAndFlight(bookingId, flightId);
    }
    
    public List<BookingDetailEntity> getListBookingDetailOfBooking(int bookingId) {
        return bookingDetailRepository.getListBookingDetailOfBooking(bookingId);
    }
}
