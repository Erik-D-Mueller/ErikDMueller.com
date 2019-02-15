package com.techelevator.model.domain;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCart {

	
	public List<Tool> items = new ArrayList<>();
	public int numberOfItemsInCart;

	
	public List<Tool> getItems() {
		return items;
	}
	public void setItems(List<Tool> items) {
		this.items = items;
	}

	public void addToCart(Tool tool) {
		if(items != null) {
			items.add(tool);
		}
		if(items == null) {
			List<Tool> newList = new ArrayList<>();
			setItems(newList);
		}
	
	}
	
	public void removeFromCart (int toolId) {
	
		List<Tool> newList = new ArrayList<>();		
		
		for(Tool e: items) {
						
			if(e.getToolId() != toolId) {
				
				newList.add(e);
			}
						
		}
		
		items = newList;
		
	}
	
	public int getNumberOfItemsInCart() {
		
		return items.size();
	}
	
}
