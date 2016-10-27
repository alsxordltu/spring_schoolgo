package com.example.repo;

import java.util.List;

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
		String stmt = NAME_SPACE + "deleteRouteRouteId";
		return template.update(stmt, routeId);
	}

	@Override
	public Route selectRoute(int routeId) {
		String stmt = NAME_SPACE + "selectRoute";
		return template.selectOne(stmt,routeId);
	}
	
	@Override
	public Route selectRouteDetail(int routeId) {
		String stmt = NAME_SPACE + "selectRouteComplex";
		return template.selectOne(stmt,routeId);
	}

	@Override
	public List<Route> selectRouteUserId(String userId) {
		String stmt = NAME_SPACE + "selectRouteUserId";
		return template.selectList(stmt,userId);
	}

	@Override
	public List<String> selectRouteNameListUserId(String userId) {
		String stmt = NAME_SPACE + "selectRouteNameListUserId";
		return template.selectList(stmt,userId);
	}

}
