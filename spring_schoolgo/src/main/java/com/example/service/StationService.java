package com.example.service;

import java.util.List;

import com.example.dto.Station;

public interface StationService {
	List<Station> findStation(String input);
}
