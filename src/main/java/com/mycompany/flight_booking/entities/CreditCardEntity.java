/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.flight_booking.entities;

import com.mycompany.flight_booking.enums.CreditCardStatus;
import java.util.Date;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author TIEN
 */
@Entity
@Table(name = "credit_card")
public class CreditCardEntity {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    private String name;
    
    @Column(name = "card_number")
    private String cardNumber;
    
    @Column(name = "exp_date")
    private Date expDate;
    
    @Column(name = "cvc_code")
    private String cvcCode;
    
    private double balance;
    
    @Enumerated(EnumType.STRING)
    private CreditCardStatus status;
    
    @OneToMany(mappedBy = "creditCard")
    private Set<PaymentEntity> payments;

    public CreditCardEntity() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public Date getExpDate() {
        return expDate;
    }

    public void setExpDate(Date expDate) {
        this.expDate = expDate;
    }

    public String getCvcCode() {
        return cvcCode;
    }

    public void setCvcCode(String cvcCode) {
        this.cvcCode = cvcCode;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public CreditCardStatus getStatus() {
        return status;
    }

    public void setStatus(CreditCardStatus status) {
        this.status = status;
    }

    public Set<PaymentEntity> getPayments() {
        return payments;
    }

    public void setPayments(Set<PaymentEntity> payments) {
        this.payments = payments;
    }
    
    
}
