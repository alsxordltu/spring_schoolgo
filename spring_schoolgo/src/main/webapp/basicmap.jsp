<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- This stylesheet contains specific styles for displaying the map
         on this page. Replace it with your own styles as described in the
         documentation:
         https://developers.google.com/maps/documentation/javascript/tutorial -->
<!-- <link rel="stylesheet" href="/maps/documentation/javascript/demos/demos.css"> -->
<style type="text/css">
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#map {
	height: 90%;
}
</style>
</head>
<body>
	<div id="map"></div>
	<input type="text" id="routeNum">
	<div id="routeButtons"></div>
	<button id="send">제출</button>
	
	<script src="http://code.jquery.com/jquery.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDgoDTqv8wf1KKvxQQfP0IYeAYXfAVhCRs&libraries=drawing,places,visualization,geometry"></script>
	<c:url value="/insertRoute" var="insertRoute"></c:url>
	<script>
		function addButton(num){
			$("#routeButtons").empty();
			for(var i=0; i<num; i++){
				var $btn = $("<button class='routeBtn' data-idx='"+i+"'>"+i+"</button>");
				$("#routeButtons").append($btn);
			}
		}
		$("#send").on("click", function(){
			res.routes = [res.routes[selectedId]];
			//var url = ${insertRoute};
			$.ajax({
				data: {data:JSON.stringify(res), routeName:"test"},
				url:"/mvc_project_practice/insertRoute",
				type:"post",
				success:function(response){
					console.log("response", response);
				},
				error:function(xhr, status, error){
					console.log("error : ", error);
				}
			});
		});
		var res;
		var selectedId;
		$(document).on("click", ".routeBtn", function(){
			//console.log($(this).attr("data-idx"));
			draw($(this).attr("data-idx"));
			selectedId = $(this).attr("data-idx");
		});
		document.querySelector("#routeNum").addEventListener("change", function(){
			draw(this.value);
		});
		// ì§ì°ì­
		var chicago = {
			lat : 36.794599,
			lng : 127.104378
		};
		// ê³µì£¼ë
		var indianapolis = {
			lat : 36.8444443,
			lng : 127.154316
		};
		var map = new google.maps.Map(document.getElementById('map'), {
			center : chicago,
			scrollwheel : true,
			zoom : 7
		});
		var directionsDisplay = new google.maps.DirectionsRenderer({
			map : map,
			polylineOptions: {
			      strokeColor: 'gray'
			    }
		});
		var directionsService = new google.maps.DirectionsService();
		var renderers = [];

		function initMap(req) {
			// Set destination, origin and travel mode.
			var request = {
				destination : indianapolis,
				origin : chicago,
				travelMode : 'TRANSIT',
				provideRouteAlternatives : true
			};

			// Pass the directions request to the directions service.
			for(var i = 0 ; i < renderers.length; i++){
                renderers[i].setMap(null);
			}
			// ìì²­ì ê²°ê³¼ response
			directionsService
					.route(
							request,
							function(response, status) {
								if (status == google.maps.DirectionsStatus.OK) {
									res = response;
									document.querySelector("#routeNum").value = response.routes.length;
									addButton(response.routes.length);
									for (var i = 0; i < response.routes.length; i++) {
										var renderer = new google.maps.DirectionsRenderer(
												{
													map : map,
													directions : response,
													routeIndex : i,
													polylineOptions: {
														strokeColor: "rgba(33, 33, 33, 0.4)"
													}
												});
										renderers[i] = renderer;
										if(i==req){
										renderers[i].polylineOptions={strokeColor: "red"};
										}
									}
								} else {
									$("#error")
											.append(
													"Unable to retrieve your route<br />");
								}
							});
		}
		function draw(i) {
		    directionsDisplay.setMap(null);
		    initMap(i);
		    directionsDisplay.setMap(map);
		}	
		initMap();
	</script>
</body>
</html>

//http://map.naver.com/index.nhn?slng=126.8966655&slat=37.4830969&elng=127.0276368&elat=37.4979502&menu=route&pathType=1