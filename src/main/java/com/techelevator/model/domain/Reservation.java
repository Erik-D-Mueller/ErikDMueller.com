package com.techelevator.model.domain;

import java.util.List;

public class Reservation {

	private int reservationId;
	private String checkoutDate;
	private String returnDate;
	public List<CheckedOutTool> tools;

	public int getReservationId() {
		return reservationId;
	}
	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}
	public String getCheckoutDate() {
		return checkoutDate;
	}
	public void setCheckoutDate(String checkoutDate) {
		this.checkoutDate = checkoutDate;
	}
	public String getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}
	public List<CheckedOutTool> getTools() {
		return tools;
	}
	public void setTools(List<CheckedOutTool> list) {
		this.tools = list;
	}
}
