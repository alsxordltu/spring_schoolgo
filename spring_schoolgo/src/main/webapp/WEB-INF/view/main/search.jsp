<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>

<!-- <!DOCTYPE html>
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
</html> -->
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
      }
.controls {
  margin-top: 10px;
  border: 1px solid transparent;
  border-radius: 2px 0 0 2px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
  height: 32px;
  outline: none;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
}

#pac-input {
  background-color: #fff;
  font-family: Roboto;
  font-size: 15px;
  font-weight: 300;
  margin-left: 12px;
  padding: 0 11px 0 13px;
  text-overflow: ellipsis;
  width: 300px;
}

#pac-button {
  background-color: #fff;
  font-family: Roboto;
  font-size: 15px;
  font-weight: 300;
  margin-left: 12px;
  padding: 0 11px 0 13px;
  text-overflow: ellipsis;
  width: 300px;
}

#pac-input:focus {
  border-color: #4d90fe;
}

.pac-container {
  font-family: Roboto;
}

#type-selector {
  color: #fff;
  background-color: #4d90fe;
  padding: 5px 11px 0px 11px;
}

#type-selector label {
  font-family: Roboto;
  font-size: 13px;
  font-weight: 300;
}

    </style>
    <title>Places Searchbox</title>
    <style>
      #target {
        width: 345px;
      }
    </style>
  </head>
  <body>
  	<form id="form1" action="result.jsp">
  	 	<input id="pac-input"  class="controls"  type="text" placeholder="Search Box">
    	<input id="pac-button" class="controls" type="button" value="확인" onclick="getlocation()">
    	<input type="text" id="resultstring"  name="resultstring">
    </form>
    <div id="map"></div>
    <script>
// This example adds a search box to a map, using the Google Place Autocomplete
// feature. People can enter geographical searches. The search box will return a
// pick list containing a mix of places and predicted search terms.

function initAutocomplete() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 37.566535, lng: 126.9779692},
    zoom: 13,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  // Create the search box and link it to the UI element.
  var input = document.getElementById('pac-input');
  var searchBox = new google.maps.places.SearchBox(input);
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  // Bias the SearchBox results towards current map's viewport.
  map.addListener('bounds_changed', function() {
    searchBox.setBounds(map.getBounds());
  });

  var markers = [];
  // [START region_getplaces]
  // Listen for the event fired when the user selects a prediction and retrieve
  // more details for that place.
  searchBox.addListener('places_changed', function() {
    var places = searchBox.getPlaces();

    if (places.length == 0) {
      return;
    }

    // Clear out the old markers.
    markers.forEach(function(marker) {
      marker.setMap(null);
    });
    markers = [];

    // For each place, get the icon, name and location.
    var bounds = new google.maps.LatLngBounds();
    places.forEach(function(place) {
      var icon = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25)
      };

      // Create a marker for each place.
      markers.push(new google.maps.Marker({
        map: map,
        icon: icon,
        title: place.name,
        position: place.geometry.location
      }));

      if (place.geometry.viewport) {
        // Only geocodes have viewport.
        bounds.union(place.geometry.viewport);
      } else {
        bounds.extend(place.geometry.location);
      }
    });
    map.fitBounds(bounds);
  });
  // [END region_getplaces]
}
function getlocation(){
	
	var input = document.getElementById('pac-input').value;
	var url = "https://maps.googleapis.com/maps/api/geocode/json?address="+ input +"&key=AIzaSyDMyDmCjogn6vLLZcCM-ZMCpNtk2BZoO5Y";
	document.getElementById('resultstring').value = url;
	document.getElementById('form1').submit();
}


    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDMyDmCjogn6vLLZcCM-ZMCpNtk2BZoO5Y&libraries=places&callback=initAutocomplete"
         async defer></script>
  </body>
</html>