package com.example.springsecuritybasic.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@Entity
@Table(name = "account_transactions")
public class AccountTransactions {
    @Column(name = "transactcion_id")
    private int transactionId;
    @Id
    @Column(name = "account_number")
    private long accountNumber;
    @Column(name = "customer_id")
    private long customerId;
    @Column(name = "transaction_dt")
    private Date transactionDt;
    @Column(name = "transaction_summary")
    private String transactionSummary;
    @Column(name = "transaction_type")
    private String transactionType;
    @Column(name = "transaction_amt")
    private int transactionAmt;
    @Column(name = "closing_balance")
    private int closingBalance;
    @Column(name = "create_dt")
    private Date createDt;

}


