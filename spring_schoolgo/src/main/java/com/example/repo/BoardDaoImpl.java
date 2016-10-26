package com.example.repo;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	SqlSessionTemplate template;

	private final String NAME_SPACE = "com.example.boardMapper.";

	// 게시물 리스트 보기
	@Override
	public List<BoardDto> boardList(String keyfield, String keyword) {
		String stmt = NAME_SPACE + "boardList";
		return template.selectList(stmt);
		
/*		List<BoardDto> result = new ArrayList<BoardDto>();
		System.out.println("정상적으로 값이 들어옴");
		System.out.println(keyfield + "//" + keyword);
		result = BoardManager.boardList(keyfield, keyword);
		System.out.println(result.size());
		return result;
*/	}
	
	// 본문 미리보기
	@Override
	public String preView(int seq) {
		String stmt = NAME_SPACE + "preView";
		return template.selectOne(stmt, seq);
/*		String preContent = BoardManager.preView(seq);
		return preContent;*/
	}
	
	// 시퀀스에 의한 리스트 뽑기
	@Override
	public BoardDto findBySeq(int seq) {
		String stmt = NAME_SPACE + "findBySeq";
		return template.selectOne(stmt, seq);
/*		BoardDto result = BoardManager.findBySeq(seq);
		return result;*/
	}
	
	// 본문 읽기_조회수count도
	@Override
	public BoardDto viewContent(int seq) {
		String stmt = NAME_SPACE + "readCount";
		template.update(stmt);
		String stmt2 = NAME_SPACE + "findBySeq";		
		return template.selectOne(stmt2, seq);
/*		BoardManager.readCount(seq); // 글보면 카운트수 증가
		BoardDto result = BoardManager.findBySeq(seq); // 실질적인 글읽기
		return result;*/
	}
	
	// 글쓰기는  upPos와 insertBoard 두개임
    public void upPos(){
        String stmt = NAME_SPACE + "upPos";
        template.update(stmt);
        System.out.println(" 글을 쓰면 Pos 1업");
    }
	@Override
	public void insertBoard(BoardDto board) {
		String stmt = NAME_SPACE + "insertBoard";
		upPos();
		template.update(stmt, board);
	}
	
	// 글 수정
	@Override
	public int updateBoard(BoardDto board, String pass) {
		String stmt = NAME_SPACE + "updateBoard";
		return template.update(stmt, board);
		//return BoardManager.updateBoard(board, pass);
	}
	
	// 삭제후 넘어가는 페이지
	@Override
	public int deleteView(int seq) {
		String stmt = NAME_SPACE + "deleteView";
		return template.update(stmt,seq);
	}
	
	// 글 삭제
	@Override
	public int deleteBoard(int seq, String storPass) {
		String stmt = NAME_SPACE + "deleteBoard";
		return template.update(stmt,seq);
	}
	
	// 답변하기
	@Override
	public void replyBoard(BoardDto board) {
       String stmt = NAME_SPACE + "replyboard";
       template.update(stmt,board);
	}
	
	// 답변(부모글)
	@Override
	public void replyUpPos(BoardDto board) {
	   String stmt = NAME_SPACE + "replyUpPos";
	   template.update(stmt,board);
		 
	}

}
