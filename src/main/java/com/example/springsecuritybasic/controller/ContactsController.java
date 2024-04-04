package com.example.springsecuritybasic.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ContactsController {

   @GetMapping("/contact")
   public String getContactInquiryDetails() {
       return "Inquiry details are saved to the DB";
   }
}
