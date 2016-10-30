package com.example.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TimetableTotal {
	// 시간표 등록 전체 페이지 업데이트용 학교가기+알바가기 DTO
	String userId;
	
	//학교가기
	String sMon;
	String sTue;
	String sWed;
	String sThu;
	String sFri;
	
	//알바가기
	String Amon;
	String Atue;
	String Awed;
	String Athu;
	String Afri;
	
}
