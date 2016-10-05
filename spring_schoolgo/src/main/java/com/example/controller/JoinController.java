package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.dto.User;
import com.example.service.Userservice;

@Controller // 컨트롤러 선언
public class JoinController {
	
	@Autowired
	Userservice service;
	


	@RequestMapping(value="/gototutorial", method=RequestMethod.GET)
	public String gototutorial(){
		return "tutorial/tutorial";
	}

	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(User user){
		service.join(user);
		return "tutorial/tutorial";
	}
	
}
