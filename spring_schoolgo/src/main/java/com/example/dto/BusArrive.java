package com.example.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BusArrive {
	String arrprevstationcnt;
	String arrtime;
	String nodenm;
	String routeno;
}
