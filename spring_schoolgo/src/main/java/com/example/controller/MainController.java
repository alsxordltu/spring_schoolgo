package com.example.controller;

import java.net.URI;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.example.dto.Route;
import com.example.service.RouteService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller // 컨트롤러 선언
public class MainController {
	private static Logger logger = LoggerFactory.getLogger(MainController.class);

	/*
	 * @Autowired Userservice service;
	 */

	/*
	 * @RequestMapping(value="/hello", method=RequestMethod.GET) // request 사용 (
	 * 조건 : /hello 경로 , get방식 ) public String sayHello(Model model){
	 * model.addAttribute("message", "Good Morning"); // 전달 데이터 -> 모델로 설정
	 * model.addAttribute("message2", "Hello"); return "showMessage"; // 사용할 뷰의
	 * 이름 리턴 }
	 * 
	 * @RequestMapping(value="/gotojoin", method=RequestMethod.GET) public
	 * String gotojoinForm(){ return "join/join"; }
	 */

	/*
	 * @RequestMapping(value="/gotologin", method=RequestMethod.GET) public
	 * String gotologinForm(){ return "login/login"; }
	 * 
	 * 
	 * @RequestMapping(value="/gotojoin", method=RequestMethod.GET) public
	 * String gotojoinForm(User user){ return "join/join"; }
	 */

	/*
	 * @RequestMapping(value="/gototutorial", method=RequestMethod.GET) public
	 * String gototutorial(){ return "tutorial"; }
	 * 
	 * @RequestMapping(value="/gotoindex", method=RequestMethod.GET) public
	 * String gotoindex(){ return "main"; }
	 * 
	 * @RequestMapping(value="/join", method=RequestMethod.POST) public String
	 * join(User user){ service.join(user); return "tutorial"; }
	 */
	
	@Autowired
	RouteService service;
	
	@RequestMapping(value = "/getroutelist", method = RequestMethod.GET)
	public @ResponseBody String getroutelist(HttpServletResponse response) {
		//response.getWriter().write();
		return "gotomain";
	}

	@RequestMapping(value = "/gotogo", method = RequestMethod.GET)
	public String gotogo(@RequestParam("lat")String lat, @RequestParam("lng")String lng, Model model, HttpServletRequest request, HttpSession session) throws JsonProcessingException {
		
		String requestUrl = "http://openapi.tago.go.kr/openapi/service/BusSttnInfoInqireService/getCrdntPrxmtSttnList?";
		requestUrl += "serviceKey=4p8gjXJj%2B4VfiBP4lA6EaCb2GfldRUjt%2BV1wLsZcBIdSQe7cp9rN590UtQ%2FTWeifk9dkcd3whm4xmR%2F1Wo5K%2Bw%3D%3D";
		requestUrl += "&gpsLati=" + lat;
		requestUrl += "&gpsLong=" + lng;
		requestUrl += "&numOfRows=999&pageSize=999&pageNo=1&startPage=1&_type=json";
		
		RestTemplate template = new RestTemplate();
		
		URI url = URI.create(requestUrl);
		RequestEntity<Void> reqEntity
		= RequestEntity.get(url).accept(MediaType.APPLICATION_JSON_UTF8).acceptCharset(Charset.forName("UTF-8")).build();

		ResponseEntity<HashMap> resEntity = template.exchange(reqEntity, HashMap.class);
		HashMap<String, Object> map = resEntity.getBody();
		System.out.println(requestUrl);
		System.out.println("아헤헤 : " + map);
		ObjectMapper mapper = new ObjectMapper();
		
		model.addAttribute("bus", mapper.writeValueAsString(map));
		String userId = (String)session.getAttribute("userId");
		List<Route> routes = service.getRouteUserId(userId);
		return "goandcome/go";
	}

	@RequestMapping(value = "/gotocome", method = RequestMethod.GET)
	public String gotocome() {
		return "goandcome/come";
	}

	@RequestMapping(value = "/gotoinsertroute", method = RequestMethod.GET)
	public String gotoinsertroute(HttpServletRequest request) {
		logger.trace("루트등록 초기화 컨트롤러 ");
		/*
		 * HttpSession session = request.getSession();
		 * session.getAttribute("start"); logger.trace("start : {}" ,
		 * session.getAttribute("start"));
		 */

		/*
		 * if(start!=null){ logger.trace("출발지입력됨"); session.setAttribute(start,
		 * "start"); } else{ logger.trace("출발지x"); } if(start!=null){
		 * logger.trace("도착지입력됨"); session.setAttribute(end, "end"); } else{
		 * logger.trace("도착지x"); }
		 */

		return "insertroute/insertroute";
	}

	@RequestMapping(value = "/gototimetable", method = RequestMethod.GET)
	public String gototimetable() {
		return "mypage/1timetable";
	}

	@RequestMapping(value = "/gotoupdateprofile", method = RequestMethod.GET)
	public String gotoupdateprofile() {
		return "mypage/2updateprofile";
	}

	@RequestMapping(value = "/gotoroutemanager", method = RequestMethod.GET)
	public String gotoroutemanager() {
		return "mypage/3routemanager";
	}

	@RequestMapping(value = "/gotocostcal", method = RequestMethod.GET)
	public String gotocostcal() {
		return "mypage/4costcal";
	}

	@RequestMapping(value = "/gotomyactivity", method = RequestMethod.GET)
	public String gotomyactivity() {
		return "mypage/5myactivity";
	}

}
