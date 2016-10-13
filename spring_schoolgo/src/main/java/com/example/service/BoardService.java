package com.example.service;

import java.util.List;

import com.example.dto.Freeboard;
import com.example.dto.Noticeboard;
import com.example.dto.Shareboard;

public interface BoardService {
	//게시판 리스트 보기
	public List<Freeboard> freeList();
	public List<Shareboard> shareList();
	public List<Noticeboard> noticeList();	
	//게시판 본문 내용보기, 게시글 읽기
	public Freeboard readFreeContent(String fbno);
	public Shareboard readShareContent(String sbno);
	public Noticeboard readNoticeContent(String nbno);
	//content입력(글)
	public int insertfreeBoard(Freeboard board);
	public int insertshareBoard(Shareboard board);
	public int insertnoticeBoard(Noticeboard board);
	//글수정
	public int updatefreeBoard(Freeboard board);
	public int updateshareBoard(Shareboard board);
	public int updatenoticeBoard(Noticeboard board);
	//글삭제
	public int deletefreeBoard(Freeboard board);
	public int deleteshareBoard(Shareboard board);
	public int deletenoticeBoard(Noticeboard board);
	//댓글달기
	public int replyFreeBoard(Freeboard board);
	public int replyShareBoard(Shareboard board);
	public int replyNoticeBoard(Noticeboard board);
	

}
