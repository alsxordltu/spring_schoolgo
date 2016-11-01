package com.example.service;

import com.example.dto.TimetableTotal;

public interface TimetableService {
	//public int insert(Timetable timetable);
	public int insert(TimetableTotal timetable);
	public TimetableTotal gettotaltableInfo(String userId);
	public int delete(String userId);
	public int update(TimetableTotal timetable);
	//public Timetable select(String userId);
	//public List<Timetable> selectTimetableUserId(String userId);
	
	
	public int isLate(String curtime, String working,  String arrivemin);
	//루트명 클릭했을때 지각인지 아닌지 판단하게 해줌.
	//현재시간, 최초도보시간, 최초교통수단몇분전인지
}
