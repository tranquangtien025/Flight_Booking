/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.service;

import com.mycompany.flight_booking.entities.TicketTypeEntity;
import com.mycompany.flight_booking.repository.TicketTypeRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author TIEN
 */
@Service
public class TicketTypeService {
    
    @Autowired
    private TicketTypeRepository ticketTypeRepository;
    
    public List<TicketTypeEntity> getTicketTypes() {
        return (List<TicketTypeEntity>) ticketTypeRepository.findAll();
    }
    
    public TicketTypeEntity getTicketTypeById(int id) {
        Optional<TicketTypeEntity> optional = ticketTypeRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        } else {
            return new TicketTypeEntity();
        }
    }
    
    public void saveTicketType(TicketTypeEntity ticketTypeEntity) {
        ticketTypeRepository.save(ticketTypeEntity);
    }
    
    public void deleteTicketType(int id) {
        ticketTypeRepository.deleteById(id);
    }
}
