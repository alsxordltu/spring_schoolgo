package com.example.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.repo.AdminDetailRepo;

@Service
public class AdminServiceImpl implements AdminService{

	private static Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Autowired
	AdminDetailRepo Arepo;
	
	@Override
	public List<HashMap<String, Integer>> selectcount() {
		logger.trace("서비스.Listmap : {} ", Arepo.selectcount());
		return Arepo.selectcount();
	}
	

}
