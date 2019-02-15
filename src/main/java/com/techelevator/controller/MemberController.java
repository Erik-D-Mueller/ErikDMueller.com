package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.model.dao.MemberDAO;
import com.techelevator.model.domain.Member;

@SessionAttributes({"userName", "currentUser", "shoppingCart", "member", "confNum"})


@Controller
public class MemberController {
	
	Member member;

	@Autowired
	private MemberDAO memberDAO;

	@RequestMapping("/memberList")
	public String displayAllMembers(HttpServletRequest request) {
	
		request.setAttribute("memberList", memberDAO.getAllMembers());
		
		return "memberList";
	}

}
