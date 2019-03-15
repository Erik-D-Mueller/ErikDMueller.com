package com.techelevator.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

/* This might be the wrong type of controller for email, the import */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class EmailController {
	
	
	@Autowired
	private JavaMailSender mailSender;
	
	@GetMapping(value= {"", "/","/index", "/home", "default"})
	public String homePage() {
		return "index";
	}
	
	@GetMapping( value = "/email-attachment")
	public String emailWithAttachment() {
	
	return "email-attachment";
		
	}
	
	
	@PostMapping (value = "/sendEmail")
	public String saveContacts(@RequestParam("name") String name, @RequestParam("email" String email,
			@RequestParam("subject") String subject, @RequestParam("message") String message)
	{
		// prints debug info
		
		
		
		
	}
	
	
	
	

}
