package com.example.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Timetable {
	String userId;
	int mon;
	int tue;
	int wed;
	int thu;
	int fri;
		
}
