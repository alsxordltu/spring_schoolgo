package com.example.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * VEHICLE 모델 클래스.
 * 
 * @author generated by ERMaster
 * @version $Id$
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Vehicle implements Serializable {

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** VEHICLE_ID. */
	private Integer vehicleId;

	/** STEP. */
	private Integer stepId;

	/** START_NAME. */
	private String startName;

	/** START_LAT. */
	private String startLat;

	/** START_LNG. */
	private String startLng;

	/** END_LAT. */
	private String endLat;

	/** END_LNG. */
	private String endLng;

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
