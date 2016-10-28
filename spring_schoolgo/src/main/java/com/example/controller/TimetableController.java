package com.example.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.dto.Timetable;
import com.example.service.TimetableService;

@Controller
public class TimetableController {
	private static Logger logger = LoggerFactory.getLogger(TimetableController.class);

	@Autowired
	TimetableService tService;

	
	
	
	//개인정보수정메뉴(GET방식으로 userId랑 User객체 넘어감) 눌렀을때 여기로옴 -> id로 유저정보 select해서 화면에 setting해줌	
	@RequestMapping(value="/updatetimetable", method = RequestMethod.GET)
	public String inserttimetable(HttpServletRequest request) {
		// 전체DTO
		// 1. userId 받아와서 기본객체 insert(get)
		// 2. select로 표시
		// 3. 입력 후
		// 4. 저장하기-> 각 값을 update(post)
		
		
		//sform-> modelAttribute 만들고 그 객체를 컨트롤러에서 받아와서 셋팅 / 업데이트
		//id로 정보(객체) 가져오는 맵퍼랑 객체단위로 업데이트하는 맵퍼 만들어야됨
		
		// 저장하기/수정하기
		// userId 받기 -> 받아온값으로 insert -> 저장하기
		// 다시 스케줄 눌렀을때 -> 
		
		// 
		
		return "mypage/1timetable";
	}
}
