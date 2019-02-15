package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.dao.ToolDAO;
import com.techelevator.model.dao.UserDAO;
import com.techelevator.model.domain.Registration;
import com.techelevator.model.domain.UpdateDL;
import com.techelevator.model.domain.UpdatePassword;
import com.techelevator.model.domain.User;


@SessionAttributes({"userName", "currentUser", "shoppingCart", "member", "confNum"})

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private ToolDAO toolDAO;

	@RequestMapping(path = "/users/new", method = RequestMethod.GET)
	public String displayNewUserForm(ModelMap modelHolder) {
		if (!modelHolder.containsAttribute("registration")) {
			modelHolder.addAttribute("registration", new Registration());
		}
		return "newUser";
	}

	@RequestMapping(path = "/users", method = RequestMethod.POST)
	public String createUser(@Valid @ModelAttribute Registration registration, BindingResult result, RedirectAttributes flash) {
		if (result.hasErrors()) {
			flash.addFlashAttribute("registration", registration);
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "registration", result);
			return "redirect:/users/new";
		}

		userDAO.saveUser(registration.getUserName(), registration.getPassword(), registration.getDriversLicense(), registration.getRole());
		return "redirect:/";
	}
	
	@RequestMapping(path = "/userProfile", method = RequestMethod.GET)
	public String viewUserProfile(HttpSession session, HttpServletRequest request, ModelMap modelHolder) {
		if (!modelHolder.containsAttribute("updatePW")) {
			modelHolder.addAttribute("updatePW", new UpdatePassword());
		}
		
		if (!modelHolder.containsAttribute("updateDL")) {
			modelHolder.addAttribute("updateDL", new UpdateDL());
		}
		
		User userInSession = (User) session.getAttribute("currentUser");
		request.setAttribute("listOfTools", 
				toolDAO.getToolsCheckedOutToMemberByName(userInSession.getUserName()));
		
		return "userProfile";
	}
	
	@RequestMapping(path = "/changeDL", method = RequestMethod.POST)
	public String changeDriversLicense(
			HttpServletRequest request, 
			HttpSession session,
			@Valid @ModelAttribute("updateDL") UpdateDL updateDL, 
			BindingResult result, 
			RedirectAttributes flash) {
		flash.addFlashAttribute("updateDL", updateDL);
		if (result.hasErrors()) {
			flash.addFlashAttribute("updateDL", updateDL);
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "updateDL", result);
			return "redirect:/userProfile";
		}
		
		User userInSession = (User) session.getAttribute("currentUser");
		String newDriverLicense = (String) request.getParameter("newDL");
	
		userDAO.updateDL(userInSession.getUserName(), newDriverLicense);
		
		return "redirect:/confirmProfileChange";
	}
	
	@RequestMapping(path = "/changePassword", method = RequestMethod.POST)
	public String changePassword(
			HttpServletRequest request, 
			HttpSession session,
			@Valid @ModelAttribute("updatePW") UpdatePassword updatePW, 
			BindingResult result, 
			RedirectAttributes flash) {
		flash.addFlashAttribute("updatePW", updatePW);
		if (result.hasErrors()) {
			flash.addFlashAttribute("updatePW", updatePW);
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "updatePW", result);
			return "redirect:/userProfile";
		}
		
		User userInSession = (User) session.getAttribute("currentUser");

		String newPassword = (String) request.getParameter("password");
		
		userDAO.updatePassword(userInSession.getUserName(), newPassword);
		
		return "redirect:/confirmProfileChange";
	}
	
	@RequestMapping(path = "/confirmProfileChange", method = RequestMethod.GET)
	public String confirmProfileChange(HttpServletRequest request, HttpSession session, ModelMap model) {
		
		User userInSession = (User) session.getAttribute("currentUser");
		User updatedUser = userDAO.getUserByUserName(userInSession.getUserName());
		session.removeAttribute("currentUser");
		model.addAttribute("currentUser", updatedUser);
		
		return "profileChangeConfirmation";
	}

}
