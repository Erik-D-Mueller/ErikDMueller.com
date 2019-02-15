package com.techelevator.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.model.dao.ToolDAO;
import com.techelevator.model.domain.ShoppingCart;
import com.techelevator.model.domain.Tool;

@Controller

@SessionAttributes({ "userName", "currentUser", "shoppingCart", "member", "confNum" })

public class ToolController {

	@Autowired
	private ToolDAO toolDAO;

	@RequestMapping("/completeToolList")
	public String displayCompleteToolList(HttpServletRequest request) {

		request.setAttribute("allTools", toolDAO.getAllTools());

		return "completeToolList";
	}

	@RequestMapping("/availableToolList")
	public String displayAvailableToolList(HttpServletRequest request, ModelMap model) {

		if (model.get("shoppingCart") != null) {

			ShoppingCart cart = (ShoppingCart) model.get("shoppingCart");
			List<Tool> toolsInCart = cart.getItems();

			List<Tool> allAvailableTools = toolDAO.getAllAvailableTools();

			List<Tool> toolsThatCanAddToCart = new ArrayList<>();

			for (Tool e : allAvailableTools) {

				boolean isInCart = false;

				for (Tool f : toolsInCart) {

					if (e.getToolId() == f.getToolId()) {

						isInCart = true;

					}

				}

				if (!isInCart) {
					toolsThatCanAddToCart.add(e);
				}

			}

			request.setAttribute("availableTools", toolsThatCanAddToCart);

		} else {
			request.setAttribute("availableTools", toolDAO.getAllAvailableTools());
		}
		return "availableToolList";
	}

	@RequestMapping("/checkedOutTools")
	public String displayCheckedOutTools(HttpServletRequest request) {

		request.setAttribute("allCheckedOutTools", toolDAO.getAllCheckedOutTools());

		return "checkedOutTools";
	}
}
