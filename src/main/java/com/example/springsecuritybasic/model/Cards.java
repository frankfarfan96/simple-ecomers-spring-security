package com.example.springsecuritybasic.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import java.util.Date;

@Getter
@Setter
@Entity
@Table(name = "cards")
public class Cards {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator="native")
    @GenericGenerator(name = "native", strategy = "native")
    @Column(name = "card_id")
    private int cardId;
    @Column(name = "customer_id")
    private int customerId;
    @Column(name = "card_number")
    private String cardNumber;
    @Column(name = "card_type")
    private String cardType;
    @Column(name = "total_limit")
    private int totalLimit;
    @Column(name = "amount_used")
    private int amountUsed;
    @Column(name = "available_amount")
    private int availableAmount;
    @Column(name = "create_dt")
    private Date create_dt;

}
