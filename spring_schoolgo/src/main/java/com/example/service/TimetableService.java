package com.example.service;

import java.util.List;

import com.example.dto.Timetable;

public interface TimetableService {
	public int insert(Timetable timetable);
	public int delete(String userId);
	public Timetable select(String userId);
	public List<Timetable> selectTimetableUserId(String userId);
}
