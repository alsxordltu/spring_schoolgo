package com.example.route;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.config.ApplicationConfig;
import com.example.dto.Route;
import com.example.repo.RouteRepo;
import com.example.service.RouteService;
 
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes={ApplicationConfig.class})
public class RouteTest {
	
	private static Logger logger = LoggerFactory.getLogger(RouteTest.class);
	
	@Autowired
	SqlSessionTemplate template;
	
	@Autowired
	RouteRepo rRepo;
	
	@Autowired
	RouteService rService;

	@Test
	public void deleteRouteTest(){
		Route route = rService.getRouteDetail(66);
		logger.trace("route 조회: {}", route);
		rService.deleteRoute(route);
		logger.trace("delete over");
	}
	
	
}
