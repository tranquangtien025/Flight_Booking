/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.service;

import com.mycompany.flight_booking.entities.TicketTypeEntity;
import com.mycompany.flight_booking.entities.UserRoleEntity;
import com.mycompany.flight_booking.enums.Role;
import com.mycompany.flight_booking.repository.TicketTypeRepository;
import com.mycompany.flight_booking.repository.UserRoleRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author TIEN
 */
@Service
public class UserRoleService {
    
    @Autowired
    private UserRoleRepository userRoleRepository;
    
    public List<UserRoleEntity> getUserRoles() {
        return (List<UserRoleEntity>) userRoleRepository.findAll();
    }
    
    public UserRoleEntity getUserRoleById(int id) {
        Optional<UserRoleEntity> optional = userRoleRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        } else {
            return new UserRoleEntity();
        }
    }
    
    public void saveUserRole(UserRoleEntity userRoleEntity) {
        userRoleRepository.save(userRoleEntity);
    }
    
    public void deleteUserRole(int id) {
        userRoleRepository.deleteById(id);
    }
    
    public List<UserRoleEntity> findByRoleName(String name) {
        return userRoleRepository.findByRoleName(name);
    }
    
    public List<UserRoleEntity> getUserRoleOfUser(int userId) {
        return userRoleRepository.findByUserId(userId);
    }
    
    public List<UserRoleEntity> getListUserRoles(List<Integer> listRoleId) {
        return userRoleRepository.findListByUserRoleId(listRoleId);
    }
    
}
