package com.example.repo;

import com.example.dto.Route;

public interface RouteRepo {
	public int insertRoute(Route route);
	public int deleteRoute(int routeId);
	public Route selectRoute(int routeId);
}
