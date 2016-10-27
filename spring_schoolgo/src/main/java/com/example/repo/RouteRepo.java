package com.example.repo;

import java.util.List;

import com.example.dto.Route;

public interface RouteRepo {
	public int insertRoute(Route route);
	public int deleteRoute(int routeId);
	public Route selectRoute(int routeId);
	public List<Route> selectRouteUserId(String userId);
	
	//루트목록(각 유저에 대한 루트이름 리스트 출력)->루트이름중 하나 클릭시 루트ID로 루트정보 select위함
	public List<String> selectRouteNameListUserId(String userId);
}
