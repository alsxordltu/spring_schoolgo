package com.example.service;

import com.example.dto.User;

public interface Userservice {
	int join(User user);
	int update(User user);
	int delete(User user);
	int login(String id, String pass);
	User getUserInfo(String id);
	int duplicationCheckId(String id);
	int duplicationCheckNickname(String nickname);
	int getEmail(String email);
	String getIdbyEmail(String email);
	int getId(String userId);
	String getPassbyId(String pass);
	
}
