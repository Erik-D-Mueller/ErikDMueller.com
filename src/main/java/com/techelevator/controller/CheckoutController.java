package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.ui.ModelMap;

import com.techelevator.model.dao.ReservationDAO;
import com.techelevator.model.dao.ToolDAO;
import com.techelevator.model.domain.Member;
import com.techelevator.model.domain.ShoppingCart;

@Controller

@SessionAttributes({"userName", "currentUser", "shoppingCart", "member", "confNum"})


public class CheckoutController {
	
	@Autowired
	private ReservationDAO reservationDAO;
	
	@Autowired
	private ToolDAO toolDAO;
	
	@RequestMapping(path="/checkOut", method=RequestMethod.POST)
	public String checkOut(HttpSession session, ModelMap model) {
		
		ShoppingCart cart = (ShoppingCart)model.get("shoppingCart");

		int memberId = ((Member)model.get("member")).getMemberId();
				
		int confirmationNum = reservationDAO.saveNewReservation(cart, memberId);
		
		model.addAttribute("confNum", confirmationNum);
				
		return "redirect:/checkoutConfirmation";
	}

	@RequestMapping(path="/checkoutConfirmation", method=RequestMethod.GET)
	
	

	

public String confirmCheckout(HttpSession session, HttpServletRequest request, ModelMap model) {				
		String name = ((Member)model.get("member")).getMemberName();
		request.setAttribute("memberName", name);
		
		model.remove("member");
		session.removeAttribute("member");

		model.remove("shoppingCart");
		session.removeAttribute("shoppingCart");

		request.setAttribute("confNum", model.get("confNum"));
		request.setAttribute("reservations", toolDAO.getToolsByReservationId((int)model.get("confNum")));
		
		return "checkoutConfirmation";
	}

}
