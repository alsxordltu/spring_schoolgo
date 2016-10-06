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
	public List<String> getUser() {
		String stmt = NAME_SPACE + "getAllUserId";
		return template.selectList(stmt);
	}


	@Override
	public String getPassbyId(String userId) {
		String stmt = NAME_SPACE + "getPassbyId";
		return template.selectOne(stmt, userId);
	}



}
