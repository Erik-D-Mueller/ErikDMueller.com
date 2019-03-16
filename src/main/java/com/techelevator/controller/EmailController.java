package com.techelevator.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

/* This might be the wrong type of controller for email, the import */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSender;

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
	public String saveContacts(@RequestParam("name") String name, @RequestParam("email") String email,
			@RequestParam("subject") String subject, @RequestParam("message") String message)
	{
		// prints debug info
		
		System.out.println("Name: " + name);
		System.out.println("To: " + email);
		System.out.println("Subject: " + subject);
		System.out.println("Message: " + message);
		

	
	//creates a simple e-mail object
	SimpleMailMessage simpleMessage = new SimpleMailMessage();
		simpleMessage.setTo(email);
		simpleMessage.setSubject(subject);
		simpleMessage.setText(message);
		
	//sends the e-mail
	mailSender.send(simpleMessage);
	
	return "success";
	
	}
	
	@PostMapping("sendEmailWithAttachment")
	public String sendEmailWithAttachment(HttpServletRequest request, final @RequestParam CommonsMultipartFile [] attachFile)
	
	{
		final String name = request.getParameter("name");
		final String email = request.getParameter("mailTo");
		final String message = request.getParameter("message");
		final String subject = request.getParameter("subject");
		
		//for multiple recipients
		String [] to=emailTo.split(",");
		
		System.out.println("Name: " + name);
		System.out.println("To: " + email);
		System.out.println("Subject: " + subject);
		System.out.println("Message: " + message);
		
		//System.out.println("attachFile: " + attachFile.getOriginalFilename());
		List<CommonsMultipartFile> attachments = new ArrayList<CommonsMultipartFile>();
		for(int i=0; i<attachFile.length; i++)
		{
		
			System.out.println("attachFile: " + attachFile[i].getOriginalFilename());
					attachments.add(attachFile[i]);
					
		}
		System.out.println("sending...");
		mailSender.send(new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimemessage) throws Exception {
				
				MimeMessageHelper messageHelper = new MimeMessageHelper(
						mimeMessage, true, "UTF-8");
				//for multiple recipients
				
				if(!to.equals(""))
				{
					for (String vto : to)
					{
						messageHelper.setTo(vto);
					}
				}
				
				//messageHelper.setTo(emailTo);
				messageHelper.setSubject(subject);
				messageHelper.setText(message);
				
				//determines if there is an upload file, attach it to the email
				
				
				
				
				
					
					
					if(!attachments.equals(""))
					{
						
						for (CommonsMultipartFile file : attachments)
						{
							messageHelper.addAttachment(file.getOriginalFilename(), file);
						}
					}
					System.out.println("sending done");
				
			}
			
			
		});
	
	
	return "success";
	
	}
	
}
	
	

