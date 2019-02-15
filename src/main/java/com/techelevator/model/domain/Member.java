package com.techelevator.model.domain;

import java.util.List;

public class Member {
	
	private int memberId;
	private String memberName;
	private List<Reservation> listOfReservations;
	
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public List<Reservation> getListOfReservations() {
		return listOfReservations;
	}
	public void setListOfReservations(List<Reservation> listOfReservations) {
		this.listOfReservations = listOfReservations;
	}
}
