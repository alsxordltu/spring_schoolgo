package com.example.repo;

import com.example.dto.TimetableTotal;

public interface TimetableRepo {
//	public int insert(Timetable timetable);
	public int inserttotal(TimetableTotal timetabletotal);
	public TimetableTotal gettotaltableInfo(String userId);
	public int delete(String userId);
	public int update(TimetableTotal timetabletotal);

	//public Timetable select(String userId);
	//public List<Timetable> selectTimetableUserId(String userId);
}
