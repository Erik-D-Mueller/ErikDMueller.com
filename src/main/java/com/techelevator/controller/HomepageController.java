package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes({"userName", "currentUser", "shoppingCart", "member", "confNum"})


@Controller
public class HomepageController {
	
	@RequestMapping(path = { "/", "/homepage" })
	public String viewCart(HttpServletRequest request) {
				
		return "homepage";
	}
}
