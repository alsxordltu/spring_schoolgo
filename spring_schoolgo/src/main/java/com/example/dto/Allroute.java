package com.example.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Allroute {
	
	private String userId;
	/** ROUTE_ID. */
	private Integer RrouteId;

	/** ROUTE_NAME. */
	private String routeName;

	/** START_LAT. */
	private String RstartLat;

	/** START_LNG. */
	private String RstartLng;

	/** START_ADDRESS. */
	private String startAddress;

	/** ARRIVE_LAT. */
	private String arriveLat;

	/** ARRIVE_LNG. */
	private String arriveLng;

	/** ARRIVE_ADDRESS. */
	private String arriveAddress;

	/** DISTANCE. */
	private String distance;

	/** TIME. */
	private String time;
	
	/** STEP_ID. */
	private Integer SstepId;

	/** ROUTE. */
	private Integer SrouteId;

	/** VMODE. */
	private String vmode;

	/** STEP_NAME. */
	private String stepName;

	/** START_LAT. */
	private String SstartLat;

	/** START_LNG. */
	private String SstartLng;

	/** END_LAT. */
	private String SendLat;

	/** END_LNG. */
	private String SendLng;

	/** ROUTE_DISTANCE. */
	private String routeDistance;

	/** ROUTE_TIME. */
	private String routeTime;

	/** SEQ. */
	private Integer seq;
	
	/** VEHICLE_ID. */
	private Integer vehicleId;

	/** STEP. */
	private Integer stepId;

	/** START_NAME. */
	private String startName;

	/** START_LAT. */
	private String VstartLat;

	/** START_LNG. */
	private String VstartLng;

	/** END_LAT. */
	private String VendLat;

	/** END_LNG. */
	private String VendLng;

	/** END_NAME. */
	private String endName;

	/** HEADSIGN. */
	private String headsign;

	/** VEHICLE_NAME. */
	private String vehicleName;

	/** VEHICLE_NUM. */
	private String vehicleNum;

	/** VEHICLE_MOVE. */
	private String vehicleMove;
}
