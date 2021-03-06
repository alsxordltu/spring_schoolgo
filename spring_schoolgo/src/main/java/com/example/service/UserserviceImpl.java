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

	
	@Override
	public int update(User user) {
		int result = repo.update(user);
		logger.trace("update service 호출");
		return result;
	}
	
	@Override
	public int delete(User user) {
		int result = repo.delete(user);
		logger.trace("delete service 호출");
		return result;
	}
	
	@Override
	public User getUserInfo(String id) {
		User user = new User();
		user = repo.getUserInfo(id);
		return user;
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
	public int duplicationCheckId(String id) {
		List<String> userId = repo.getUser();
		if(userId.contains(id)){
			logger.trace("서비스, ID중복");
			return 0;
		}else{
			logger.trace("서비스, ID중복체크 통과");
			return 1;
		}
	}


	@Override
	public int duplicationCheckNickname(String nickname) {
		List<String> nickName = repo.getUserNickname();
		logger.trace("서비스, nicknameList  : {}", nickName);
		if(nickName.contains(nickname)){
			logger.trace("서비스, nickname중복");
			return 0;
		}else{
			logger.trace("서비스, nickname중복체크 통과");
			return 1;
		}
	}


	//입력받은 이메일이 DB에 있나 체크
	@Override
	public int getEmail(String email) {
		List<String> emailList = repo.getAllEmail();
		logger.trace("서비스, emailList : {} " , emailList);
		if(emailList.contains(email)){
			logger.trace("서비스, 이메일 DB에 존재");
			return 1;
		}else{
			logger.trace("서비스, 이메일 존재하지 않음");			
			return 0;
		}
	}


	@Override
	public String getIdbyEmail(String email) {
		String userId = repo.getIdbyEmail(email);	
		return userId;
	}

	//입력받은 ID가 DB에 있나 체크
	@Override
	public int getId(String userId) {
		List<String> idList = repo.getAllId();
		logger.trace("서비스, idList : {} " , idList);
		if(idList.contains(userId)){
			logger.trace("서비스, ID DB에 존재");
			return 1;
		}else{
			logger.trace("서비스, ID 존재하지 않음");			
			return 0;
		}
	}


	@Override
	public String getPassbyId(String userId) {
		String pass = repo.getPassbyId(userId);
		return pass;
	}


	
	











/*	@Override
	public int userInfo(String userId) {
		String userId = repo.get
	}*/
	
	

}
