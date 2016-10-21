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
	public String gotoinsert1(@RequestParam String routename, HttpServletRequest request){
		HttpSession session = request.getSession();
		session.setAttribute("routename", routename);
		logger.trace("routename : {}" , routename);
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
