package com.example.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Station {
	
	String stationCode;
	String stationName;
	String lineNum;
	String frCode;
	@Override
	public String toString() {
		return "Station [stationCode=" + stationCode + ", stationName=" + stationName + ", lineNum=" + lineNum
				+ ", frCode=" + frCode + "]";
	}

}
