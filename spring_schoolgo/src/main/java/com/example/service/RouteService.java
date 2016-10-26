package com.example.service;

import com.example.dto.Route;

public interface RouteService {
	void addRoute(Route route);
	Route getRoute(Integer routeId);
	void deleteRoute(Integer routeId);
}
