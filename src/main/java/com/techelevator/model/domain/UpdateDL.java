package com.techelevator.model.domain;

import javax.validation.constraints.AssertTrue;
import org.hibernate.validator.constraints.NotBlank;

public class UpdateDL {
	
	@NotBlank(message="Please enter a driver's license")
	private String newDL;
	
	@NotBlank(message="Please confirm your driver's license")
	private String confirmDL;

	@AssertTrue(message="Driver's licenses must match")
	public boolean isDLMatching() {
		if(newDL != null) {
			return newDL.equals(confirmDL);
		} else {
			return false;
		}
	}
	
	public String getNewDL() {
		return newDL;
	}

	public void setNewDL(String newDL) {
		this.newDL = newDL;
	}

	public String getConfirmDL() {
		return confirmDL;
	}

	public void setConfirmDL(String confirmDL) {
		this.confirmDL = confirmDL;
	}
	
}