package com.example.service;

import com.example.dto.User;

public interface Userservice {
	int join(User user);
	int login(String id, String pass);
	int userInfo(String userId);
}
