package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dto.User;
import com.example.repo.Userrepo;

@Service
public class UserserviceImpl implements Userservice {
	
	@Autowired
	Userrepo repo;
	
	@Override
	@Transactional
	public int join(User user) {
		int result = repo.insert(user);
		return result;
	}

	@Override
	public int login(String id, String pass) {
		String passwd = repo.getPassbyId(id);
		if(!passwd.equals(pass)){
			return 0;
		}
		return 1;
	}

}
