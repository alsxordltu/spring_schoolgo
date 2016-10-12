package com.example.login;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertThat;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.config.ApplicationConfig;
import com.example.repo.Userrepo;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes=ApplicationConfig.class)
public class GetUserTest {
	private static Logger logger = LoggerFactory.getLogger(GetUserTest.class);
	
	@Autowired
	Userrepo repo;
	
	
	@Test
	public void test() {
		List<String> userId = repo.getUser();
		logger.trace("유저 아이디 리스트 : {}",userId );
		assertThat(userId, is(notNullValue()));
	}
	
	@Test
	public void test2() {
		String pass = repo.getPassbyId("asdf");
		logger.trace("패스워드 : {}",pass );
		assertThat(pass, is(notNullValue()));
	}
	
	@Test
	public void test3(){
		List<String> nickname = repo.getUserNickname();
		
	}

}
