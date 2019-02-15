package com.techelevator;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.model.dao.ToolDAO;
import com.techelevator.model.domain.Tool;
import com.techelevator.model.jdbc.JDBCToolDAO;

public class ToolDAOIntegrationTest extends DAOIntegrationTest {

	private DataSource dataSource;
	private ToolDAO test;
	private JdbcTemplate jdbcTemplate;

	private final int TEST_TOOL_TYPE_ID = 99999;
	private final String TEST_TOOL_NAME = "TEST";
	private final String TEST_TOOL_DESCRIPTION = "THIS IS A TEST TOOL";
	private final int TEST_TOOL_ID = 99999;
	private final int TEST_TOOL_ID_2 = 99998;
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
		test = new JDBCToolDAO(dataSource);
		jdbcTemplate = new JdbcTemplate(dataSource);

		String newToolType = "INSERT INTO tool_type (tool_type_id, tool_name, tool_description) " + "VALUES (?, ?, ?)";

		String newTool = "INSERT INTO tool (tool_id, tool_type_id) VALUES (?, ?)";
		
		String newReservation = "INSERT INTO reservation (reservation_id, app_user_id, from_date, to_date) "
				+ "VALUES (?, ?, NOW() - INTERVAL '2 days', NOW() + INTERVAL '2 days')";

		String reserveNewTool = "INSERT INTO tool_reservation (tool_id, reservation_id) " + "VALUES (?, ?)";

		String newUser = "INSERT INTO app_user (app_user_id, user_name, password, role, drivers_license, salt) VALUES (?,?,?,?,?,?)";

		jdbcTemplate.update(newUser, TEST_APP_USER_ID, TEST_USER_NAME, TEST_PASSWORD, TEST_ROLE, TEST_D_L, TEST_SALT);
		jdbcTemplate.update(newToolType, TEST_TOOL_TYPE_ID, TEST_TOOL_NAME, TEST_TOOL_DESCRIPTION);
		jdbcTemplate.update(newTool, TEST_TOOL_ID_2, TEST_TOOL_TYPE_ID);
		jdbcTemplate.update(newTool, TEST_TOOL_ID, TEST_TOOL_TYPE_ID);
		jdbcTemplate.update(newReservation, TEST_RESERVATION_ID, TEST_APP_USER_ID);
		jdbcTemplate.update(reserveNewTool, TEST_TOOL_ID, TEST_RESERVATION_ID);

	}

	@Test
	public void constructorTest() {

		JDBCToolDAO test2 = new JDBCToolDAO(dataSource);

		Assert.assertNotNull(test2);
	}

	@Test
	public void getAllToolsTest() {

		List<Tool> listOfAllTools = new ArrayList<>();
		listOfAllTools = test.getAllTools();

		Assert.assertNotNull(listOfAllTools);
		Assert.assertEquals(TEST_TOOL_ID_2, listOfAllTools.get(listOfAllTools.size() - 1).getToolId());
	}

	@Test
	public void getAllAvailableToolsTest() {

		List<Tool> listOfAvailableTools = new ArrayList<>();
		listOfAvailableTools = test.getAllAvailableTools();

		Assert.assertEquals(TEST_TOOL_ID_2, listOfAvailableTools.get(listOfAvailableTools.size() - 1).getToolId());
	}
	
	@Test
	public void getToolByIdTest() {
		Assert.assertEquals(TEST_TOOL_NAME, test.getToolById(TEST_TOOL_TYPE_ID).getToolName().toUpperCase());
	}
	
	@Test
	public void getAllCheckedOutToolsTest() {
		Assert.assertEquals(TEST_TOOL_ID, test.getAllCheckedOutTools().get(test.getAllCheckedOutTools().size()-1).getToolId());
	}
	
	@Test
	public void getCheckedOutToolByIdTest() {
		Assert.assertEquals(TEST_TOOL_DESCRIPTION, test.getCheckedOutToolByToolId(TEST_TOOL_ID).getToolDescription());
	}
	
	@Test
	public void getToolsCheckedOutToMemberByNameTest() {
		Assert.assertEquals(TEST_TOOL_ID, test.getToolsCheckedOutToMemberByName(TEST_USER_NAME).get(0).getToolId());
	}
	
	@Test
	public void getToolsCheckedOutToMemberByDLTest() {
		Assert.assertEquals(TEST_TOOL_ID, test.getToolsCheckedOutToMemberByDL(TEST_D_L).get(0).getToolId());
	}
	
	@Test
	public void getToolsByReservationIdTest() {
		Assert.assertEquals(TEST_TOOL_ID, test.getToolsByReservationId(TEST_RESERVATION_ID).get(0).getToolId());
	}
	
}
