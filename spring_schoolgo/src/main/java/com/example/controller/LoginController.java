package com.example.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.dto.Login;
import com.example.dto.Route;
import com.example.dto.School;
import com.example.dto.User;
import com.example.service.RouteService;
import com.example.service.TimetableService;
import com.example.service.Userservice;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller // 컨트롤러 선언
public class LoginController {
	
	private static Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	Userservice service;

	@Autowired
	RouteService rservice;
	
	@Autowired
	TimetableService tservice;
	
/*	@Autowired
	RouteService rservice;*/
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
	public String gotomain(Model model, HttpServletRequest request, HttpSession session) throws JsonProcessingException{
		String userId = (String)session.getAttribute("userId");
		List<Route> routes = rservice.getRouteUserId(userId);
		ObjectMapper mapper = new ObjectMapper();
			//String jsonData =  mapper.writeValueAsString(routes);
		model.addAttribute("routes", mapper.writeValueAsString(routes));
		
		Calendar cal = Calendar.getInstance();
		int idx = cal.get(Calendar.DAY_OF_WEEK);
		School school = tservice.getTime(userId, 4);
		model.addAttribute("getTime", mapper.writeValueAsString(school));
			
		return "main/main";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(Login login, HttpServletRequest request, Model model){
		int result = service.login(login.getId(), login.getPass());
		if(result == 1){
			logger.trace("컨트롤러, 로그인 성공");
			HttpSession session = request.getSession();
			session.setAttribute("userId", login.getId());
			logger.trace("컨트롤러, 세션 로그인 아이디 : {}", session.getAttribute("userId"));
			
			User user = new User();
			user = service.getUserInfo(login.getId());
			
			session.setAttribute("pass", user.getPass());
			session.setAttribute("userName", user.getUserName());
			session.setAttribute("nickName", user.getNickName());
			session.setAttribute("email", user.getEmail());
			session.setAttribute("phoneNum", user.getPhoneNum());
			logger.trace("유저 정보 : {}, {}, {}, {}, {}, {}",session.getAttribute("userId"),session.getAttribute("pass"),session.getAttribute("userName"),session.getAttribute("nickName"),session.getAttribute("email"),session.getAttribute("phoneNum"));
			
/*			model.addAttribute("userId",session.getAttribute("userId"));
			model.addAttribute("pass",session.getAttribute("pass"));
			model.addAttribute("userName",session.getAttribute("userName"));
			model.addAttribute("nickName",session.getAttribute("nickName"));
			model.addAttribute("email",session.getAttribute("email"));
			model.addAttribute("phoneNum",session.getAttribute("phoneNum"));*/
								
			return "redirect:/gotomain";
		}
		logger.trace("컨트롤러, 로그인 실패");
		return "login/loginfail";
	}
	

	
	@RequestMapping(value="/gotofindid", method=RequestMethod.GET)
	public String gotofindId(){
		return "login/findid";
	}
	
	@RequestMapping(value="/gotofindpw", method=RequestMethod.GET)
	public String gotofindPw(){
		return "login/findpw";
	}
	
	
/*	@RequestMapping(value="/userInfo", method=RequestMethod.POST)
	public String userInfo(User user, HttpServletRequest request){
		int result = service.
	}*/
	

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
