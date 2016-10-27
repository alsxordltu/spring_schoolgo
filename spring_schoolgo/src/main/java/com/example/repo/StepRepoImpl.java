package com.example.repo;

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
		String stmt = NAME_SPACE + "deleteRouteStepId";
		return template.update(stmt, stepId);
	}

	@Override
	public Route selectStep(int stepId) {
		String stmt = NAME_SPACE + "selectStep";
		return template.selectOne(stmt, stepId);
	}

}
