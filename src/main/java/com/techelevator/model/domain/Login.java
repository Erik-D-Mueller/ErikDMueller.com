package com.techelevator.model.domain;

import org.hibernate.validator.constraints.NotBlank;

public class Login {
	
	@NotBlank(message="User name is required")
	private String userName;
	
	@NotBlank(message="Password is required")
	private String password;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
