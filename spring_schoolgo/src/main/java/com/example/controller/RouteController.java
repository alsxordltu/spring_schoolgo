package com.example.controller;

import java.io.IOException;
import java.net.URI;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.example.dto.Route;
import com.example.service.RouteService;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class RouteController {
	private static final Logger logger = LoggerFactory.getLogger(RouteController.class);
	@Autowired
	RouteService rService;
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public @ResponseBody Map mapInfo() {

		String requestUrl = "https://maps.googleapis.com/maps/api/directions/json";
		requestUrl += "?origin=37.524673,%20126.678182";
		requestUrl += "&destination=37.489678,%20126.724595";	
		requestUrl += "&mode=transit";
		requestUrl += "&alternatives=true";
		requestUrl += "&language=ko";
		requestUrl += "&key=AIzaSyDgoDTqv8wf1KKvxQQfP0IYeAYXfAVhCRs";

		RestTemplate template = new RestTemplate();
		
		URI url = URI.create(requestUrl);
		RequestEntity<Void> reqEntity
		= RequestEntity.get(url).accept(MediaType.APPLICATION_JSON_UTF8).acceptCharset(Charset.forName("UTF-8")).build();

		ResponseEntity<HashMap> resEntity = template.exchange(reqEntity, HashMap.class);
		
		HashMap<String, Object> map = resEntity.getBody();
		String status = map.get("status").toString();
		if(status.equals("OK")){
			List<Map> routes = (List)map.get("routes");
			for(Map routesMap : routes){		//배열이므로 for문
				/*Map<String, Object> bounds = (Map)routesMap.get("bounds");
				Map<String, String> northeast = (Map)bounds.get("northeast");
				Map<String, String> southwest = (Map)bounds.get("southwest");
				logger.trace("북동: {}, 남서: {}",northeast, southwest);*/
				List<Map> legs = (List)routesMap.get("legs");
				for(Map<String, Object> leg: legs){	//배열이므로 for문
					Map<String, Object> arrivalTime = (Map)leg.get("arrival_time");
					logger.trace("도착 예정 시간 : {}", arrivalTime);
					Map<String, Object> departureTime = (Map)leg.get("departure_time");
					logger.trace("출발 예정 시간 : {}", departureTime);
					Map<String, Object> distance = (Map)leg.get("distance");
					logger.trace("거리 정보 : {}", distance);
					Map<String, Object> duration = (Map)leg.get("duration");
					logger.trace("시간 정보 : {}", duration);
					Map<String, Object> startLocation = (Map)leg.get("start_location");
					logger.trace("출발지 : {}", startLocation);
					String startAddr = leg.get("start_address").toString();
					logger.trace("출발지 주소: {}", startAddr);
					Map<String, Object> endLocation = (Map)leg.get("end_location");
					logger.trace("종착지 : {}", endLocation);
					String endAddress = leg.get("end_address").toString();
					logger.trace("종착지 주소: {}", endAddress);
					
					List<Map> steps = (List)leg.get("steps");
					for(Map<String, Object> step: steps){
						String instruction = step.get("html_instructions").toString(); 
						String travelMode = step.get("travel_mode").toString();
						logger.trace("경유지 정보 : {}, 이동 모드: {}", instruction, travelMode);
						Map<String, Object> stepDistance = (Map)step.get("distance");
						logger.trace("     거리 정보 : {}", stepDistance);
						Map<String, Object> stepDuration = (Map)step.get("duration");
						logger.trace("     시간 정보 : {}", stepDuration);
						Map<String, Object> stepStartLocation = (Map)step.get("start_location");
						logger.trace("     출발지 : {}", stepStartLocation);
						Map<String, Object> stepEndLocation = (Map)step.get("end_location");
						logger.trace("     종착지 : {}", stepEndLocation);
						Object transitObj = step.get("transit_details");
						if(transitObj!=null){
							Map<String, Object> transitDetails = (Map)transitObj;
							Map<String, Object> tDepartureStop = (Map)transitDetails.get("departure_stop");
							Map<String, Object> tDepartureTime = (Map)transitDetails.get("departure_time");
							Map<String, Object> tArrivalStop = (Map)transitDetails.get("arrival_stop");
							Map<String, Object> tArrivalTime = (Map)transitDetails.get("arrival_time");
							logger.trace("     운송 수단 정보 출발 시간{}, 출발 위치{}, 도착 시간{}, 도착 위치{}", tDepartureTime,tDepartureStop,tArrivalTime, tArrivalStop);
							String headSign = transitDetails.get("headsign").toString();
							logger.trace("     headsign은 머야? {}", headSign);
							Integer headWay = (Integer)transitDetails.get("headway");
							logger.trace("     headWay은 머야? {}", headWay);
							Integer numStops = (Integer)transitDetails.get("num_stops");
							Object lineObj = transitDetails.get("line");
							
							if(lineObj!=null){
								Map<String, Object> line = (Map)lineObj;
								String lineName = line.get("name").toString();
								String shortName = null;
								if(line.get("short_name") != null){
									shortName = line.get("short_name").toString();
								}
								Map<String, String> vehicle = (Map)line.get("vehicle");
								String vehicleName = vehicle.get("name");
								logger.trace("     {}{} {}번으로 {}칸 이동", lineName, vehicleName, shortName, numStops);
							}
						}
					}
				}
				logger.trace("legs : {}",legs.size());

				
			}
		}else{
			logger.trace("request fail: {}", status);
		}
		
		return resEntity.getBody();
	}
	
	@RequestMapping(value = "/deleteRoute", method = RequestMethod.POST)
	public  String insertRoute(HttpServletRequest request) {
		logger.trace("컨트롤러");
		String routeId = request.getParameter("routeid");
		logger.trace("routeId : {}", routeId);
		rService.deleteRoute(Integer.parseInt(routeId));
		logger.trace("삭제완료");
		return "main/main";
	}
	@RequestMapping(value = "/gotoroutetest", method = RequestMethod.GET)
	public String gotoroutetest() {
		return "insertroute/routetest";
	}
}