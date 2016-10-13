package com.example.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dto.User;
import com.example.service.Userservice;

@Controller
public class UserUpdateController {
	
	private static Logger logger = LoggerFactory.getLogger(UserUpdateController.class);

	@Autowired
	Userservice service;
	
	@RequestMapping(value = "/updateUser", method = RequestMethod.GET)
	public String updateUser(Model model, @RequestParam String id) {
		User userinfo = new User();
		userinfo = service.getUserInfo(id);
		model.addAttribute("userInfo", userinfo);
		logger.trace("컨트롤러, updateUser_GET 호출 : {}", userinfo);
		return "mypage/2updateprofile";

	}

	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public String updateUserPost(Model model, User updateinfo) {
		model.addAttribute("userInfo", updateinfo);
		logger.trace("컨트롤러, updateUser_POST 호출 : {}", updateinfo);	
		service.update(updateinfo);
		return "mypage/2updateprofile";
	}
}
