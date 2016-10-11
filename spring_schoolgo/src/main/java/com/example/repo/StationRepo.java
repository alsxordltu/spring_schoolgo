package com.example.repo;

import java.util.List;

import com.example.dto.Station;

public interface StationRepo {
	List<Station> findStation(String input);

}
