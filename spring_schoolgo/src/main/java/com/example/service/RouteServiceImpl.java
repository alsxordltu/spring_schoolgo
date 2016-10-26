package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dto.Route;
import com.example.repo.RouteRepo;

@Service
public class RouteServiceImpl implements RouteService{
	@Autowired
	RouteRepo rRepo;

	@Override
	public int addRoute(Route route) {
		return rRepo.insertRoute(route);
	}

	@Override
	public Route getRoute(Integer routeId) {
		return rRepo.selectRoute(routeId);
	}

	@Override
	public int deleteRoute(Integer routeId) {
		return rRepo.deleteRoute(routeId);
	}


}
