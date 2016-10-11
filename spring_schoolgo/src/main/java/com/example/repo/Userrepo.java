package com.example.repo;

import java.util.List;

import com.example.dto.User;

public interface Userrepo {
	public int insert(User user);
	public int update(User user);
	public int delete(User user);
	public List<String> getUser();
	public String getPassbyId(String userId);
	public User getUserInfo(String userId);
}
