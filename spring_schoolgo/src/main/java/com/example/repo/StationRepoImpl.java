package com.example.repo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.Station;

@Repository
public class StationRepoImpl implements StationRepo {
	
	@Autowired
	SqlSessionTemplate template;
	
	private final String NAME_SPACE = "com.example.StationMapper.";

	@Override
	public List<String> findStation(String input) {
		String stmt = NAME_SPACE + "searchStation";
		return template.selectList(stmt, input);
	}	
}
