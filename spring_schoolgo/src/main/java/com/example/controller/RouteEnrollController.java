package com.example.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dto.Station;
import com.example.service.StationService;

@Controller // 컨트롤러 선언
public class RouteEnrollController {
	
	private static Logger logger = LoggerFactory.getLogger(RouteEnrollController.class);
	
	@Autowired
	StationService service;
	
	@RequestMapping(value="/findstation", method=RequestMethod.GET)
	public String findStation(Model model, @RequestParam String input){
		
		List<Station> station = service.findStation(input);
		logger.trace("컨트롤단, 검색 결과 : {}", station);
		model.addAttribute("stationSearchResultList", station);
		
		return "insertroute/findStation";
	}
	
	@RequestMapping(value="/findstation2", method=RequestMethod.GET)
	public String findStation2(Model model, @RequestParam String input){
		
		List<Station> station = service.findStation(input);
		logger.trace("컨트롤단, 검색 결과 : {}", station);
		model.addAttribute("stationSearchResultList", station);
		
		return "insertroute/findStation2";
	}

}
