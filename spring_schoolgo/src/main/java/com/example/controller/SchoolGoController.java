package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller // 컨트롤러 선언
public class SchoolGoController {



	@RequestMapping(value="/gotogo2", method=RequestMethod.GET) public
	String gotogo(){ return "goandcome/go2"; }	
	
	@RequestMapping(value="/gotocome2", method=RequestMethod.GET) public
	String gotocome(){ return "goandcome/come2"; }	
	

		
					
	
	

					
	
	
	
	
}
