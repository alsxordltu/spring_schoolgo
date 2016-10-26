package com.example.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.Bus;
import com.example.dto.Route;
import com.example.dto.Step;
import com.example.dto.Vehicle;
import com.example.service.RouteService;
import com.example.util.Json;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller // 컨트롤러 선언
public class InsertRouteController {
	@Autowired
	RouteService rService;

	private static Logger logger = LoggerFactory.getLogger(InsertRouteController.class);

	@RequestMapping(value = "/gotoinsertresult", method = RequestMethod.GET)
	public String gotoinsertresult() {
		// 도시코드/.정류소코드/정류소이름 세션처리
		return "insertroute/insertresult";
	}

	@RequestMapping(value = "/gotofindStation", method = RequestMethod.GET)
	public String gotofindStation() {
		return "insertroute/findStation";
	}

	@RequestMapping(value = "/gotofindStation2", method = RequestMethod.GET)
	public String gotofindStation2() {
		return "insertroute/findStation2";
	}

	@RequestMapping(value = "/insertRoute", method = RequestMethod.POST)
	public @ResponseBody String insertRoute(@RequestParam String data, @RequestParam String routeName, HttpSession session) throws JsonParseException, JsonMappingException, IOException {
		logger.trace("body : {}", data);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> dataMap = mapper.readValue(data, Map.class);
		try {
			Route route = mapToRoute(dataMap, routeName, "andy");
			logger.trace("변환 결과 route: {}", route);
			rService.addRoute(route);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "insertroute/findStation2";
	}

	@RequestMapping(value = "/getRoute", method = RequestMethod.GET)
	public @ResponseBody String getRoute() {
		return "insertroute/findStation2";
	}

	@RequestMapping(value = "/deleteRoute", method = RequestMethod.GET)
	public @ResponseBody String deleteRoute() {
		return "insertroute/findStation2";
	}

	@RequestMapping(value = "/gotoinsert1", method = RequestMethod.GET)
	public String gotoinsert1(HttpServletRequest request) {
		HttpSession session = request.getSession();
		logger.trace("session start : {}", session.getAttribute("start"));
		logger.trace("session startlat위도 : {}", session.getAttribute("startlat"));
		logger.trace("session startlng경도 : {}", session.getAttribute("startlng"));
		logger.trace("session end : {}", session.getAttribute("end"));
		logger.trace("session endlat위도 : {}", session.getAttribute("endlat"));
		logger.trace("session endlng경도 : {}", session.getAttribute("endlng"));

		// 값 변수에 넣고
		String start = (String) session.getAttribute("start");
		String startlat = (String) session.getAttribute("startlat");
		String startlng = (String) session.getAttribute("startlng");
		String end = (String) session.getAttribute("end");
		String endlat = (String) session.getAttribute("endlat");
		String endlng = (String) session.getAttribute("endlng");
		String routename = request.getParameter("routename");
		logger.trace("routename : {}", routename);

		// 출발지 위도+경도 url 문자열 띄어쓰기를->%20
		String url = "https://maps.googleapis.com/maps/api/directions/json?" + "origin=" + startlat + ",%20" + startlng + "&destination=" + endlat + ",%20" + endlng
				+ "&mode=transit&key=AIzaSyD2AhXMW8KO4eZkRCQ1-6Gg3Fv4YOfYV58";

		return "insertroute/insert1";
	}

	@RequestMapping(value = "/gotoinsertbus", method = RequestMethod.GET)
	public String gotoinsertbus(HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model) throws Exception {
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();

		// 출발지와 도착지 String 변수로 받아옴
		String start = (String) session.getAttribute("start");
		String startStation = request.getParameter("resultStationName");

		/*
		 * String url=
		 * "https://maps.googleapis.com/maps/api/directions/json?origin=%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD%20%EC%9D%B8%EC%B2%9C%EA%B4%91%EC%97%AD%EC%8B%9C%20%EC%84%9C%EA%B5%AC%20%EA%B0%80%EC%A0%95%20%EB%89%B4%EC%84%9C%EC%9A%B8%EC%95%84%ED%8C%8C%ED%8A%B8&destination=%EB%B6%80%ED%8F%89&mode=transit&key=AIzaSyD2AhXMW8KO4eZkRCQ1-6Gg3Fv4YOfYV58";
		 * Json wc = new Json(url); String json = wc.json;
		 */
		String hometostation = request.getParameter("hometostation");
		String stationtoschool = request.getParameter("stationtoschool");
		session.setAttribute("hometostation", hometostation);
		session.setAttribute("stationtoschool", stationtoschool);
		logger.trace("hometostation : {}", session.getAttribute("hometostation"));
		logger.trace("stationtoschool : {}", session.getAttribute("stationtoschool"));
		int startstationCode = Integer.parseInt(request.getParameter("resultStationCode"));
		int endstationCode = Integer.parseInt(request.getParameter("resultStationCode2"));
		session.setAttribute("startstationCode", startstationCode);
		session.setAttribute("endstationCode", endstationCode);
		logger.trace("startstationCode : {}", session.getAttribute("startstationCode"));
		logger.trace("endstationCode : {}", session.getAttribute("endstationCode"));

		Double lat = (Double) session.getAttribute("lat");
		Double lng = (Double) session.getAttribute("lng");

		String url = "http://openapi.tago.go.kr/openapi/service/BusSttnInfoInqireService/getCrdntPrxmtSttnList?ServiceKey=4p8gjXJj%2B4VfiBP4lA6EaCb2GfldRUjt%2BV1wLsZcBIdSQe7cp9rN590UtQ%2FTWeifk9dkcd3whm4xmR%2F1Wo5K%2Bw%3D%3D&gpsLati="
				+ lat + "&gpsLong=" + lng + "&numOfRows=999&pageSize=999&pageNo=1&startPage=1&_type=json";
		Json wc = new Json(url);
		String json = wc.json;

		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject) parser.parse(json);

		JSONObject response2 = (JSONObject) obj.get("response");
		JSONObject body = (JSONObject) response2.get("body");
		JSONObject items = (JSONObject) body.get("items");
		JSONArray item = (JSONArray) items.get("item");
		List<Bus> bus = new ArrayList<>();

		for (int i = 0; i < item.size(); i++) {
			JSONObject tmp = (JSONObject) item.get(i);
			Long citycode = (Long) tmp.get("citycode");
			String citycodeString = Long.toString(citycode);
			String nodeid = (String) tmp.get("nodeid");
			String nodenm = (String) tmp.get("nodenm");
			Bus busClass = new Bus(citycodeString, nodeid, nodenm);
			bus.add(busClass);
		}
		logger.trace("buslist : {}", bus);
		model.addAttribute("buslist", bus);

		return "insertroute/insertbus";
	}

