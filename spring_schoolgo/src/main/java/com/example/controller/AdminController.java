package com.example.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.service.StationService;

@Controller // 컨트롤러 선언
public class AdminController {
	
	private static Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	StationService service;
	
	@RequestMapping(value="/gotoadmin", method=RequestMethod.GET)
	public String main(){	
		return "admin/index";
	}

}
