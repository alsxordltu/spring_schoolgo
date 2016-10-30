package com.example.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.example.dto.TimetableTotal;
import com.example.repo.TimetableRepo;

@Service
public class TimetableServiceImpl implements TimetableService{
	private static Logger logger = LoggerFactory.getLogger(TimetableServiceImpl.class);

	@Autowired
	TimetableRepo tRepo;
	
/*	@Override
	public int insert(Timetable timetable) {
		return tRepo.insert(timetable);
	}*/

	@Override
	public int delete(String userId) {
		return tRepo.delete(userId);
	}

/*	@Override
	public Timetable select(String userId) {
		return tRepo.select(userId);
	}*/

/*	@Override
	public List<Timetable> selectTimetableUserId(String userId) {
		return tRepo.selectTimetableUserId(userId);
	}*/

	@Override
	public int insert(TimetableTotal timetable) {
		return tRepo.inserttotal(timetable);
	}

	@Override
	public TimetableTotal gettotaltableInfo(String userId) {
		return tRepo.gettotaltableInfo(userId);
	}


	

}
