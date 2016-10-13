package com.example.repo;

import java.util.List;

import com.example.dto.Freeboard;
import com.example.dto.Noticeboard;
import com.example.dto.Shareboard;

public interface Boardrepo {
	//게시글 리스트 보기
	public List<Freeboard> freeList();
	public List<Shareboard> shareList();
	public List<Noticeboard> noticeList();	
	//게시글 보기
	public Freeboard readFreeContent(String fbno);
	public Shareboard readShareContent(String sbno);
	public Noticeboard readNoticeContent(String nbno);	
	//글(content) 입력
	public int insertFreeBoard(Freeboard board);
	public int insertShareBoard(Shareboard board);
	public int insertNoticeBoard(Noticeboard board);	
	//글 수정
	public int updateFreeBoard(Freeboard board);
	public int updateShareBoard(Shareboard board);
	public int updateNoticeBoard(Noticeboard board);	
	//글 삭제
	public int deleteFreeBoard(Freeboard board);
	public int deleteShareBoard(Shareboard board);
	public int deleteNoticeBoard(Noticeboard board);	
	//댓글달기
	public int replyFreeBoard(Freeboard board);
	public int replyShareBoard(Shareboard board);
	public int replyNoticeBoard(Noticeboard board);
	
	
	
}
