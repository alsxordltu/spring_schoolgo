package com.example.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardDto {
	
	private int seq;
	private String userName;
	private String email;
	private String nickName;
	
	private String title;
	private String content;
	private String password;
	
	private int count;
	private String ip;
	private String regdate;
	private int pos; //답변부모글
	private int depth; //답변깊이
	
	
}
