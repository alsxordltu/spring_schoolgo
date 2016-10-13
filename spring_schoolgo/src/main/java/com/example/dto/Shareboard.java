package com.example.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Shareboard {
	int sb_no;
	String userId;
	String content;
	Date regdate;
}
