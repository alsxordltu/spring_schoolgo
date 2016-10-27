package com.example.repo;

import java.util.List;

import com.example.dto.Route;

public interface RouteRepo {
	public int insertRoute(Route route);
	public int deleteRoute(int routeId);
	public Route selectRoute(int routeId);
	public List<Route> selectRouteUserId(String userId);	
}
