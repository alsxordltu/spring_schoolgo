package com.example.repo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.dto.User;

@Repository
public class UserrepoImpl implements Userrepo {

	@Autowired
	SqlSessionTemplate template;
	
	@Autowired
	JdbcTemplate jtemplate;

	private final String NAME_SPACE = "com.example.UserMapper.";

	@Override
	public int insert(User user) {
		String stmt = NAME_SPACE + "insert";
		return template.update(stmt, user);
	}
	
	@Override
	public int update(User user) {
		String stmt = NAME_SPACE + "update";
		return template.update(stmt,user);
	}	
	
	@Override
	public int delete(User user) {
		String stmt = NAME_SPACE + "delete";
		return template.delete(stmt,user);
	}	

	@Override
	public List<String> getUser() {
		String stmt = NAME_SPACE + "getAllUserId";
		return template.selectList(stmt);
	}


	@Override
	public String getPassbyId(String userId) {
		String stmt = NAME_SPACE + "getPassbyId";
		return template.selectOne(stmt, userId);
	}


	@Override
	public User getUserInfo(String userId) {
		String stmt = NAME_SPACE + "getUserInfobyId";
		return template.selectOne(stmt,userId);
	}

	@Override
	public List<String> getUserNickname() {
		String stmt = NAME_SPACE + "getAllNickname";
		return template.selectList(stmt);
	}





}
