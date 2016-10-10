package com.example.repo;

import java.util.List;

import com.example.dto.Station;

public interface StationRepo {
	List<String> findStation(String input);

}
