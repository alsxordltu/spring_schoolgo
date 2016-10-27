package com.example.repo;

import com.example.dto.Route;
import com.example.dto.Step;

public interface StepRepo {
	public int insertStep(Step step);
	public int deleteStep(int routeId);
	public Route selectStep(int stepId);
}
