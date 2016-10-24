package com.example.controller;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dto.Bus;
import com.example.util.Json;


@Controller // 컨트롤러 선언
public class InsertRouteController {
	

	private static Logger logger = LoggerFactory.getLogger(InsertRouteController.class);

	@RequestMapping(value="/gotoinsertresult", method=RequestMethod.GET)
	public String gotoinsertresult(){
		return "insertroute/insertresult";
	}
		
	
	@RequestMapping(value="/gotofindStation", method=RequestMethod.GET)
	public String gotofindStation(){
		return "insertroute/findStation";
	}
	
	@RequestMapping(value="/gotofindStation2", method=RequestMethod.GET)
	public String gotofindStation2(){
		return "insertroute/findStation2";
	}
	
	@RequestMapping(value="/gotoinsert1", method=RequestMethod.GET)
	public String gotoinsert1(@RequestParam String routename, HttpServletRequest request){
		HttpSession session = request.getSession();
		session.setAttribute("routename", routename);
		logger.trace("routename : {}" , routename);
		return "insertroute/insert1";
	}
	
	@RequestMapping(value="/gotoinsertbus", method=RequestMethod.GET)
	public String gotoinsertbus(@RequestParam String hometostation,@RequestParam String stationtoschool,HttpServletRequest request,HttpSession session, HttpServletResponse response, Model model) throws Exception{
		response.setCharacterEncoding("UTF-8");
		session = request.getSession();
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
		
		Double lat = (Double)session.getAttribute("lat");
		Double lng = (Double)session.getAttribute("lng");
		
		String url="http://openapi.tago.go.kr/openapi/service/BusSttnInfoInqireService/getCrdntPrxmtSttnList?ServiceKey=4p8gjXJj%2B4VfiBP4lA6EaCb2GfldRUjt%2BV1wLsZcBIdSQe7cp9rN590UtQ%2FTWeifk9dkcd3whm4xmR%2F1Wo5K%2Bw%3D%3D&gpsLati="+ lat +"&gpsLong=" + lng +"&numOfRows=999&pageSize=999&pageNo=1&startPage=1&_type=json";
		Json wc = new Json(url);
		String json = wc.json;
		
		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject)parser.parse(json);
		
		JSONObject response2 = (JSONObject)obj.get("response");
		JSONObject body = (JSONObject)response2.get("body");
		JSONObject items = (JSONObject)body.get("items");
		JSONArray item = (JSONArray)items.get("item");
		List<Bus> bus = new ArrayList<>();
		
		for(int i=0;i<item.size();i++){	
			JSONObject tmp = (JSONObject)item.get(i);
			Long citycode = (Long)tmp.get("citycode");
			String citycodeString = Long.toString(citycode);
			String nodeid = (String)tmp.get("nodeid");
			String nodenm = (String)tmp.get("nodenm");			
			Bus busClass = new Bus(citycodeString, nodeid, nodenm);
			bus.add(busClass);		
		}
		logger.trace("buslist : {}", bus);
		model.addAttribute("buslist", bus);
		
		return "insertroute/insertbus";
	}
	@RequestMapping(value="/gotosearch", method=RequestMethod.GET) 
	public String gotosearch(){ return "main/search"; }	

	@RequestMapping(value="/gotosearch2", method=RequestMethod.GET) 
	public String gotosearch2(){ return "main/search2"; }	

	@RequestMapping(value="/getlocation", method=RequestMethod.GET) 
	public String gotoinsertroute(HttpServletRequest request,
			@RequestParam(value="resultstring2")String resultstring2,
			@RequestParam(value="lat")Double lat,
			@RequestParam(value="lng")Double lng,
			
			
			Model model) throws Exception{ 		

		HttpSession session = request.getSession();
		session.setAttribute("start",resultstring2);
		session.setAttribute("lat",lat);
		session.setAttribute("lng",lng);		
		logger.trace("start : {}" , session.getAttribute("start"));
		logger.trace("lat위도 : {}" , session.getAttribute("lat"));
		logger.trace("lng경도 : {}" , session.getAttribute("lng"));
		
		
        return "insertroute/insertroute"; 
		
	}			


	@RequestMapping(value="/getlocation2", method=RequestMethod.GET) 
	public String gotoinsertroute2(HttpServletRequest request,
			
			@RequestParam(value="resultstring2")String resultstring2,
			@RequestParam(value="lat")Double lat,
			@RequestParam(value="lng")Double lng,
			
			
			Model model) throws Exception{ 		

		HttpSession session = request.getSession();
		session.setAttribute("end",resultstring2);
		session.setAttribute("endlat",lat);
		session.setAttribute("endlng",lng);		
		logger.trace("end : {}" , session.getAttribute("end"));
		logger.trace("endlat위도 : {}" , session.getAttribute("endlat"));
		logger.trace("endlng경도 : {}" , session.getAttribute("endlng"));
				
        return "insertroute/insertroute"; 		
	}	
}
