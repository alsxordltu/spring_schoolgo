package com.example.service;

import java.util.List;

import com.example.dto.Route;

public interface RouteService {
	void addRoute(Route route);
	Route getRoute(Integer routeId);
	List<Route> getRouteUserId(String userId);	
	void deleteRoute(Integer routeId);
	
}
