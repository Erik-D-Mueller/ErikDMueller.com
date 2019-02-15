package com.techelevator.model.jdbc;

import javax.sql.DataSource;

import org.bouncycastle.util.encoders.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import com.techelevator.model.dao.UserDAO;
import com.techelevator.model.domain.User;
import com.techelevator.security.PasswordHasher;

@Component
public class JDBCUserDAO implements UserDAO {

	private JdbcTemplate jdbcTemplate;
	private PasswordHasher hashMaster;

	@Autowired
	public JDBCUserDAO(DataSource dataSource, PasswordHasher hashMaster) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.hashMaster = hashMaster;
	}

	@Override
	public void saveUser(String userName, String password, String driversLicense, String role) {
		byte[] salt = hashMaster.generateRandomSalt();
		String hashedPassword = hashMaster.computeHash(password, salt);
		String saltString = new String(Base64.encode(salt));

		jdbcTemplate.update("INSERT INTO app_user(user_name, password, drivers_license, salt, role) VALUES (?, ?, ?, ?, ?)", userName.toUpperCase(),
				hashedPassword, driversLicense, saltString, role);
	}

	@Override
	public boolean searchForUsernameAndPassword(String userName, String password) {
		String sqlSearchForUser = "SELECT * " + "FROM app_user " + "WHERE UPPER(user_name) = ? ";

		SqlRowSet user = jdbcTemplate.queryForRowSet(sqlSearchForUser, userName.toUpperCase());
		if (user.next()) {
			String dbSalt = user.getString("salt");
			String dbHashedPassword = user.getString("password");
			String givenPassword = hashMaster.computeHash(password, Base64.decode(dbSalt));
			return dbHashedPassword.equals(givenPassword);
		} else {
			return false;
		}
	}

	@Override
	public void updatePassword(String userName, String password) {
		byte[] salt = hashMaster.generateRandomSalt();
		String hashedPassword = hashMaster.computeHash(password, salt);
		String saltString = new String(Base64.encode(salt));
		
		jdbcTemplate.update("UPDATE app_user SET password = ?, salt = ? WHERE user_name = ?", hashedPassword, saltString, userName.toUpperCase());
	}
	
	@Override
	public void updateDL(String userName, String driversLicense) {
		jdbcTemplate.update("UPDATE app_user SET drivers_license = ? WHERE user_name = ?", driversLicense, userName.toUpperCase());
	}

	@Override
	public User getUserByUserName(String userName) {
		String sqlSearchForUsername = "SELECT * " + "FROM app_user " + "WHERE UPPER(user_name) = ? ";

		SqlRowSet user = jdbcTemplate.queryForRowSet(sqlSearchForUsername, userName.toUpperCase());
		User thisUser = null;
		if (user.next()) {
			thisUser = new User();
			String unformatted = user.getString("user_name");
			String[] words = unformatted.split(" ");
			String theName = "";
			for(int i = 0; i < words.length; i++) {
				theName += words[i].substring(0,1) + words[i].substring(1).toLowerCase() + " ";
			}
			theName = theName.trim();
			thisUser.setUserName(theName);
			thisUser.setPassword(user.getString("password"));
			thisUser.setDriversLicense(user.getString("drivers_license"));
			thisUser.setRole(user.getString("role"));
		}

		return thisUser;
	}

}
