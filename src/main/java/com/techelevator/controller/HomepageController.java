package com.techelevator.controller;

import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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