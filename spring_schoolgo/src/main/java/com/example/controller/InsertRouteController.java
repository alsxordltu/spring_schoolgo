package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.dto.User;

@Controller // 컨트롤러 선언
public class InsertRouteController {
	

	
	@RequestMapping(value="/gotofindStation", method=RequestMethod.GET)
	public String gotologinForm(){
		return "insertroute/findStation";
	}

}
