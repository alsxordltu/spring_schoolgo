package com.example.service;

import java.util.List;


import com.example.dto.TimetableTotal;

public interface TimetableService {
	//public int insert(Timetable timetable);
	public int insert(TimetableTotal timetable);
	public TimetableTotal gettotaltableInfo(String userId);
	public int delete(String userId);
	//public Timetable select(String userId);
	//public List<Timetable> selectTimetableUserId(String userId);
}
