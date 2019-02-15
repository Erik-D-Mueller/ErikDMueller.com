package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.ui.ModelMap;

import com.techelevator.model.dao.ReservationDAO;
import com.techelevator.model.dao.ToolDAO;
import com.techelevator.model.domain.CheckedOutTool;

@SessionAttributes({ "userName", "currentUser", "shoppingCart", "member", "confNum", "returnTool" })

@Controller

public class ReturnController {

	@Autowired
	private ReservationDAO reservationDAO;

	@Autowired
	private ToolDAO toolDAO;

	@RequestMapping("/returnTool")
	public String returnTool(HttpServletRequest request) {

		request.setAttribute("InvalidID", false);
		return "returnTool";
	}

	@RequestMapping(path = "/returnVerify", method = RequestMethod.POST)
	public String updateReturn(HttpServletRequest request, ModelMap model) {
		request.setAttribute("InvalidID", false);

		CheckedOutTool toolToReturn = toolDAO
				.getCheckedOutToolByToolId(Integer.parseInt(request.getParameter("toolId")));

		if (toolToReturn.getToolName() == null) {

			request.setAttribute("toolReturnError",
					"The tool associated with that ID is not currently checked out. Please try again.");
			return "returnTool";
		}

		else {

			model.addAttribute("returnTool", toolToReturn);
			request.setAttribute("tool", toolToReturn);
			return "returnVerify";
		}

	}

	@RequestMapping("/returnConfirmation")
	public String returnFinal(HttpServletRequest request, ModelMap model) {

		CheckedOutTool toolToReturn = (CheckedOutTool) model.get("returnTool");

		reservationDAO.deleteReservation(toolToReturn.getToolId());

		request.setAttribute("toolId", toolToReturn.getToolId());
		return "returnConfirmation";
	}

}