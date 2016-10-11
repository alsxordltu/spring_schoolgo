package com.example.controller;

import javax.servlet.http.HttpSession;

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
public class DeleteController {
	private static Logger logger = LoggerFactory.getLogger(JoinController.class);

	@Autowired
	Userservice service;
	
	@RequestMapping(value = "/deleteUser" , method = RequestMethod.GET)
	public String deleteUser(Model model, @RequestParam String id, HttpSession session) {
		logger.trace("deleteUser");
		User userinfo = new User();
		userinfo = service.getUserInfo(id);
		model.addAttribute("user", userinfo);
		logger.trace("컨트롤러, deleteUser : {}", userinfo);	
		service.delete(userinfo);
		session.invalidate();	
		return "redirect:/gotomain";
	}
}
