package com.example.repo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.Route;
import com.example.dto.Timetable;

@Repository
public class TimetableRepoImpl implements TimetableRepo{

	@Autowired
	SqlSessionTemplate template;
	
	private final String NAME_SPACE = "com.example.TimetableMapper.";

	@Override
	public int insert(Timetable timetable) {
		String stmt = NAME_SPACE + "insert";
		return template.update(stmt, timetable);
	}

	@Override
	public Timetable select(String userId) {
		String stmt = NAME_SPACE + "select";
		return template.selectOne(stmt, userId);
	}
	
	@Override
	public int delete(String userId) {
		String stmt = NAME_SPACE + "delete";
		return template.update(stmt, userId);
	}

	@Override
	public List<Timetable> selectTimetableUserId(String userId) {
		String stmt = NAME_SPACE + "selectTimetableList";
		return template.selectList(stmt,userId);
	}
	
}