package com.example.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.controller.BoardinsertController;
import com.example.dto.Route;
import com.example.dto.Step;
import com.example.dto.Vehicle;
import com.example.repo.RouteRepo;
import com.example.repo.StepRepo;
import com.example.repo.VehicleRepo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class RouteServiceImpl implements RouteService{
	
	private static Logger logger = LoggerFactory.getLogger(RouteServiceImpl.class);
	
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
	public void deleteRoute(Integer routeId) {
		 rRepo.deleteRoute(routeId);
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
	public String test(String userId) {
		ObjectMapper mapper = new ObjectMapper();

		List<Route> list = rRepo.selectRouteUserId(userId);
		String data ;
		try {
			data = mapper.writeValueAsString(list);
			logger.trace("list : {}", data);
			return data;
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
/*		for(Route route : list)
			JSONObject routeInfo = new JSONObject();
			routeInfo.put("userId", route.getUserId());
			routeInfo.put("routeId", route.getRouteId());
			routeInfo.put("routeName", route.getRouteName());
			routeInfo.put("startLat", route.getStartLat());
			routeInfo.put("startLng", route.getStartLng());
			routeInfo.put("startAddress", route.getStartAddress());
			routeInfo.put("arriveLat", route.getArriveLat());
			routeInfo.put("arriveLng", route.getArriveLng());
			routeInfo.put("arrveAddress", route.getArriveAddress());
			routeInfo.put("distance", route.getDistance());
			routeInfo.put("time", route.getTime());
			
			JSONArray stepArray = new JSONArray();
			List<Step> list2 = sRepo.test1();
			for(Step step : list2){
				JSONObject stepInfo = new JSONObject();
				stepInfo.put("stepId", step.getStepId());
				stepInfo.put("routeId", step.getRouteId());
				stepInfo.put("vmode", step.getVmode());
				stepInfo.put("stepName", step.getStepName());
				stepInfo.put("startLat", step.getStartLat());
				stepInfo.put("startLng", step.getStartLng());
				stepInfo.put("endLat", step.gete);
				stepInfo.put("endLng", step);
				stepInfo.put("routeDistance", step);
				stepInfo.put("routeTime", step);
				stepInfo.put("seq", step);
				
			}
		}
		routelist.put("routelist", routeArray);*/
		return null;
	}


}
