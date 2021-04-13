/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.service;

import com.mycompany.flight_booking.entities.ImageEntity;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.flight_booking.repository.ImageRepository;

/**
 *
 * @author TIEN
 */
@Service
public class ImageService {
    
    @Autowired
    private ImageRepository imageRepository;
    
    public List<ImageEntity> getImages() {
        return (List<ImageEntity>) imageRepository.findAll();
    }
    
    public void saveImage(ImageEntity imageEntity) {
        imageRepository.save(imageEntity);
    }
    
    public ImageEntity getImageById(int id) {
        Optional<ImageEntity> optional = imageRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        } else {
            return new ImageEntity();
        }
    }
    
    public void deleteImage(int id) {
        imageRepository.deleteById(id);
    }
    
    public void deleteAllImageWithSameAircraftId(int id) {
        imageRepository.deleteAll(imageRepository.findByAircraftId(id));
    }
    
    public List<ImageEntity> getImagesByAircraftId(int id) {
        return imageRepository.findByAircraftId(id);
    }
    
    public void deleteAllImageWithSameAirportId(int id) {
        imageRepository.deleteAll(imageRepository.findByAirportId(id));
    }
    
    public List<ImageEntity> getImagesByAirportId(int id) {
        return imageRepository.findByAirportId(id);
    }
    
    public void deleteAllImageWithSameServiceId(int id) {
        imageRepository.deleteAll(imageRepository.findByServiceId(id));
    }
    
    public List<ImageEntity> getImagesByServiceId(int id) {
        return imageRepository.findByServiceId(id);
    }
    
    public List<ImageEntity> getListImageNameLike(String name){
        return imageRepository.findByNameLike(name);
    }
}
