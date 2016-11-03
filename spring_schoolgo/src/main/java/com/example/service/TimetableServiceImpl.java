package com.example.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dto.School;
import com.example.dto.TimetableTotal;
import com.example.repo.TimetableRepo;

@Service
public class TimetableServiceImpl implements TimetableService {
	private static Logger logger = LoggerFactory.getLogger(TimetableServiceImpl.class);

	@Autowired
	TimetableRepo tRepo;

	/*
	 * @Override public int insert(Timetable timetable) { return
	 * tRepo.insert(timetable); }
	 */

	@Override
	public int delete(String userId) {
		return tRepo.delete(userId);
	}

	/*
	 * @Override public Timetable select(String userId) { return
	 * tRepo.select(userId); }
	 */

	/*
	 * @Override public List<Timetable> selectTimetableUserId(String userId) {
	 * return tRepo.selectTimetableUserId(userId); }
	 */

	@Override
	public int insert(TimetableTotal timetable) {
		logger.trace("시간표 삽입 성공");
		return tRepo.inserttotal(timetable);
	}

	@Override
	public TimetableTotal gettotaltableInfo(String userId) {
		logger.trace("시간표 가져오기 성공");
		return tRepo.gettotaltableInfo(userId);
	}

	@Override
	public int update(TimetableTotal timetable) {
		return tRepo.update(timetable);
	}

	@Override // 현재시간, 최초도보시간, 최초교통수단몇분전인지
	
	public int isLate(String walking, String arrivemin) {
		// 도착시간-총소요시간 <0 지각이고

		// 1. 첫 교통수단 도착시간(ex-15분전(현재시간+15)) - 첫 교통수단까지의도보시간(ex-10분)
		// ==> 나가야 하는시간까지 (15-10) 5분남음.
		// 2. 이거에 현재시간을 뺀 시간 => 나가야 하는시간까지 남은 시간
		// 이 시간이 0보다 작으면 지각
		// 이거놓치면 택시타든 알아서 하는걸로. 표시문구는 뭐로할까.

		// 현재시간 13:07 형식의 String
		String inTime = new SimpleDateFormat("HH:mm").format(new Date());

		// 분으로 바꾸기-시간(문자열잘라서바꾸기)
		String Timehour = inTime.substring(0, 1);// 앞2개만자름 (시)
		int persehour = Integer.parseInt(Timehour);// 정수형으로바꿈
		persehour *= 60;// 분으로바꿈
		persehour *= 60;// 초로바꿈

		// 분으로 바꾸기-분(문자열)
		String Timemin = inTime.substring(3, 4);
		int persemin = Integer.parseInt(Timemin);
		persemin *= 60;//초로바꿈

		int curtimemin = persehour + persemin; // 현재시간(초)

		int parsworking = Integer.parseInt(walking); // 두개다 초로바꿈
		parsworking *= 60;
		int parsarrivemin = Integer.parseInt(arrivemin);
		parsarrivemin *= 60;

		int result = (curtimemin + parsarrivemin) - parsworking - curtimemin;
		// result=출발전까지남은시간

		if (result < 0) { // 지각잼. 택시추천 or 떙떙이 추천 ㄱㄱ
			return 1;
		} else
			return result; // 출발전까지 남은시간 초로 리턴
	}

	@Override
	public School getTime(String userId, int idx) {
		TimetableTotal table = tRepo.gettotaltableInfo(userId);
		
		School school = null;
		switch (idx) {
		case 2: {
			school = new School(table.getSMon(), table.getAMon());
			break;
		}
		case 3: {
			school = new School(table.getSTue(), table.getATue());
			break;
		}
		case 4: {
			school = new School(table.getSWed(), table.getAWed());
			break;
		}
		case 5: {
			school = new School(table.getSThu(), table.getAThu());

			break;
		}
		case 6: {
			school = new School(table.getSFri(), table.getAFri());
			break;
		}
		}
		return school;
	}

	@Override //도착시간(DB) , 총소요시간
	public int simpleisLate(String arrivetime, String totaltime) {
		
		String arriveTimehour = arrivetime.substring(0, 1);// 앞2개만자름 (시)
		int persehour = Integer.parseInt(arriveTimehour);// 정수형으로바꿈
		persehour *= 60;// 분으로바꿈
		persehour *= 60;// 초로바꿈
		
		String arriveTimemin = arrivetime.substring(3, 4);
		int persemin = Integer.parseInt(arriveTimemin);
		persemin *= 60;//초로바꿈
		
		int arrivepersesec = persehour + persemin; 
		
		String totalTimehour = totaltime.substring(0, 1);// 앞2개만자름 (시)
		int persehour2 = Integer.parseInt(arriveTimehour);// 정수형으로바꿈
		persehour2 *= 60;// 분으로바꿈
		persehour2 *= 60;// 초로바꿈
		
		String totalTimemin = totaltime.substring(3, 4);
		int persemin2 = Integer.parseInt(arriveTimemin);
		persemin2 *= 60;//초로바꿈
		
		int totalpersesec = persehour + persemin; 
		
		if(arrivepersesec-totalpersesec<0){
			return 1; //지각잼
		}else{
			return 0; //지각아님잼 
		}

	}
}
