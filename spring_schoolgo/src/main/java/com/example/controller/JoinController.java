package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String join(User user,BindingResult result){
		if(result.hasErrors()){
			return "join/join";
		}
		service.join(user);
		return "redirect:/gototutorial";
	}

	
	@InitBinder
	   public void setEssentialFields(WebDataBinder binder){
	      binder.setRequiredFields("userId", "pass", "userName","nickName","email","phoneNum");
	   }
	
}
