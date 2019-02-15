package com.techelevator.model.dao;

import java.util.List;

import com.techelevator.model.domain.CheckedOutTool;
import com.techelevator.model.domain.Tool;

public interface ToolDAO {

	public List<Tool> getAllTools();
	
	public List<Tool> getAllAvailableTools();
	
	public Tool getToolById(int toolId);
	
	public List<CheckedOutTool> getAllCheckedOutTools();
	
	public CheckedOutTool getCheckedOutToolByToolId(int toolId);
	
	public List<CheckedOutTool> getToolsCheckedOutToMemberByName(String memberName);
	
	public List<CheckedOutTool> getToolsCheckedOutToMemberByDL(String driversLicense);
	
	public List<CheckedOutTool> getToolsByReservationId(int reservationId);
	
}
