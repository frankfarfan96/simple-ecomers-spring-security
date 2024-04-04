package com.example.springsecuritybasic.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import java.util.Date;

@Getter
@Setter
@Entity
@Table(name = "loans")
public class Loans {

     @GeneratedValue(strategy = GenerationType.AUTO, generator="native")
    @GenericGenerator(name = "native", strategy = "native")
    @Column(name = "loan_number")
    @Id
    private int loanNumber;
    @Column(name = "customer_id")
    private int customerId;
    @Column(name = "start_dt")
    private Date startDt;
    @Column(name = "loan_type")
    private long loanType;
    @Column(name = "total_loan")
    private Date totalLoan;
    @Column(name = "amount_paid")
    private String amountPaid;
    @Column(name = "outstanding_amount")
    private String outstandingAmount;
    @Column(name = "create_dt")
    private Date createDt;

}


