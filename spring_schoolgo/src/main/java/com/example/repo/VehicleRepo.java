package com.example.repo;

import com.example.dto.Route;
import com.example.dto.Vehicle;

public interface VehicleRepo {
	public int insertVehicle(Vehicle vehicle);
	public int deleteVehicle(int stepId);
	public Route selectVehicle(int vehicleId);
}
