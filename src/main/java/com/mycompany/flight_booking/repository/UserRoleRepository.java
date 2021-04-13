/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.repository;

import com.mycompany.flight_booking.repository.*;
import com.mycompany.flight_booking.entities.UserRoleEntity;
import com.mycompany.flight_booking.enums.Role;
import java.util.List;
import java.util.Set;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRoleRepository extends JpaRepository<UserRoleEntity, Integer> {

    List<UserRoleEntity> findByUsers_Email(String email);
    UserRoleEntity findByRole(Role role);
    
    @Query(value = "select * from user_role ur"
            + " join user_role_relationship urr on ur.id = urr.role_id"
            + " join user u on u.id = urr.user_id"
            + " where u.id = ?1", nativeQuery = true)
    public List<UserRoleEntity> findByUserId(int userId);
    
    @Query(value = "select * from user_role ur"
            + " where ur.id in ?1", nativeQuery = true)
    public List<UserRoleEntity> findListByUserRoleId(List<Integer> listRoleId);
    
    @Query(value = "select * from user_role ur where ur.role like ?1", nativeQuery = true)
    public List<UserRoleEntity> findByRoleName(String roleName);
}
