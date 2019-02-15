package com.techelevator.model.jdbc;

import java.time.LocalDate;
import java.util.List;
import javax.sql.DataSource;

import com.techelevator.model.domain.Tool;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import com.techelevator.model.dao.ReservationDAO;
import com.techelevator.model.domain.Reservation;
import com.techelevator.model.domain.ShoppingCart;

@Component
public class JDBCReservationDAO implements ReservationDAO {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCReservationDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}


	@Override
	public int saveNewReservation(ShoppingCart cart, int memberId) {

		LocalDate date = LocalDate.now();
		
		List<Tool> items = cart.getItems();
		
		if (items.size() == 0) {
		}
		String sqlSaveNewReservation = "INSERT INTO reservation (app_user_id, from_date, to_date) VALUES (?,?,?)";

		jdbcTemplate.update(sqlSaveNewReservation, memberId, date, date.plusDays(7));

		String sqlGetReservationId = "SELECT reservation_id FROM reservation where reservation_id=(SELECT MAX(reservation_id) FROM reservation)";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetReservationId);

		int reservationId = 0;

		while (results.next()) {

			reservationId = Integer.parseInt(results.getString("reservation_id"));

		}

		String sqlInsertTool = "INSERT INTO tool_reservation (tool_id, reservation_id) VALUES (?,?)";

		for (Tool e : items) {

			jdbcTemplate.update(sqlInsertTool, e.getToolId(), reservationId);
		}

		return reservationId;
	}

	@Override
	public void deleteReservation(int toolId) {

		String sqlDeleteReservation = "DELETE FROM tool_reservation WHERE tool_id = ? ";
		
		jdbcTemplate.update(sqlDeleteReservation, toolId);
	}

	@Override
	public Reservation getReservationByReservationNumber(int reservationId) {
		
		Reservation theReservation = new Reservation();

		String sqlSearchReservationById = "SELECT r.reservation_id, t.tool_id, tt.tool_name, r.to_date, r.from_date "
				+ "FROM reservation r " + "JOIN tool_reservation tr ON r.reservation_id = tr.reservation_id "
				+ "JOIN app_user au ON r.app_user_id = au.app_user_id " + "JOIN tool t ON t.tool_id = tr.tool_id "
				+ " JOIN tool_type tt ON t.tool_type_id = tt.tool_type_id " + "WHERE r.reservation_id = ?";

		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchReservationById, reservationId);

		while (results.next()) {
			
			theReservation = mapRowToReservation(results);
		
		}
		
		return theReservation;
	}

	public Reservation mapRowToReservation(SqlRowSet results) {

		Reservation newReservation = new Reservation();

		String checkoutDate = results.getString("from_date").substring(5) + "-"
				+ results.getString("from_date").substring(0, 4);
		String returnDate = results.getString("to_date").substring(5) + "-"
				+ results.getString("to_date").substring(0, 4);

		newReservation.setReservationId(results.getInt("reservation_id"));
		newReservation.setCheckoutDate(checkoutDate);
		newReservation.setReturnDate(returnDate);

		return newReservation;
	}

}
