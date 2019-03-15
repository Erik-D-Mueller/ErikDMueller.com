package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes({"userName", "currentUser", "shoppingCart", "member", "confNum"})

@Controller
public class HomepageController {
	
	@RequestMapping(path = { "/homepage" })
	public String viewCart(HttpServletRequest request) {
				
		return "homepage";
	}
	
	
	@RequestMapping(path = { "/", "/homepage0" })
	public String viewCA(HttpServletRequest request) {
				
		return "homepage0";
	}

	
	@RequestMapping(path = { "/resume" })
	public String viewCB(HttpServletRequest request) {
				
		return "resume";
	}


	@RequestMapping(path = { "/contact" })
	public String viewCC(HttpServletRequest request) {
				
		return "contact";
	}
	
	
	
}