package com.example.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	private String userId;
	private String pass;
	private String userName;
	private String nickName;
	private String email;
	private String phoneNum;
}
