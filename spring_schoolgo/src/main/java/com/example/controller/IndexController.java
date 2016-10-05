package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.dto.User;
import com.example.service.Userservice;

@Controller // 컨트롤러 선언
public class IndexController {
	
	/*@Autowired
	Userservice service;*/
	
	/*@RequestMapping(value="/hello", method=RequestMethod.GET) // request 사용 ( 조건 : /hello 경로 , get방식 ) 
	public String sayHello(Model model){
		model.addAttribute("message", "Good Morning"); // 전달 데이터 -> 모델로 설정
		model.addAttribute("message2", "Hello");
		return "showMessage"; // 사용할 뷰의 이름 리턴 
	}
	
	@RequestMapping(value="/gotojoin", method=RequestMethod.GET)
	public String gotojoinForm(){
		return "join/join";
	}*/
	
	@RequestMapping(value="/gotologin", method=RequestMethod.GET)
	public String gotologinForm(){
		return "login/login";
	}
	
	
	@RequestMapping(value="/gotojoin", method=RequestMethod.GET)
	public String gotojoinForm(){
		return "join/join";
	}


	/*@RequestMapping(value="/gototutorial", method=RequestMethod.GET)
	public String gototutorial(){
		return "tutorial";
	}
	
	@RequestMapping(value="/gotoindex", method=RequestMethod.GET)
	public String gotoindex(){
		return "main";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(User user){
		service.join(user);
		return "tutorial";
	}*/
}
