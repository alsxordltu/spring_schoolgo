package com.example.service;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dto.Route;
import com.example.dto.Step;
import com.example.dto.Vehicle;
import com.example.repo.RouteRepo;
import com.example.repo.StepRepo;
import com.example.repo.VehicleRepo;

@Service
public class RouteServiceImpl implements RouteService{
	
	@Autowired
	RouteRepo rRepo;
	@Autowired
	StepRepo sRepo;
	@Autowired
	VehicleRepo vRepo;

	@Override
	@Transactional
	public void addRoute(Route route) {
		rRepo.insertRoute(route);
		
		List<Step> steps = route.getStepList();
		for(Step step: steps){
			step.setRouteId(route.getRouteId());
			sRepo.insertStep(step);
			List<Vehicle> vehicles = step.getVehicleList();
			for(Vehicle vehicle: vehicles){
				vehicle.setStepId(step.getStepId());
				vRepo.insertVehicle(vehicle);
			}
		}
	}

	@Override
	public Route getRoute(Integer routeId) {
		return rRepo.selectRoute(routeId);
	}

	@Override
	@Transactional
	public void deleteRoute(Route route) {
		Integer routeId = route.getRouteId();
		List<Step> steps = route.getStepList();
		for(Step step: steps){
			Integer stepId = step.getStepId();
			vRepo.deleteVehicle(stepId);
			System.out.println("vehicle 삭제");
		}
		sRepo.deleteStep(routeId);
		System.out.println("step 삭제 완료");
		rRepo.deleteRoute(routeId);
		System.out.println("route 삭제 완료");
	}

	@Override
	public List<Route> getRouteUserId(String userId) {
		return rRepo.selectRouteUserId(userId);
	}

	@Override
	public List<String> selectRouteNameListUserId(String userId) {
		return rRepo.selectRouteNameListUserId(userId);
	}

	@Override
	public Route getRouteDetail(Integer routeId) {
		return rRepo.selectRouteDetail(routeId);
	}
}
