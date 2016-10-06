package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.example.dto.Login;
import com.example.service.Userservice;

@Controller // 컨트롤러 선언
public class LoginController {
	
	private static Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	Userservice service;
	
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
	
	@RequestMapping(value="/gotomain", method=RequestMethod.GET)
	public String gotomain(){
		return "main/main";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(Login login, HttpServletRequest request){
		int result = service.login(login.getId(), login.getPass());
		if(result == 1){
			logger.trace("컨트롤러, 로그인 성공");
			HttpSession session = request.getSession();
			session.setAttribute("userId", login.getId());
			logger.trace("컨트롤러, 세션 로그인 아이디 : {}", session.getAttribute("userId"));
			return "main/main";
		}
		logger.trace("컨트롤러, 로그인 실패");
		return "login/login";
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
