package com.example.station;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertThat;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.config.ApplicationConfig;
import com.example.dto.Station;
import com.example.dto.User;
import com.example.repo.StationRepo;
import com.example.service.StationService;
 
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes={ApplicationConfig.class})
public class FindStation {
	
	private static Logger logger = LoggerFactory.getLogger(FindStation.class);
	
	@Autowired
	SqlSessionTemplate template;
	
	@Autowired
	StationService service;
	
	@Autowired
	StationRepo sRepo;

/*	@Test
	public void test() {
		
		List<Station> station = service.findStation("종로");
	
		logger.trace("검색결과 : {}", station.get(0));
		logger.trace("검색결과 : {}", station);
		assertThat(station, is(notNullValue()));
		
		
	}*/
	@Test
	public void test2() {
		List<Station> station = service.findStation("오산");
		User user = new User();
		logger.trace("{}",station);
		
		
	}

}
