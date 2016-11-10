package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.TimetableTotal;
import com.example.dto.User;
import com.example.service.TimetableService;
import com.example.service.Userservice;

@Controller // 컨트롤러 선언
public class JoinController {

	private static Logger logger = LoggerFactory.getLogger(JoinController.class);

	@Autowired
	Userservice service;
	
	@Autowired
	TimetableService tService;

	@RequestMapping(value = "/gototutorial", method = RequestMethod.GET)
	public String gototutorial() {
		return "tutorial/tutorial";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(User user, BindingResult result, TimetableTotal timeinfo, HttpServletRequest request, HttpSession session) {
		if (result.hasErrors()) {
			return "join/join";
		}
		service.join(user);
		session = request.getSession();
		int loginResult = service.login(user.getUserId(), user.getPass());
		if(loginResult == 1){
			logger.trace("컨트롤러, 로그인 성공");
			
			session.setAttribute("userId", user.getUserId());
			System.out.println("아행행 " + session.getAttribute("userId"));
			logger.trace("컨트롤러, 세션 로그인 아이디 : {}", session.getAttribute("userId"));
			session.setAttribute("nickName", user.getNickName());
			logger.trace("유저 정보 : {}, {}, {}, {}, {}, {}", user.getUserId(), user.getPass(), user.getUserName(), user.getNickName(), user.getEmail(), user.getPhoneNum());
			
			timeinfo = new TimetableTotal(user.getUserId(),"00:00","00:00","00:00","00:00","00:00","00:00","00:00","00:00","00:00","00:00");
			tService.insert(timeinfo);
			logger.trace("초기화 : {}", timeinfo);

		}else{
			return "gotojoin";
		}
		
		
		
		return "redirect:/gototutorial";
	}
	
	
/*	@RequestMapping(value = "/duplicationCheckId", method = RequestMethod.GET)
	public String duplicationCheckId(Model model, @RequestParam String id) {
		
		logger.trace("duplicationCheckId 컨트롤러");
		User userinfo = new User();
		userinfo = service.getUserInfo(id);
		logger.trace("id확인 : {}", id);
		String userid = userinfo.getUserId();
		int result = service.duplicationCheckId(userid);
		logger.trace("컨트롤러, userId 중복체크 - {}", result);
		return "join/join";
	}

	@RequestMapping(value = "/duplicationCheckNickname")
	public String duplicationCheckNickname(Model model,  HttpServletRequest request, User user) throws Exception {
		HttpSession session = request.getSession();
		String nickname = user.getNickName();
		session.setAttribute("nickName", nickname);
		int result = service.duplicationCheckNickname(nickname);
		logger.trace("컨트롤러, nickname 중복체크 - {}", result);
		return "join/join";
	}*/
	
	@RequestMapping(value="/duplicationCheckId", method=RequestMethod.POST)
	public @ResponseBody int checkId(@RequestParam String id){
		int result = service.duplicationCheckId(id);
		return result;
	}

	@RequestMapping(value="/duplicationCheckNickname", method=RequestMethod.POST)
	public @ResponseBody int checkNickname(@RequestParam String nickname){
		logger.trace("듀플컨트롤러" );
		int result = service.duplicationCheckNickname(nickname);
		return result;
	}


	@InitBinder
	   public void setEssentialFields(WebDataBinder binder){
	      binder.setRequiredFields("userId", "pass", "userName","nickName","email","phoneNum");
	   }
	
	
	

}
