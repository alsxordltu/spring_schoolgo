package com.example.login;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.config.ApplicationConfig;
import com.example.dto.User;
import com.example.repo.Userrepo;
import com.example.service.Userservice;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes=ApplicationConfig.class)
public class GetUserTest {
	private static Logger logger = LoggerFactory.getLogger(GetUserTest.class);
	
	@Autowired
	Userrepo repo;
	
	@Autowired
	Userservice service;
	
	
	@Test
	public void test() {
		User userInfo = service.getUserInfo("asdf");
		logger.trace("결과 : {}", userInfo );
		
	}
	
}
