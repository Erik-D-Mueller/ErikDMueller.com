package com.techelevator.model.dao;

import com.techelevator.model.domain.User;

public interface UserDAO {

	public void saveUser(String userName, String password, String driversLicense, String role);

	public boolean searchForUsernameAndPassword(String userName, String password);

	public void updatePassword(String userName, String password);

	public User getUserByUserName(String userName);

	void updateDL(String userName, String newDL);

}
