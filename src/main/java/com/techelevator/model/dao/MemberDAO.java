package com.techelevator.model.dao;

import java.util.List;

import com.techelevator.model.domain.Member;

public interface MemberDAO {

	public List<Member> getAllMembers();
	
	public Member getMemberById(int id);
}
