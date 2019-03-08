package com.techelevator.model.domain;

public abstract class Tool {
	
    // These are the instance variables of this class
	//We usually write them first
	private int toolId;
	private String toolName;
	private String toolDescription;
	private boolean isAvailable;
	
	
	//These are the methods of this class
	public int getToolId() {
		return toolId;
	}
	public void setToolId(int toolId) {
		this.toolId = toolId;
	}
	public String getToolName() {
		return toolName;
	}
	public void setToolName(String toolName) {
		this.toolName = toolName;
	}
	public String getToolDescription() {
		return toolDescription;
	}
	public void setToolDescription(String toolDescription) {
		this.toolDescription = toolDescription;
	}
	public boolean isAvailable() {
		return isAvailable;
	}
	public void setAvailable(boolean isAvailable) {
		this.isAvailable = isAvailable;
	}
	
}
