package com.example.service;

import com.example.dto.Route;

public interface RouteService {
	int addRoute(Route route);
	Route getRoute(Integer routeId);
	int deleteRoute(Integer routeId);
}
