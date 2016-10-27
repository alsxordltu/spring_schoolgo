package com.example.route;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertThat;

import java.util.Set;

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
import com.example.dto.Step;
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
		Route route = rService.getRouteDetail(67);
		logger.trace("route 조회: {}", route);
		rService.deleteRoute(route);
		logger.trace("delete over");
	}
	
	@Test
	public void insertRouteTest() {
		//vehicle>step>route
		//Route route = new Route("asdf",100,"루트이름","232.3","323","출발지주소","232.2","434.3","도착지주소","200km","30",null);	
		//route.setUserId("asdf");
		//logger.trace("route : {}  ", route);
		//logger.trace("select : {}",rRepo.selectRoute(17));
		
		logger.trace("delete : {}",rRepo.deleteRoute(25));
		logger.trace("삭제성공 " );
		//logger.trace("delete : {}",rRepo.deleteRoute(13));
		
/*		rRepo.insertRoute(route);
		logger.trace("insertroute : {} " , route);
		Step step = new Step(2, 3, "asdf", null, null, null, null, null, null, null, null,2, null);
		Set<Step> stepset = 
		Route route = new Route("asdf",3,"루트이름","232.3","323","출발지주소","232.2","434.3","도착지주소","200km","30",stepset);
		int test = rRepo.insertRoute(route);
		
		
		logger.trace("검색결과 : {}",test );
*/		//assertThat(test, is(notNullValue()));	
	}
}
