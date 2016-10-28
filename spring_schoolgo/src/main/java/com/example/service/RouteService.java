package com.example.service;

import java.util.List;


import com.example.dto.Route;

public interface RouteService {
	void addRoute(Route route);
	Route getRoute(Integer routeId);
	List<Route> getRouteUserId(String userId);	
	void deleteRoute(Route route);
	
	Route getRouteDetail(Integer routeId);
	//루트목록(각 유저에 대한 루트이름 리스트 출력)
	//->루트이름중 하나 클릭시 루트ID로 루트정보 select위함
	List<String> selectRouteNameListUserId(String userId);
	
}
