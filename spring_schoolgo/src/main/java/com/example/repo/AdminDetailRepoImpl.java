package com.example.repo;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDetailRepoImpl implements AdminDetailRepo{

	@Autowired
	SqlSessionTemplate template;
	
	private final String NAME_SPACE = "com.example.AdminMapper.";
	

	@Override
	public List<HashMap<String, Integer>> selectcount() {
		String stmt = NAME_SPACE + "selectdetail";
		return template.selectList(stmt);
	}
}