	@RequestMapping(value = "/gotosearch", method = RequestMethod.GET)
	public String gotosearch() {
		return "main/search";
	}

	@RequestMapping(value = "/gotosearch2", method = RequestMethod.GET)
	public String gotosearch2() {
		return "main/search2";
	}

	@RequestMapping(value = "/getlocation", method = RequestMethod.GET)
	public String gotoinsertroute(HttpServletRequest request, Model model) throws Exception {
		String start = request.getParameter("resultstring2");
		String startlat = request.getParameter("lat");
		String startlng = request.getParameter("lng");
		/*
		 * session.setAttribute("lat",lat); session.setAttribute("lng",lng);
		 * 검색어를 가지고 좌표값 가져오는 코드(구코드)
		 */
		logger.trace("start : {}", start);
		logger.trace("startlat위도 : {}", startlat);
		logger.trace("startlng경도 : {}", startlng);

		HttpSession session = request.getSession();
		session.setAttribute("start", start);
		session.setAttribute("startlat", startlat);
		session.setAttribute("startlng", startlng);

		logger.trace("session start : {}", session.getAttribute("start"));
		logger.trace("session startlat위도 : {}", session.getAttribute("startlat"));
		logger.trace("session startlng경도 : {}", session.getAttribute("startlng"));

		return "insertroute/insertroute";
	}

	@RequestMapping(value = "/getlocation2", method = RequestMethod.GET)
	public String gotoinsertroute2(HttpServletRequest request, Model model) throws Exception {
		String end = request.getParameter("resultstring2");
		String endlat = request.getParameter("lat");
		String endlng = request.getParameter("lng");
		/*
		 * session.setAttribute("lat",lat); session.setAttribute("lng",lng);
		 * 검색어를 가지고 좌표값 가져오는 코드(구코드)
		 */
		logger.trace("end : {}", end);
		logger.trace("endlat위도 : {}", endlat);
		logger.trace("endlng경도 : {}", endlng);

		HttpSession session = request.getSession();
		session.setAttribute("end", end);
		session.setAttribute("endlat", endlat);
		session.setAttribute("endlng", endlng);

		logger.trace("session end : {}", session.getAttribute("end"));
		logger.trace("session endlat위도 : {}", session.getAttribute("endlat"));
		logger.trace("session endlng경도 : {}", session.getAttribute("endlng"));

		return "insertroute/insertroute";
	}

