package com.techelevator.model.jdbc;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import com.techelevator.model.dao.ToolDAO;
import com.techelevator.model.domain.AvailableTool;
import com.techelevator.model.domain.CheckedOutTool;
import com.techelevator.model.domain.Tool;

@Component
public class JDBCToolDAO implements ToolDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCToolDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public Tool getToolById(int toolId) {
		
		Tool newTool = new CheckedOutTool();
		
		String sqlGetToolById = "SELECT * FROM tool JOIN tool_type ON tool_type_id = tool_type_id WHERE tool_id = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetToolById, toolId);
		
		while(results.next()) {
			newTool = mapRowToAvailableTool(results);
		}
		return newTool;
	}

	@Override
	public List<Tool> getAllTools() {
		List<Tool> allTools = new ArrayList<>();

		allTools.addAll(getAllCheckedOutTools());
		allTools.addAll(getAllAvailableTools());

		return allTools;
	}

	@Override
	public List<Tool> getAllAvailableTools() {
		List<Tool> listOfAvailableTools = new ArrayList<>();

		LocalDate date = LocalDate.now();

		String sqlListAllTools = "SELECT tool_id, tool_name, tool_description "
				+ "FROM tool JOIN tool_type ON tool_type_id = tool_type_id " + "WHERE tool_id NOT IN "
				+ "(SELECT tool_id " + "FROM tool JOIN tool_reservation ON tool_id = tool_id "
				+ "JOIN reservation ON reservation_id = reservation_id "
				+ "WHERE ((to_date(?, 'YYYY/MM/DD')) <= to_date AND (to_date(?, 'YYYY/MM/DD')) >= from_date))";

		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlListAllTools, date.toString(), date.toString());

		while (results.next()) {
			Tool theTool = mapRowToAvailableTool(results);
			listOfAvailableTools.add(theTool);
		}
		return listOfAvailableTools;
	}

	@Override
	public List<CheckedOutTool> getAllCheckedOutTools() {

		List<CheckedOutTool> listOfCheckedOutTools = new ArrayList<>();

		LocalDate date = LocalDate.now();

		String sqlListAllTools = "SELECT tool_id, tool_name, tool_description, to_date, user_name, from_date, to_date  "
								+"FROM tool JOIN tool_type ON tool_type_id = tool_type_id "
								+"LEFT JOIN tool_reservation ON tool_id = tool_id "
								+"LEFT JOIN reservation ON reservation_id = reservation_id "
								+"LEFT JOIN app_user ON app_user_id = app_user_id "
								+"WHERE ((to_date(?, 'YYYY/MM/DD')) <= to_date AND (to_date(?, 'YYYY/MM/DD')) >= from_date) "
								+"ORDER BY tool_id";
				
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlListAllTools, date.toString(), date.toString());

		while (results.next()) {
			
			CheckedOutTool theTool = mapRowToCheckedOutTool(results);
			listOfCheckedOutTools.add(theTool);
		
		}

		return listOfCheckedOutTools;
	}

	@Override
	public CheckedOutTool getCheckedOutToolByToolId(int toolId) {
		
		CheckedOutTool theTool = new CheckedOutTool();
		LocalDate date = LocalDate.now();

		String sqlListAllTools = "SELECT tool_id, tool_name, tool_description, reservation_id, user_name, from_date, to_date "
								+"FROM tool JOIN tool_type ON tool_type_id = tool_type_id "
								+"LEFT JOIN tool_reservation ON tool_id = tool_id "
								+"LEFT JOIN reservation ON reservation_id = reservation_id "
								+"LEFT JOIN app_user ON app_user_id = app_user_id "
								+"WHERE ((to_date(?, 'YYYY/MM/DD')) <= to_date AND (to_date(?, 'YYYY/MM/DD')) >= from_date) AND tool_id = ?";
				
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlListAllTools, date.toString(), date.toString(), toolId);

		while (results.next()) {
			
			theTool = mapRowToCheckedOutTool(results);
		}

		return theTool;
	}

	@Override
	public List<CheckedOutTool> getToolsCheckedOutToMemberByName(String memberName) {
		
		List<CheckedOutTool> listOfCheckedOutTools = new ArrayList<>();

		LocalDate date = LocalDate.now();

		String sqlListAllTools = "SELECT tool_id, tool_name, tool_description, reservation_id, user_name, from_date, to_date "
								+"FROM tool JOIN tool_type ON tool_type_id = tool_type_id "
								+"LEFT JOIN tool_reservation ON tool_id = tool_id "
								+"LEFT JOIN reservation ON reservation_id = reservation_id "
								+"LEFT JOIN app_user ON app_user_id = app_user_id "
								+"WHERE ((to_date(?, 'YYYY/MM/DD')) <= to_date AND (to_date(?, 'YYYY/MM/DD')) >= from_date) AND user_name = ?";
				
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlListAllTools, date.toString(), date.toString(), memberName.toUpperCase());

		while (results.next()) {
			
			CheckedOutTool theTool = mapRowToCheckedOutTool(results);
			listOfCheckedOutTools.add(theTool);
		
		}

		return listOfCheckedOutTools;
	}

	@Override
	public List<CheckedOutTool> getToolsCheckedOutToMemberByDL(String driversLicense) {
		List<CheckedOutTool> listOfCheckedOutTools = new ArrayList<>();

		LocalDate date = LocalDate.now();

		String sqlListAllTools = "SELECT tool_id, tool_name, tool_description, reservation_id, user_name, from_date, to_date "
								+"FROM tool JOIN tool_type ON tool_type_id = tool_type_id "
								+"LEFT JOIN tool_reservation ON tool_id = tool_id "
								+"LEFT JOIN reservation ON reservation_id = reservation_id "
								+"LEFT JOIN app_user ON app_user_id = app_user_id "
								+"WHERE ((to_date(?, 'YYYY/MM/DD')) <= to_date AND (to_date(?, 'YYYY/MM/DD')) >= from_date) AND drivers_license = ?";
				
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlListAllTools, date.toString(), date.toString(), driversLicense);

		while (results.next()) {
			
			CheckedOutTool theTool = mapRowToCheckedOutTool(results);
			listOfCheckedOutTools.add(theTool);
		
		}

		return listOfCheckedOutTools;
	}

	@Override
	public List<CheckedOutTool> getToolsByReservationId(int reservationId) {
		
		List<CheckedOutTool> listOfCheckedOutTools = new ArrayList<>();

		LocalDate date = LocalDate.now();

		String sqlListAllTools = "SELECT tool_id, tool_name, tool_description, user_name, from_date, to_date "
								+"FROM tool JOIN tool_type ON tool_type_id = tool_type_id "
								+"LEFT JOIN tool_reservation ON tool_id = tool_id "
								+"LEFT JOIN reservation ON reservation_id = reservation_id "
								+"LEFT JOIN app_user ON app_user_id = app_user_id "
								+"WHERE ((to_date(?, 'YYYY/MM/DD')) <= to_date AND (to_date(?, 'YYYY/MM/DD')) >= from_date) AND reservation_id = ?";
				
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlListAllTools, date.toString(), date.toString(), reservationId);

		while (results.next()) {
			
			CheckedOutTool theTool = mapRowToCheckedOutTool(results);
			listOfCheckedOutTools.add(theTool);
		
		}

		return listOfCheckedOutTools;
	}

	public Tool mapRowToAvailableTool(SqlRowSet results) {

		Tool newTool = new AvailableTool();

		String toolName = results.getString("tool_name").substring(0, 1)
				+ results.getString("tool_name").toLowerCase().substring(1).toLowerCase();

		newTool.setToolId(results.getInt("tool_id"));
		newTool.setToolName(toolName);
		newTool.setToolDescription(results.getString("tool_description"));
		newTool.setAvailable(true);
		
		return newTool;
	}

	public CheckedOutTool mapRowToCheckedOutTool(SqlRowSet results) {

		CheckedOutTool newTool = new CheckedOutTool();

		String toolName = results.getString("tool_name").substring(0, 1)
				+ results.getString("tool_name").toLowerCase().substring(1).toLowerCase();
		String memberName = results.getString("user_name").substring(0, 1)
				+ results.getString("user_name").toLowerCase().substring(1).toLowerCase();
		String checkoutDate = results.getString("from_date").substring(5) + "-"
				+ results.getString("from_date").substring(0, 4);
		String returnDate = results.getString("to_date").substring(5) + "-"
				+ results.getString("to_date").substring(0, 4);
		
		newTool.setToolId(results.getInt("tool_id"));
		newTool.setToolName(toolName);
		newTool.setToolDescription(results.getString("tool_description"));
		newTool.setMemberName(memberName);
		newTool.setCheckoutDate(checkoutDate);
		newTool.setReturnDate(returnDate);
		newTool.setAvailable(false);
		
		return newTool;
	}

}
