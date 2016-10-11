package com.example.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dto.Station;
import com.example.repo.StationRepo;

@Service
public class StationServiceImpl implements StationService {
	
	private static Logger logger = LoggerFactory.getLogger(StationServiceImpl.class);

	

	
	@Autowired
	StationRepo sRepo;

	@Override
	public List<Station> findStation(String input) {
		String change = "%" + input + "%";
		List<Station> station = sRepo.findStation(change);
		return station;
	}
}
