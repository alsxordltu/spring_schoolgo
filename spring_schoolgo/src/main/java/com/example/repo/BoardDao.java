package com.example.repo;

import java.util.List;

import com.example.dto.BoardDto;

public interface  BoardDao {
		//게시물 리스트 보기
	   public List<BoardDto> boardList(String keyfield, String keyword);
	   //본문 미리보기 
	   public String preView(int seq);
	   //시퀀스에 의한 리스트 뽑기 
	   public BoardDto findBySeq(int seq);
	   //본문 읽기 
	   public BoardDto viewContent(int seq);
	   //글 쓰기 
	   public void insertBoard(BoardDto board);
	   //글 수정 
	   public int updateBoard(BoardDto board, String pass);
	   //삭제후 넘어가는 페이지 
	   public int deleteView(int seq);
	   //글 삭제 
	   public int deleteBoard(int seq, String storPass);
	   //답변하기 
	   public void replyBoard(BoardDto board);
	   //답변(부모글) 
	   public void replyUpPos(BoardDto board);	
}
