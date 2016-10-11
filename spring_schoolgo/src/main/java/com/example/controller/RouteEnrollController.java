package com.example.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.Station;
import com.example.service.StationService;

@Controller // 컨트롤러 선언
public class RouteEnrollController {
	
	private static Logger logger = LoggerFactory.getLogger(RouteEnrollController.class);
	
	/*@RequestMapping(value="/gotologin", method=RequestMethod.GET)
	public String gotologinForm(){
		return "login/login";
	}
		
	@RequestMapping(value="/gotojoin", method=RequestMethod.GET)
	public String gotojoinForm(User user){
		return "join/join";
	}*/
	
	@Autowired
	StationService service;
	
	@RequestMapping(value="/findstation", method=RequestMethod.POST)
	public @ResponseBody List<Station> findStation(@RequestParam String input){
		
		List<Station> station = service.findStation(input);
		logger.trace("컨트롤단, 검색 결과 : {}", station);
		
		return station;
	}

}
