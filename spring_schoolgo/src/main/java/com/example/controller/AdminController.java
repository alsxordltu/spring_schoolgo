package com.example.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller // 컨트롤러 선언
public class AdminController {
	
	private static Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	
	@RequestMapping(value="/gotoadmin", method=RequestMethod.GET)
	public String main(){	
		return "admin/index.jsp";
	}

}
