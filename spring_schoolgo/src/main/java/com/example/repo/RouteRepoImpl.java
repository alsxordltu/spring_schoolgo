package com.example.repo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.Route;

@Repository
public class RouteRepoImpl implements RouteRepo{

	@Autowired
	SqlSessionTemplate template;
	
	private final String NAME_SPACE = "com.example.RouteMapper.";
	
	@Override
	public int insertRoute(Route route) {
		String stmt = NAME_SPACE + "insertRoute";
		return template.update(stmt, route);
	}

	@Override
	public int deleteRoute(int routeId) {
		String stmt = NAME_SPACE + "deleteRoute";
		return template.update(stmt, routeId);
	}

	@Override
	public Route selectRoute(int routeId) {
		String stmt = NAME_SPACE + "selectRoute";
		return template.selectOne(stmt,routeId);
	}

}
