package com.example.controller;

import java.net.URI;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

@Controller
public class RouteController {
	private static final Logger logger = LoggerFactory.getLogger(RouteController.class);

	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public @ResponseBody Map mapInfo() {

		String requestUrl = "https://maps.googleapis.com/maps/api/distancematrix/json";
		requestUrl += "?origins=37.524673,%20126.678182";
		requestUrl += "&destinations=37.489678,%20126.724595";
		requestUrl += "&mode=transit";
		requestUrl += "&language=ko";
		requestUrl += "&key=AIzaSyDgoDTqv8wf1KKvxQQfP0IYeAYXfAVhCRs";

		RestTemplate template = new RestTemplate();

		URI url = URI.create(requestUrl);
		RequestEntity<Void> reqEntity = RequestEntity.get(url).accept(MediaType.APPLICATION_JSON_UTF8).acceptCharset(Charset.forName("UTF-8")).build();

		ResponseEntity<HashMap> resEntity = template.exchange(reqEntity, HashMap.class);
		logger.trace("body: {}", resEntity.getBody());
		HashMap<String, Object> map = resEntity.getBody();
		Object dest = map.get("destination_addresses");
		Object origin = map.get("origin_addresses");
		ArrayList<Map> rows = (ArrayList) map.get("rows");
		long distance = 0;
		long duration = 0;

		for (Map row : rows) {
			logger.trace(row.toString());
			List<Map> elements = (List) row.get("elements");
			for (Map element : elements) {
				if (element.get("status").equals("OK")) {
					Map<String, Object> distanceMap = (Map) element.get("distance");
					Set<String> keys = distanceMap.keySet();
					Map<String, Object> durationMap = (Map) element.get("duration");
					distance += Long.parseLong(distanceMap.get("value").toString());
					duration += Long.parseLong(durationMap.get("value").toString());
				}
			}
		}
		logger.trace("총 이동 거리: {}, 총 소요 시간: {}", distance, duration);
		return resEntity.getBody();
	}	 
}
