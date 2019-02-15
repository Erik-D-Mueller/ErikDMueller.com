package com.techelevator;

import javax.sql.DataSource;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.model.dao.ReservationDAO;
import com.techelevator.model.dao.ToolDAO;
import com.techelevator.model.domain.AvailableTool;
import com.techelevator.model.domain.ShoppingCart;
import com.techelevator.model.domain.Tool;
import com.techelevator.model.jdbc.JDBCReservationDAO;
import com.techelevator.model.jdbc.JDBCToolDAO;

public class ReservationDAOIntegrationTest extends DAOIntegrationTest {

	private DataSource dataSource;
	private ReservationDAO test;
	private ToolDAO toolDAO;
	private JdbcTemplate jdbcTemplate;

	private final int TEST_TOOL_TYPE_ID = 99999;
	private final String TEST_TOOL_NAME = "TEST";
	private final String TEST_TOOL_DESCRIPTION = "THIS IS A TEST TOOL";
	private final int TEST_TOOL_ID = 99999;
	private final int TEST_RESERVATION_ID = 99999;
	private final int TEST_APP_USER_ID = 99999;
	private final String TEST_USER_NAME = "A RANDOM PERSON";
	private final String TEST_PASSWORD = "A.RANDOM.PASSWORD";
	private final String TEST_ROLE = "Member";
	private final String TEST_D_L = "DL99999";
	private final String TEST_SALT = "99999";

	@Before
	public void setup() {

		dataSource = super.getDataSource();
		test = new JDBCReservationDAO(dataSource);
		toolDAO = new JDBCToolDAO(dataSource);
		jdbcTemplate = new JdbcTemplate(dataSource);

		String newToolType = "INSERT INTO tool_type (tool_type_id, tool_name, tool_description) " + "VALUES (?, ?, ?)";

		String newTool = "INSERT INTO tool (tool_id, tool_type_id) " + "VALUES (?, ?)";

		String newReservation = "INSERT INTO reservation (reservation_id, app_user_id, from_date, to_date) "
				+ "VALUES (?, ?, NOW() - INTERVAL '2 days', NOW() + INTERVAL '2 days')";

		String reserveNewTool = "INSERT INTO tool_reservation (tool_id, reservation_id) " + "VALUES (?, ?)";

		String newUser = "INSERT INTO app_user (app_user_id, user_name, password, role, drivers_license, salt) VALUES (?,?,?,?,?,?)";

		jdbcTemplate.update(newUser, TEST_APP_USER_ID, TEST_USER_NAME, TEST_PASSWORD, TEST_ROLE, TEST_D_L, TEST_SALT);
		jdbcTemplate.update(newToolType, TEST_TOOL_TYPE_ID, TEST_TOOL_NAME, TEST_TOOL_DESCRIPTION);
		jdbcTemplate.update(newTool, TEST_TOOL_ID, TEST_TOOL_TYPE_ID);
		jdbcTemplate.update(newReservation, TEST_RESERVATION_ID, TEST_APP_USER_ID);
		jdbcTemplate.update(reserveNewTool, TEST_TOOL_ID, TEST_RESERVATION_ID);
	}

	@Test
	public void constructorTest() {

		JDBCReservationDAO test2 = new JDBCReservationDAO(dataSource);

		Assert.assertNotNull(test2);
	}

	@Test
	public void saveNewReservationTest(){

		Tool testTool = new AvailableTool();
		testTool.setToolId(TEST_TOOL_ID);
		testTool.setToolName(TEST_TOOL_NAME);
		testTool.setToolDescription(TEST_TOOL_DESCRIPTION);
				
		ShoppingCart testCart = new ShoppingCart();
		testCart.addToCart(testTool);
		
		int oldSize = toolDAO.getAllCheckedOutTools().size();

		test.saveNewReservation(testCart, TEST_APP_USER_ID);		
		
		Assert.assertEquals(oldSize + 1, toolDAO.getAllCheckedOutTools().size());
		Assert.assertEquals(toolDAO.getAllCheckedOutTools().get(toolDAO.getAllCheckedOutTools().size() -1).getToolId(), TEST_TOOL_ID);
	}

	@Test
	public void deleteReservationTest() {
		test.deleteReservation(TEST_TOOL_ID);
		Assert.assertNull(toolDAO.getCheckedOutToolByToolId(TEST_TOOL_ID).getToolName());
	}
	
	@Test
	public void searchReservationsByReservationNumberTest(){
		Assert.assertNotNull(test.getReservationByReservationNumber(TEST_RESERVATION_ID));
	}

}
