package com.example.repo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.User;

@Repository
public class UserrepoImpl implements Userrepo {

	@Autowired
	SqlSessionTemplate template;

	private final String NAME_SPACE = "com.example.UserMapper.";

	@Override
	public int insert(User user) {
		String stmt = NAME_SPACE + "insert";
		return template.update(stmt, user);
	}

}
