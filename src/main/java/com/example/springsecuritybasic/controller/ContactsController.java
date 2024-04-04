package com.example.springsecuritybasic.controller;

import com.example.springsecuritybasic.model.Contact;
import com.example.springsecuritybasic.repository.ContactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.Random;

@RestController
public class ContactsController {

    @Autowired
    private ContactRepository contactRepository;


   @PostMapping("/contact")
   public Contact saveContactInquiryDetails(@RequestParam Contact contac) {
       contac.setContactId(getServiceReqNumber());
       contac.setCreateDt(new Date(System.currentTimeMillis()));
       return contactRepository.save(contac);
   }
   
   public String getServiceReqNumber() {
       Random random = new Random();
       int ranNum = random.nextInt(999999999 - 9999) + 9999;
       
       return "SR"+ ranNum;
   }
}
