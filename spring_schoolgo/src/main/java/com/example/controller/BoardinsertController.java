package com.example.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.dto.Freeboard;
import com.example.service.BoardService;


@Controller // 컨트롤러 선언
public class BoardinsertController {

	private static Logger logger = LoggerFactory.getLogger(BoardinsertController.class);

/*	@Autowired
	BoardService service;*/

/*	//글입력
	@RequestMapping(value = "/insertfreeboard", method = RequestMethod.GET)
	public String write(Freeboard board) {
		logger.trace("boardinsert 컨트롤러");
		service.insertfreeBoard(board);
		return "tutorial/tutorial";
	}

*/
	@InitBinder
	   public void setEssentialFields(WebDataBinder binder){
	      binder.setRequiredFields("fb_no", "userId", "content","regdate");
	   }
	
	
	

}
