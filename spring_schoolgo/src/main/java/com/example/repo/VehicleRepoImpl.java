package com.example.repo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.Route;
import com.example.dto.Vehicle;

@Repository
public class VehicleRepoImpl implements VehicleRepo{

	@Autowired
	SqlSessionTemplate template;
	
	private final String NAME_SPACE = "com.example.VehicleMapper.";
	
	@Override
	public int insertVehicle(Vehicle vehicle) {
		String stmt = NAME_SPACE + "insertVehicle";
		return template.update(stmt, vehicle);
	}

	@Override
	public int deleteVehicle(int vehicleId) {
		String stmt = NAME_SPACE + "deleteVehicle";
		return template.update(stmt, vehicleId);
	}

	@Override
	public Route selectVehicle(int vehicleId) {
		String stmt = NAME_SPACE + "selectVehicle";
		return template.selectOne(stmt, vehicleId);
	}

}
