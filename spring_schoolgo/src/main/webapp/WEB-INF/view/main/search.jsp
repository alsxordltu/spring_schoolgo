<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
table {
	border: 1px solid;
}
</style>
</head>
<body>

	<div id="map" style="width: 100%; height: 350px;"></div>
	<p>
		<button onclick="getInfo()">지도 정보 보기</button>
		<br>
	</p>
	<p id="infoDiv"></p>

	<form action="">
		<input type="text" id="startsearch"> <input type="button"
			value="검색" onclick="searchMap();"> <br> <br>
		<div id="map" style="width: 500px; height: 400px;"></div>
		<div id="out"></div>
		<br> <input type="submit" value="확인">

	</form>
	<script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=3e62ecc809bbf6026130d87653a9dd87&libraries=services"></script>
	<script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=3e62ecc809bbf6026130d87653a9dd87"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(33.450701, 126.570667),
			level : 3
		};

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new daum.maps.MapTypeControl();

		// 지도 타입 컨트롤을 지도에 표시합니다
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

		function getInfo() {
			// 지도의 현재 중심좌표를 얻어옵니다 
			var center = map.getCenter();

			// 지도의 현재 레벨을 얻어옵니다
			var level = map.getLevel();

			// 지도타입을 얻어옵니다
			var mapTypeId = map.getMapTypeId();

			// 지도의 현재 영역을 얻어옵니다 
			var bounds = map.getBounds();

			// 영역의 남서쪽 좌표를 얻어옵니다 
			var swLatLng = bounds.getSouthWest();

			// 영역의 북동쪽 좌표를 얻어옵니다 
			var neLatLng = bounds.getNorthEast();

			// 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
			var boundsStr = bounds.toString();

			var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
			message += '경도 ' + center.getLng() + ' 이고 <br>';
			message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
			message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
			message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', '
					+ swLatLng.getLng() + ' 이고 <br>';
			message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', '
					+ neLatLng.getLng() + ' 입니다';

			var infoDiv = document.getElementById('infoDiv');
			infoDiv.innerHTML = message;
		}
	</script>

</body>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
	function searchMap() {
		
		var inputstartvalue = document.getElementById('startsearch').value;
		var output = document.getElementById('out');
		output.innerHTML = inputstartvalue;
		
		//장소검색 서비스객체 생성
		var map = new daum.maps.Map(container, options);

		//지도객체설정
		var places = new daum.maps.services.Places();

		places.keywordSearch(inputstartvalue, callback);
		console.log(inputstartvalue);
		places.setMap(map);

		var callback = function(status, result) {
			if (status === daum.maps.services.Status.OK) {
				console.log(result);
			}
		};

		//keywordSearch(keyword, callback, options)

/* 
		// 공공기관 코드 검색
		//categorySearch(code, callback, options)
		places.categorySearch('PO3', callback, {
			// Map 객체를 지정하지 않았으므로 좌표객체를 생성하여 넘겨준다.
			location : new daum.maps.LatLng(37.564968, 126.939909)
		});

		//주소-좌표간 변환 서비스 객체 생성
		var geocoder = new daum.maps.services.Geocoder();

		//addr2coord(addr, callback, options)
		//주소 정보에 해당하는 좌표값 요청
		var callback2 = function(status, result) {
			if (status === daum.maps.services.Status.OK) {
				console.log(result);
			}
		};
		geocoder.addr2coord('해남군 송지면', callback2); */
		
		
		var geocoder = new daum.maps.services.Geocoder();

		var callback = function(status, result) {
		    if (status === daum.maps.services.Status.OK) {
		        console.log(result);
		    }
		};

		geocoder.addr2coord('해남군 송지면', callback);
		output.innerHTML += geocoder;
		
	}
</script>
</html>