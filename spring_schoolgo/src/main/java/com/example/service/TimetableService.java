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
	

/*	service-> isLate 지각인지아닌지 
	등교 눌렀을때 파라메터 값 넣고 사용하면됨 지각이면 0리턴되고 아니면 나가야 하는 시간까지 남은 시간(분)으로 리턴 */
	public int isLate(String curtime, String working,  String arrivemin);
	//루트명 클릭했을때 지각인지 아닌지 판단하게 해줌.
	//현재시간, 최초도보시간, 최초교통수단몇분전인지
}
