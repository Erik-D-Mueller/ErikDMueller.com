package com.techelevator.model.dao;

import com.techelevator.model.domain.Reservation;
import com.techelevator.model.domain.ShoppingCart;

public interface ReservationDAO {

	public int saveNewReservation(ShoppingCart cart, int memberId);
	
	public void deleteReservation(int toolId);

	public Reservation getReservationByReservationNumber(int reservationId);

}
