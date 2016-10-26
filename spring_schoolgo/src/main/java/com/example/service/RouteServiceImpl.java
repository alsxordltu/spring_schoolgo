package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.repo.RouteRepo;

@Service
public class RouteServiceImpl implements RouteService{
	@Autowired
	RouteRepo rRepo;

	@Override
	public void addRoute() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getRoute(Integer routeId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteRoute() {
		// TODO Auto-generated method stub
		
	}
}
