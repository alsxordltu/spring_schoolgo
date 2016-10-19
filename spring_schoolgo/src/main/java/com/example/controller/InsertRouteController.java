package com.example.controller;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
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

import com.example.util.Json;

@Controller // 컨트롤러 선언
public class InsertRouteController {
	

	private static Logger logger = LoggerFactory.getLogger(InsertRouteController.class);

	@RequestMapping(value="/gotofindStation", method=RequestMethod.GET)
	public String gotologinForm(){
		return "insertroute/findStation";
	}
	
	@RequestMapping(value="/gotoinsert1", method=RequestMethod.GET)
	public String gotoinsert1(){
		return "insertroute/insert1";
	}
	
	@RequestMapping(value="/gotoinsert2", method=RequestMethod.GET)
	public String gotoinsert2(){
		return "insertroute/insert2";
	}
	@RequestMapping(value="/gotosearch", method=RequestMethod.GET) 
	public String gotosearch(){ return "main/search"; }	

	@RequestMapping(value="/gotosearch2", method=RequestMethod.GET) 
	public String gotosearch2(){ return "main/search2"; }	

	@RequestMapping(value="/getlocation", method=RequestMethod.GET) 
	public String gotoinsertroute(HttpServletRequest request,
			@RequestParam(value="resultstring")String resultstring,
			@RequestParam(value="resultstring2")String resultstring2,
			Model model) throws Exception{ 		
		//값 전달테스트
		logger.trace("getlocation, {}", resultstring);
		logger.trace("resultstring2, {}", resultstring2);
		String location = resultstring2;
		//좌표값받아오는처리
		
		//띄어쓰기->%20
		String url = resultstring;
		//String locationurl = url.replace(" ", "%20");
		//String encodeResult = URLEncoder.encode(locationurl, "UTF-8");
		//location.replace(" ", "%20");
		logger.trace("url : {} ", url);
		logger.trace("location : {} ", location);
		
		String encodelocation = URLEncoder.encode(location,"UTF-8");
		logger.trace("encodeurl : {}" , URLEncoder.encode(url,"UTF-8"));
		logger.trace("encodelocation : {} ", encodelocation);
		
		String resulturl = "https://apis.daum.net/local/geo/addr2coord?apikey=3e62ecc809bbf6026130d87653a9dd87&q="+ encodelocation.replace("+", "%20") +"&output=json";
		String resulturlgoo="https://maps.googleapis.com/maps/api/geocode/json?address="+ encodelocation.replace("+", "%20") +"&key=AIzaSyDMyDmCjogn6vLLZcCM-ZMCpNtk2BZoO5Y";
		logger.trace("resulturl : {}", resulturl);
		//logger.trace("resulturlgoo : {}" , resulturlgoo);
		logger.trace("plusdecodeloacation : {} ", encodelocation.replace("+", "%20") );
		/*logger.trace("encodeResult : {} " , encodelocation);
		// + -> 공백
		String plusspace = encodelocation.replace("+", "%2B");
		logger.trace("plusspace : {} " , plusspace);
		*/
		
/*		//json
		
		Json json = new Json(resulturlgoo);
		String jsonstr = json.json;
	    System.out.println(jsonstr);
	    logger.trace("jsonstr : {}" ,jsonstr);
		
	    JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject)parser.parse(jsonstr);
		JSONObject channel = (JSONObject)obj.get("channel");
					
		JSONArray item = (JSONArray)channel.get("item");
		Double lat;
		Double lng;

		for(int i=0;i<item.size();i++){
			
	         JSONObject tmp = (JSONObject)item.get(i);
	        
	         lat = (Double)tmp.get("lat");
	         lng = (Double)tmp.get("lng");
	         
	         logger.trace("위도 : {}", lat);
	         logger.trace("경도 : {}", lng);
		      
	      }
	*/
		
		model.addAttribute("searchdata",location);
		
		HttpSession session = request.getSession();
		session.setAttribute("start",resultstring2);
		String start = (String) session.getAttribute("start");
		if(start!=null){
			
		}
		
		logger.trace("start : {}" , session.getAttribute("start"));
		
        return "insertroute/insertroute"; 
		
	}			


	@RequestMapping(value="/getlocation2", method=RequestMethod.GET) 
	public String gotoinsertroute2(HttpServletRequest request, @RequestParam(value="resultstring3")String resultstring3, Model model) throws Exception{ 
		//값 전달테스트

		logger.trace("resultstring3, {}", resultstring3);

		String locationend = resultstring3;
		//좌표값받아오는처리
		

		logger.trace("location : {} ", locationend);
		

		HttpSession session = request.getSession();
		session.setAttribute("end",resultstring3);
		String end = (String) session.getAttribute("end");
		if(end!=null){
			
		}
		
		logger.trace("end : {}" , session.getAttribute("end"));
		logger.trace("startsession???? : {}", session.getAttribute("start"));

		model.addAttribute("searchdata2",locationend);
        return "insertroute/insertroute"; 
		
	}			


	
}
