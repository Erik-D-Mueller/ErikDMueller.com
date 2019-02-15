package com.techelevator;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.model.dao.MemberDAO;
import com.techelevator.model.domain.Member;
import com.techelevator.model.jdbc.JDBCMemberDAO;

public class MemberDAOIntegrationTest extends DAOIntegrationTest{
	private DataSource dataSource;
	private MemberDAO test;
	private JdbcTemplate jdbcTemplate;
	

	private final int TEST_APP_USER_ID = 99999;
	private final String TEST_USER_NAME = "A RANDOM PERSON";
	private final String TEST_PASSWORD = "A.RANDOM.PASSWORD";
	private final String TEST_ROLE = "Member";
	private final String TEST_D_L = "DL99999";
	private final String TEST_SALT = "99999";
	
	@Before
	public void setup() {

		dataSource = super.getDataSource();
		test = new JDBCMemberDAO(dataSource);
		jdbcTemplate = new JdbcTemplate(dataSource);

		String newUser = "INSERT INTO app_user (app_user_id, user_name, password, role, drivers_license, salt) VALUES (?,?,?,?,?,?)";

		jdbcTemplate.update(newUser, TEST_APP_USER_ID, TEST_USER_NAME, TEST_PASSWORD, TEST_ROLE, TEST_D_L, TEST_SALT);
	}
	
	@Test
	public void constructorTest() {

		JDBCMemberDAO test2 = new JDBCMemberDAO(dataSource);

		Assert.assertNotNull(test2);
	}
	
	@Test
	public void getAllMembersTest() {
		List<Member> listOfAllMembers = new ArrayList<>();
		listOfAllMembers = test.getAllMembers();

		Assert.assertNotNull(listOfAllMembers);
		Assert.assertEquals("Mason", listOfAllMembers.get(0).getMemberName());
	}
	
	@Test
	public void getMemberByIdTest() {
		Assert.assertEquals("Mason", test.getMemberById(2).getMemberName());
	}

}
