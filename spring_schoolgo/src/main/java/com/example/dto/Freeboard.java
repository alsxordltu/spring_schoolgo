package com.example.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Freeboard {
	int fb_no;
	String userId;
	String content;
	Date regdate;
}
