package com.techelevator.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.ui.ModelMap;

import com.techelevator.model.dao.MemberDAO;
import com.techelevator.model.dao.ToolDAO;
import com.techelevator.model.domain.ShoppingCart;
import com.techelevator.model.domain.Tool;

@Controller

@SessionAttributes({ "userName", "currentUser", "shoppingCart", "member", "confNum" })

public class CartController {

	@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private ToolDAO toolDAO;

	@RequestMapping(path = "/chooseMember", method = RequestMethod.GET)
	public String chooseMemberAndRedirect(HttpSession session, HttpServletRequest request, ModelMap map,
			ModelMap model) {

		map.addAttribute("member", memberDAO.getMemberById(Integer.parseInt(request.getParameter("memberId"))));

		// for some reason model.remove() is not working, so I'm "overwriting" instead
		ShoppingCart cart = new ShoppingCart();
		model.addAttribute(cart);

		return "redirect:/availableToolList";
	}

	@RequestMapping(path = "/viewCart", method = RequestMethod.POST)
	public String viewCart(HttpServletRequest request, ModelMap model) {

		Tool toolToAdd = toolDAO.getToolById(Integer.parseInt(request.getParameter("tool_id")));

		ShoppingCart cart = getActiveShoppingCart(model);

		cart.addToCart(toolToAdd);

		request.setAttribute("tools", cart.getItems());
		model.put("shoppingCart", cart);

		return "viewCart";
	}

	@RequestMapping(path = "/viewCart", method = RequestMethod.GET)
	public String viewCartWithNoMember(HttpServletRequest request, ModelMap model) {

		if (model.get("shoppingCart") != null) {
			ShoppingCart cart = getActiveShoppingCart(model);
			List<Tool> tools = cart.getItems();

			request.setAttribute("tools", tools);
		}

		return "viewCart";
	}

	private ShoppingCart getActiveShoppingCart(ModelMap model) {
		if (model.get("shoppingCart") == null) {
			model.addAttribute("shoppingCart", new ShoppingCart());
		}
		return (ShoppingCart) model.get("shoppingCart");
	}

	@RequestMapping(path = "/removeItem", method = RequestMethod.POST)
	public String removeItemFromCart(HttpServletRequest request, ModelMap model) {

		ShoppingCart cart = getActiveShoppingCart(model);
		cart.removeFromCart(Integer.parseInt(request.getParameter("tool_id")));
		model.put("shoppingCart", cart);

		return "redirect:/viewCart";
	}

}