	private Route mapToRoute(Map map, String routeName, Object userId) {
		Route route = new Route();
		route.setRouteName(routeName);
		userId = userId == null ? "null" : userId;
		route.setUserId(userId.toString());
		Set<Step> routeSteps = new HashSet<>();
		route.setStepSet(routeSteps);
		List<Map> routes = (List) map.get("routes");
		if(routes!=null){
			
			for (Map routesMap : routes) {
				Object legsObj = routesMap.get("legs");
				if (legsObj != null) {
					List<Map> legs = (List) legsObj;

					for (Map<String, Object> leg : legs) {
						Map<String, Object> distance = (Map) leg.get("distance");
						route.setDistance(objToStr(distance.get("value")));
						Map<String, Object> duration = (Map) leg.get("duration");
						route.setTime(objToStr(duration.get("value")));
						Map<String, Object> startLocation = (Map) leg.get("start_location");
						route.setStartLat(objToStr(startLocation.get("lat")));
						route.setStartLng(objToStr(startLocation.get("lng")));

						String startAddr = objToStr(leg.get("start_address"));
						route.setStartAddress(startAddr);
						Map<String, Object> endLocation = (Map) leg.get("end_location");
						route.setArriveLat(objToStr(endLocation.get("lat")));
						route.setArriveLng(objToStr(endLocation.get("lng")));
						String endAddress = objToStr(leg.get("end_address"));
						route.setArriveAddress(endAddress);
						logger.trace("route: {}", route);

						List<Map> steps = (List) leg.get("steps");
						for (int i = 0; i < steps.size(); i++) {

							Map<String, Object> step = steps.get(i);
							Step stepObj = new Step();
							routeSteps.add(stepObj);
							stepObj.setSeq(i);
							stepObj.setRouteId(route.getRouteId());
							Set<Vehicle> vehicles = new HashSet<>();
							stepObj.setVehicleSet(vehicles);

							stepObj.setStepName(objToStr(step.get("instructions")));
							String travelMode = objToStr(step.get("travel_mode"));
							stepObj.setVmode(travelMode);

							Map<String, Object> stepDistance = (Map) step.get("distance");
							stepObj.setRouteDistance(objToStr(stepDistance.get("value")));
							Map<String, Object> stepDuration = (Map) step.get("duration");
							stepObj.setRouteTime(objToStr(stepDuration.get("value")));

							Map<String, Object> stepStartLocation = (Map) step.get("start_location");
							stepObj.setStartLat(objToStr(stepStartLocation.get("lat")));
							stepObj.setStartLng(objToStr(stepStartLocation.get("lng")));
							Map<String, Object> stepEndLocation = (Map) step.get("end_location");
							stepObj.setEndLat(objToStr(stepEndLocation.get("lat")));
							stepObj.setEndLng(objToStr(stepEndLocation.get("lng")));
							logger.trace("step: {}, {}", i, stepObj);
							Object transitObj = step.get("transit");
							logger.trace("운송 수단: {}", transitObj);
							if (transitObj != null) {
								Vehicle vehicle = new Vehicle();
								vehicles.add(vehicle);
								
								Map<String, Object> transitDetails = (Map) transitObj;
								Map<String, Object> tDepartureStop = (Map) transitDetails.get("departure_stop");
								Map<String, Object> tArrivalStop = (Map) transitDetails.get("arrival_stop");
								vehicle.setStartName(objToStr(tDepartureStop.get("name")));
								vehicle.setStartLat(objToStr(tDepartureStop.get("lat")));
								vehicle.setStartLng(objToStr(tDepartureStop.get("lng")));
								vehicle.setEndName(objToStr(tArrivalStop.get("name")));
								vehicle.setEndLat(objToStr(tArrivalStop.get("lat")));
								vehicle.setEndLng(objToStr(tArrivalStop.get("lng")));
								
								String headSign = objToStr(transitDetails.get("headsign"));
								vehicle.setHeadsign(headSign);
								Integer numStops = (Integer) transitDetails.get("num_stops");
								vehicle.setVehicleMove(numStops.toString());
								Object lineObj = transitDetails.get("line");
								if (lineObj != null) {
									Map<String, Object> line = (Map) lineObj;
									String lineName = objToStr(line.get("name"));
									String shortName = objToStr(line.get("short_name"));
									vehicle.setVehicleName(lineName);
									vehicle.setVehicleNum(shortName);
								}
								logger.trace("vehicle: {}", vehicle);
							}
						}
					}
				}
			} //
		}
		
		return route;
	}
	
	private String objToStr(Object obj){
		if(obj==null){
			obj = "";
		}
		return obj.toString();
	}
}
