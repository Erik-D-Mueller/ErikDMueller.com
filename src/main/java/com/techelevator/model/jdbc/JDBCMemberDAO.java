package com.techelevator.model.jdbc;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.dao.MemberDAO;
import com.techelevator.model.domain.Member;

@Component
public class JDBCMemberDAO implements MemberDAO {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCMemberDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Member> getAllMembers() {

		List<Member> searchForAllMembers = new ArrayList<>();
		
		String sqlSearchForAllMembers = "SELECT app_user_id, user_name "
										+"FROM app_user "
										+"WHERE role = 'MEMBER'";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForAllMembers);
		
		while(results.next()) {
			Member theMember = mapRowToMember(results);
			searchForAllMembers.add(theMember);
		}
		
		return searchForAllMembers;
	}
	
	@Override
	public Member getMemberById(int id) {
		
		Member theMember = new Member();
		
		String sqlSearchForAllMembers = "SELECT app_user_id, user_name "
										+"FROM app_user "
										+"WHERE role = 'MEMBER' AND app_user_id=?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForAllMembers, id);
		
		while(results.next()) {
			
			theMember = mapRowToMember(results);
		}
		
		return theMember;
	}

	
	public Member mapRowToMember(SqlRowSet results) {
		
		Member theMember = new Member();
		
		String memberName = results.getString("user_name").substring(0, 1) + results.getString("user_name").toLowerCase().substring(1).toLowerCase();
	
		theMember.setMemberId(results.getInt("app_user_id"));
		theMember.setMemberName(memberName);
		
		return theMember;
	}

}
