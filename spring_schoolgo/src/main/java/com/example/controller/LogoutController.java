package com.example.controller;

import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.service.Userservice;

@Controller
public class LogoutController {
	private static Logger logger = LoggerFactory.getLogger(LogoutController.class);

	@Autowired
	Userservice service;
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.invalidate();
		/*logger.trace("session확인 : {}", session.getAttribute("userId"));
		*/
		logger.trace("컨트롤러, 로그아웃 성공");
		return "gotomain";
	}

}
