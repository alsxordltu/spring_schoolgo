package com.example.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Timetable {
	String userId;
	String mon;
	String tue;
	String wed;
	String thu;
	String fri;
	String scheduleType;
}
