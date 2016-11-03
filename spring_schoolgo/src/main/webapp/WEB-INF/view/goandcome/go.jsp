<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
	Striped by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Striped by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="gocome_css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>

	<!-- Content -->
	<div id="content">
		<div class="inner">

			<!-- Post -->
			<article class="box post post-excerpt">
				<header>
					<h2 align="center">학교가기 페이지</h2>
					<p align="center">버스와 전철 위치정보 여기다가</p>
				</header>
				<button id="start">시작</button>
   			<button id="stop">종료</button>
  			 <audio id="audio" src=""></audio>
			<div id="busarrive">

				
		<%-- 		<table id="info">
		<tr><th>도시코드</th><th>정류소코드</th><th>정류소이름</th><th>버튼</th></tr>
		<c:forEach var="result" items="${buslist }" varStatus="status">
		
		<tr>
			<td><a href="<%=request.getContextPath()%>/EmpRetrieveServlet?empId=${employee.empId }">${employee.empId }</a></td>
			<td><input type="text" name="citycode${status.count }" value="${result.citycode }" ></td>
			<td><input type="text" name="nodeid${status.count }" value="${result.nodeid }" ></td>
			<td><input type="text" name="nodenm${status.count }" value="${result.nodenm }"></td>
			<td><input type="button"  id="select" value="선택"  onclick="selectStation(${result.stationCode },${result.stationName })" data-citycode="${result.citycode }"  data-nodeid="${result.nodeid }"></td>
		</tr>
	</c:forEach>
	</table>				 --%>
				
				
				
				
				</div>
			</article>
		</div>
	</div>

	<!-- Sidebar -->
	<div id="sidebar">

		<!-- Logo -->
		<h1 id="logo">
			<a href="gotomain"><img src="gocome_img/gogo.png" width="150px"
				alt="" /></a>
		</h1>

		<!-- Nav -->
		<nav id="nav">
			<ul>
				<li class="current"><a href="gotomain">학교가기</a></li>
				<li><a href="gotoinsertroute">루트등록</a></li>
				<li><a href="#">루트공유</a></li>
				<li><a href="#">Contact Me</a></li>
			</ul>
		</nav>




		<!-- Recent Posts -->
		<section class="box recent-posts">
			<header>
				<h2>마이페이지</h2>
			</header>
			<ul>
				<li><a href="gototimetable">시간표 등록</a></li>
				<li><a href="#">개인정보 수정</a></li>
				<li><a href="#">루트관리</a></li>
				<li><a href="#">교통비 가계부</a></li>
				<li><a href="#">활동내역</a></li>
			</ul>
		</section>




		<!-- Copyright -->
		<ul id="copyright">
			<li>&copy; Untitled.</li>
			<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
		</ul>

	</div>

	<!-- Scripts -->
	<script src="gocome_js/jquery.min.js"></script>
	<script src="gocome_js/skel.min.js"></script>
	<script src="gocome_js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="gocome_js/main.js"></script>
	<script src="http://code.jquery.com/jquery.js"></script>
	




</body>
<script>
var buslist;
var routes;

$(document).ready(function(){
	var row = "";	
	buslist = ${buslist };
	routes = ${routes };
	console.log(routes);
	console.log(buslist);
	var routeStep = routes.stepList;
	var busStopList = buslist.response.body.items.item;
/* 	console.log(buslist);
	console.log(routes);
	console.log(routeStep);
	console.log(busStopList); */
	var vehicleListName = "";
	var cityCode="";
	var busStopId="";
	var vehicleNum="";
	var bustime="";
	
	
	/* var item = buslist.response.body.items;
	console.log(item); */
	
	
	
	
 	$.each(routeStep, function(index, item){		
		if(item.vmode == "TRANSIT"){
			var vehicleList = item.vehicleList;
			$.each(vehicleList, function(index, item){
				if(item.startName != null){
					
					vehicleListName = item.startName;
					vehicleNum = item.vehicleNum;
					
					return false;
				}
			});
		}
		
		if(vehicleListName != ""){
			
			return false;
		}
	});	 
	
	$.each(busStopList, function(index, item){
		if(item.nodenm == vehicleListName){
			
			busStopId = item.nodeid;
			cityCode = item.citycode;
			return false;
		}
	});
	
	$.ajax({
		url:"getRouteId",
		type:"get",
		
		data:{ cityCode : cityCode, 
				nodeId : busStopId,
				vehicleNum : vehicleNum
		},
		async:false,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success:function(response){
			json = JSON.parse(response);
			var row ="";
			$.each(json, function(index, item){
				if(item.routeno == vehicleNum){
					bustime = item.arrtime;
					
				}
				row += item.routeno +"번 버스 " +item.arrprevstationcnt + "개 전 " + item.arrtime + "분 남음, 정류소명 : " + item.nodenm + "<br>";
				
			});
			$("#busarrive").html(row);	
			
		},
	 	error:function(xhr, status, error){
         console.log(error);
      }
	});
	
	$.ajax({
		url:"calDepartTime",
		type:"get",
		async:false,
		data:{ walkTime : routeStep[0].routeTime, 
			bustime : bustime,
			timetabletime : "<%=request.getParameter("time") %>",
			timetotaltime : "<%=request.getParameter("totaltime") %>"
		},
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success:function(response){
			var row = response;
	
			console.log(response);
			$("#clock2").html($("clock").html()+row);
		},
		
	 	error:function(xhr, status, error){
         console.log(error);
      }
	});
	

});

$(document).on("click", "#select", function(e){
	
	document.all.selcitycode.value = $(this).attr("data-citycode");
	document.all.selnodeid.value = $(this).attr("data-nodeid");
	var row = "";
	$("#info").html(row);
});

//////////////////////////////////////////////////////////////////////
   var alarmset = ["pororiya.mp3", "pororiya.mp3"];
   var current=0;
   var intervalId;
   $("#start").on("click", function(){
      
      intervalId = setInterval(function(){
         var filename = alarmset[current %2];
         $("#audio").attr("src", "gocome_voice/"+filename);
         console.log("<%=request.getContextPath()%>/sound/"+filename);
         document.querySelector("#audio").play();
         current++;
      }, 1000 * 5);
   });
   
   $("#stop").on("click", function(){
      clearInterval(intervalId);
   });

</script>
</html>