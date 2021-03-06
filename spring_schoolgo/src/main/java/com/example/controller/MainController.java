package com.example.controller;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.example.dto.BusArrive;
import com.example.dto.Route;
import com.example.service.RouteService;
import com.example.service.TimetableService;
import com.example.util.SendMailUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller // 컨트롤러 선언
public class MainController {
	private static Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	RouteService service;

	@Autowired
	TimetableService tservice;

	@RequestMapping(value = "/getroutelist", method = RequestMethod.GET)
	public @ResponseBody String getroutelist(HttpServletResponse response) {
		// response.getWriter().write();
		return "gotomain";
	}

	@RequestMapping(value = "/gotogo", method = RequestMethod.GET)
	public String gotogo(@RequestParam("index") String index, Model model, HttpServletRequest request,
			HttpSession session) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();

		String userId = (String) session.getAttribute("userId");
		List<Route> routes = service.getRouteUserId(userId);
		model.addAttribute("routes", mapper.writeValueAsString(routes.get(Integer.parseInt(index))));

		String timetabletime = request.getParameter("time");
		String timetotaltime = request.getParameter("totaltime");
		model.addAttribute("time", timetabletime);
		model.addAttribute("totaltime", timetotaltime);
		String returnString = "";
		int result = tservice.simpleisLate(timetabletime, timetotaltime);
		if (result == 1) {
			returnString = "지각입니다!";
			model.addAttribute("calTimeResultMessage", returnString);
			return "goandcome/go";
		} else {
			returnString = null;
			model.addAttribute("calTimeResultMessage", returnString);
			return "goandcome/go";
		}

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

	@RequestMapping(value = "/getStationList", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String getStationList(HttpSession session, Model model, HttpServletRequest request,
			HttpServletResponse response) throws JsonProcessingException, UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
		ObjectMapper mapper = new ObjectMapper();
		String requestUrl = "http://openapi.tago.go.kr/openapi/service/BusSttnInfoInqireService/getCrdntPrxmtSttnList?";
		requestUrl += "serviceKey=Z%2F089zJQLn9rm7j3HtNQJp2nlOXTdqIx3DF2rvK9e7KXqZVgi1nFuZDDL5cOu2lnXQrizPLY574EW%2BMJHImwJA%3D%3D";
		// requestUrl +=
		// "serviceKey=ROEBX9gDjySLI9VWdC6Mc1Rsb%2FZSPP8RGZ6%2FFK65rEmL4zN1Oi2oVZ51%2FO730gQw6DPWf2sPfUolvrn9RbhILA%3D%3D";
		// requestUrl +=
		// "serviceKey=mvKAQ0WW93EhDti3jLGt6p8xMApnUxDurvRUoe48r5nV0nugbDDtafNmfQcRncOzklKFLtkDQZke8hwLndvWcg%3D%3D";

		requestUrl += "&gpsLati=" + lat;
		requestUrl += "&gpsLong=" + lng;
		requestUrl += "&numOfRows=999&pageSize=999&pageNo=1&startPage=1&_type=json";

		RestTemplate template = new RestTemplate();

		URI url = URI.create(requestUrl);
		RequestEntity<Void> reqEntity = RequestEntity.get(url).accept(MediaType.APPLICATION_JSON_UTF8)
				.acceptCharset(Charset.forName("UTF-8")).build();

		ResponseEntity<HashMap> resEntity = template.exchange(reqEntity, HashMap.class);
		HashMap<String, Object> map = resEntity.getBody();
		System.out.println(requestUrl);
		System.out.println("아헤헤 : " + map);

		return mapper.writeValueAsString(map);
	}

