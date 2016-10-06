package com.example.repo;

import java.util.List;

import com.example.dto.User;

public interface Userrepo {
	public int insert(User user);
	public List<String> getAllUserId();
}
