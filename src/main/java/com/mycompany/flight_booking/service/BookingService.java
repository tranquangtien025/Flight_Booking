/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.service;

import com.mycompany.flight_booking.entities.BookingEntity;
import com.mycompany.flight_booking.repository.BookingRepository;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
public class BookingService {
    
    @Autowired
    private BookingRepository bookingRepository;
    
    public List<BookingEntity> getBookings() {
        return (List<BookingEntity>) bookingRepository.findAll();
    }
    
    public BookingEntity getBookingById(int id) {
        Optional<BookingEntity> optional = bookingRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        } else {
            return new BookingEntity();
        }
    }
    
    public void saveBooking(BookingEntity bookingEntity) {
        bookingRepository.save(bookingEntity);
    }
    
    public boolean deleteBooking(int id) {
       bookingRepository.deleteById(id);
       return bookingRepository.existsById(id);
    }
    
    public List<BookingEntity> listAll() {
        return bookingRepository.findAll();
    }
    
    public List<BookingEntity> getByBookingDateBetween(String from, String to) {
        if(from != "" && to != "") {
            return bookingRepository.getByBookingDateBetween(from, to);
        }
        return bookingRepository.findAll();
    }
    
    public List<BookingEntity> findByBookingNumberLike(String strSearch) {
        if (strSearch != "") {
            return bookingRepository.search(strSearch);
        }
        return bookingRepository.findAll();
    }
    
    public List<BookingEntity> viewHistory(String phoneNumber) {
        if (!bookingRepository.findByPhoneNumberLike(phoneNumber).isEmpty()) {
            return bookingRepository.findByPhoneNumberLike(phoneNumber);
        }
        return new ArrayList<BookingEntity>();
    }
    
}
