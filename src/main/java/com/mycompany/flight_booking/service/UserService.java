/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.service;

import com.mycompany.flight_booking.entities.UserEntity;
import com.mycompany.flight_booking.repository.UserRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author TIEN
 */
@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepository;
    
    public List<UserEntity> getUsers() {
        return (List<UserEntity>) userRepository.findAll();
    }
    
    public UserEntity getUserById(int id) {
        Optional<UserEntity> optional = userRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        } else {
            return new UserEntity();
        }
    }
    
    public void saveUser(UserEntity userEntity) {
        userRepository.save(userEntity);
    }
    
    public void deleteUser(int id) {
        userRepository.deleteById(id);
    }
    
    public void saveAndFlush(UserEntity userEntity) {
        userRepository.saveAndFlush(userEntity);
    }
    
    public List<String> getListRolesOfUser(int userId) {
        return userRepository.findListRolesOfUser(userId);
    }
    
    public List<Integer> getListRoleIdOfUser(int userId) {
        return userRepository.findListRoleIdOfUser(userId);
    }
    
    public UserEntity getUser(String email) {
        return userRepository.findByEmail(email);
    }
    
    public boolean isEmailExist(String email) {
        if (userRepository.findByEmail(email) != null) {
            return true;
        } else {
            return false;
        }
    }
    
    public boolean isPhoneNumberExist(String phoneNumber) {
        if (userRepository.findByPhoneNumber(phoneNumber) != null) {
            return true;
        } else {
            return false;
        }
    }
    
}
