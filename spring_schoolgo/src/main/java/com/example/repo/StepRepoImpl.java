package com.example.repo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.Route;
import com.example.dto.Step;

@Repository
public class StepRepoImpl implements StepRepo{

	@Autowired
	SqlSessionTemplate template;
	
	private final String NAME_SPACE = "com.example.StepMapper.";
	
	@Override
	public int insertStep(Step step) {
		String stmt = NAME_SPACE + "insertStep";
		return template.update(stmt, step);
	}

	@Override
	public int deleteStep(int stepId) {
		String stmt = NAME_SPACE + "deleteStepByRouteId";
		return template.update(stmt, stepId);
	}

	@Override
	public Route selectStep(int stepId) {
		String stmt = NAME_SPACE + "selectStep";
		return template.selectOne(stmt, stepId);
	}

	@Override
	public List<Step> test1() {
		String stmt = NAME_SPACE + "test1";
		return template.selectList(stmt);
	}

}
