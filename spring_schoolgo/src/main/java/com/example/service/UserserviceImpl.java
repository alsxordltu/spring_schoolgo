package com.example.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dto.User;
import com.example.repo.Userrepo;

@Service
public class UserserviceImpl implements Userservice {
	
	private static Logger logger = LoggerFactory.getLogger(UserserviceImpl.class);
	
	@Autowired
	Userrepo repo;
		
	@Override
	@Transactional
	public int join(User user) {
		int result = repo.insert(user);
		return result;
	}

	
	
	/*id값으로 id와 pass가 일치하는지*/
	@Override
	public int login(String id, String pass) {
		List<String> userId = repo.getUser();
		if(!userId.contains(id)){
			logger.trace("서비스, 아이디 존재하지 않음");
			return 0;
		}else{
			String passwd = repo.getPassbyId(id);
			if(!passwd.equals(pass)){
				logger.trace("서비스, 비밀번호 틀림");
				return 0;
			}
		}
		return 1;
	}



	@Override
	public User getUserInfo(String id) {
		User user = new User();
		user = repo.getUserInfo(id);
		return user;
	}
	











/*	@Override
	public int userInfo(String userId) {
		String userId = repo.get
	}*/
	
	

}