	@RequestMapping(value = "/getBusList", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String getBusList(HttpSession session, Model model, HttpServletRequest request,
			HttpServletResponse response) throws JsonProcessingException, UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		ObjectMapper mapper = new ObjectMapper();
		String citycode = request.getParameter("cityCode");
		String nodeId = request.getParameter("nodeId");
		String vehicleNum = request.getParameter("vehicleNum");

		String requestUrl = "http://openapi.tago.go.kr/openapi/service/ArvlInfoInqireService/getSttnAcctoArvlPrearngeInfoList?";
		requestUrl += "serviceKey=Z%2F089zJQLn9rm7j3HtNQJp2nlOXTdqIx3DF2rvK9e7KXqZVgi1nFuZDDL5cOu2lnXQrizPLY574EW%2BMJHImwJA%3D%3D";
		// requestUrl +=
		// "serviceKey=ROEBX9gDjySLI9VWdC6Mc1Rsb%2FZSPP8RGZ6%2FFK65rEmL4zN1Oi2oVZ51%2FO730gQw6DPWf2sPfUolvrn9RbhILA%3D%3D";
		// requestUrl +=
		// "serviceKey=mvKAQ0WW93EhDti3jLGt6p8xMApnUxDurvRUoe48r5nV0nugbDDtafNmfQcRncOzklKFLtkDQZke8hwLndvWcg%3D%3D";

		requestUrl += "&cityCode=" + citycode;
		requestUrl += "&nodeId=" + nodeId;
		requestUrl += "&numOfRows=999&pageSize=999&pageNo=1&startPage=1&_type=json";

		RestTemplate template = new RestTemplate();

		URI url = URI.create(requestUrl);
		RequestEntity<Void> reqEntity = RequestEntity.get(url).accept(MediaType.APPLICATION_JSON_UTF8)
				.acceptCharset(Charset.forName("UTF-8")).build();

		ResponseEntity<HashMap> resEntity = template.exchange(reqEntity, HashMap.class);
		HashMap<String, Object> map = resEntity.getBody();
		System.out.println(requestUrl);
		System.out.println(map);

		String arrprevstationcnt = "";
		Double tmparrtime = (double) 0;
		String arrtime = "";
		String nodenm = "";
		String routeno = "";
		List<BusArrive> buslist = new ArrayList<>();
		
		Map<String, Object> responseTxt = (Map) map.get("response");
		System.out.println("버스 도착정보 불러오기 성공" + responseTxt);
		Map<String, Object> body = (Map) responseTxt.get("body");
		
		Map<String, Object> items = (Map) body.get("items");
		
		List<Map<String, Object>> item = (List) items.get("item");
		
		
		for (Map<String, Object> busArriveList : item) {
			routeno = busArriveList.get("routeno").toString();

			arrprevstationcnt = busArriveList.get("arrprevstationcnt").toString();
			arrtime = busArriveList.get("arrtime").toString();
			/*
			 * tmparrtime = Math.floor(Double.parseDouble(arrtime) / 60);
			 * 
			 * arrtime = tmparrtime.toString();
			 */
			// System.out.println("임시 시간 : " + arrtime);

			nodenm = busArriveList.get("nodenm").toString();
			BusArrive bus = new BusArrive(arrprevstationcnt, arrtime, nodenm, routeno);
			buslist.add(bus);
		}
		/*
		 * for(Map<String, Object> busArriveList : item){ routeno =
		 * busArriveList.get("routeno").toString();
		 * System.out.println("버스 노선번호 : " + routeno);
		 * if(routeno.equals(vehicleNum)){
		 * 
		 * System.out.println(routeno + " " + vehicleNum); arrprevstationcnt =
		 * busArriveList.get("arrprevstationcnt").toString(); arrtime =
		 * busArriveList.get("arrtime").toString(); nodenm =
		 * busArriveList.get("nodenm").toString(); BusArrive bus = new
		 * BusArrive(arrprevstationcnt, arrtime, nodenm, routeno);
		 * buslist.add(bus);
		 * 
		 * continue; } }
		 */
		
		return mapper.writeValueAsString(buslist);
	}

	@RequestMapping(value = "/getSubwayArrive", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String getSubwayArrive(HttpSession session, Model model, HttpServletRequest request,
			HttpServletResponse response) throws JsonProcessingException, UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		ObjectMapper mapper = new ObjectMapper();
		String stationName = request.getParameter("stationName");

		String inputStationName = stationName.substring(0, stationName.length() - 1);

		String requestUrl = "http://swopenapi.seoul.go.kr/api/subway/7a4e5a597063637336396646595563/json/realtimeStationArrival/0/99/";
		requestUrl += URLEncoder.encode(inputStationName, "UTF-8");

		RestTemplate template = new RestTemplate();

		URI url = URI.create(requestUrl);
		RequestEntity<Void> reqEntity = RequestEntity.get(url).accept(MediaType.APPLICATION_JSON_UTF8)
				.acceptCharset(Charset.forName("UTF-8")).build();

		ResponseEntity<HashMap> resEntity = template.exchange(reqEntity, HashMap.class);
		HashMap<String, Object> map = resEntity.getBody();
		System.out.println(requestUrl);
		System.out.println(map);

		return mapper.writeValueAsString(map);
	}

	@RequestMapping(value = "/contactus", method = RequestMethod.POST)
	public String contectus(HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException, UnsupportedEncodingException {
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String question = request.getParameter("question");
		String content = request.getParameter("content");
		logger.trace("컨트롤러 , name : {}, phone : {}, email : {}, question : {} , content : {}",name, phone, email, question, content);
		SendMailUtil send = new SendMailUtil();
		send.contectUs(name, phone, email, question, content);
		logger.trace("문의 메일 전송 완료");
		return "main/contactussuccess";
		
	}

	@RequestMapping(value = "/gotocontact", method = RequestMethod.GET)
	public String gotocontact() {
		return "main/contactus";
	}

}
