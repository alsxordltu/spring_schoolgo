package com.example.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	//개인정보수정메뉴(GET방식으로 userId랑 User객체 넘어감) 눌렀을때 여기로옴 -> id로 유저정보 select해서 화면에 setting해줌
	@RequestMapping(value = "/updateUser", method = RequestMethod.GET)
	public String updateUser(Model model, @RequestParam String id, User userinfo ) {
		userinfo = service.getUserInfo(id);
		model.addAttribute("User", userinfo);
		logger.trace("컨트롤러, updateUser_GET 호출 : {}", userinfo);
		return "mypage/2updateprofile";

	}

	//개인정보 수정 후 수정하기(POST방식으로 수정된 User정보 가져옴) -> 수정된 User정보를 그대로 update해줌
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public String updateUserPost(Model model, @ModelAttribute("User") User updateinfo) {
		model.addAttribute("userInfo", updateinfo);
		logger.trace("컨트롤러, updateUser_POST 호출 : {}", updateinfo);	
		service.update(updateinfo);
		return "mypage/2updateprofile";
	}
}
