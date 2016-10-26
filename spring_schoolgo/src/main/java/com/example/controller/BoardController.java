package com.example.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.service.StationService;

@Controller // 컨트롤러 선언
public class BoardController {
	
	private static Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	StationService service;
	
	@RequestMapping(value="/gotoboardmain", method=RequestMethod.GET)
	public String main(){	
		return "board/boardmain";
	}

	@RequestMapping(value="/gotoboardlist", method=RequestMethod.GET)
	public String boardlist(){	
		return "board/Board_List";
	}
	
	@RequestMapping(value="/gotoboardview", method=RequestMethod.GET)
	public String boardview(){	
		return "board/Board_View";
	}
	
	@RequestMapping(value="/gotoboardupdate", method=RequestMethod.GET)
	public String boardupdate(){	
		return "board/Board_Update";
	}
	@RequestMapping(value="/gotoboarddelete", method=RequestMethod.GET)
	public String boarddelete(){	
		return "board/Board_Delete";
	}
	
	@RequestMapping(value="/gotoboarddeleteaction", method=RequestMethod.GET)
	public String boarddeleteaction(){	
		return "board/Board_Delete_action";
	}
	@RequestMapping(value="/gotoboardreply", method=RequestMethod.GET)
	public String boardreply(){	
		return "board/Board_Reply";
	}
	@RequestMapping(value="/gotoboardreplyaction", method=RequestMethod.GET)
	public String boardreplyaction(){	
		return "board/Board_Reply_action";
	}
	@RequestMapping(value="/gotoboardwrite", method=RequestMethod.GET)
	public String boardwrite(){	
		return "board/Board_Write";
	}
	@RequestMapping(value="/gotoboardwriteaction", method=RequestMethod.GET)
	public String boardwriteaction(){	
		return "board/Board_Write_action";
	}

}
