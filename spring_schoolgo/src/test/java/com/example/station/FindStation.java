package com.example.station;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.config.ApplicationConfig;
import com.example.repo.StationRepo;
import com.example.service.StationService;
 
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes={ApplicationConfig.class})
public class FindStation {
	
	@Autowired
	SqlSessionTemplate template;
	
	@Autowired
	StationService service;
	
	@Autowired
	StationRepo sRepo;

	@Test
	public void test() {
		
		service.findStation("종로");
		
		
	}

}
