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
<body onload="go_time()">

	<!-- Content -->
	<div id="content">
		<div class="inner">

			<!-- Post -->
			<article class="box post post-excerpt">
				<header>
					<h2 align="center">학교가기 페이지</h2>
					<p align="center">버스와 전철 위치정보 여기다가</p>
				</header>
				<div id="curtime"></div>
				현재 시간(초로 변환)
				<div id="curtimesec"></div>
				<br>
 				<div id="islate" ></div> 
  				<div id="remaintime" ></div> 				
  				<div id="curremaintime" ></div> 								
<!-- 				출발 전까지 남은 시간 계산(초)
				<div id="remaintimemove"></div>
				
				출발 전까지 남은 시간 계산(시분초) - 클
				<div id="stringremaintime"></div> -->
				
				
				<br>
				<br>
				<br>
				
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
var islate;
var curremaintime;
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
	$.ajax({
	
		
		url:"calDepartTime",
		type:"get",
		async:false,
		data:{ /* walkTime : routeStep[0].routeTime, 
			bustime : bustime,
 */
			timetabletime : "<%=request.getParameter("time") %>",
			timetotaltime : "<%=request.getParameter("totaltime") %>"
		},
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success:function(response){
		
			console.log(response);
			$("#islate").html(response);
			islate=response;
		},
		
	 	error:function(xhr, status, error){
         console.log(error);
      }
	});
	
	
	
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
					bustime =
						item.arrtime;
					
				}
				row += item.routeno +"번 버스 " +item.arrprevstationcnt + "개 전 " + item.arrtime + "분 남음, 정류소명 : " + item.nodenm + "<br>";
				
			});
			$("#busarrive").html(row);	
			
		},
	 	error:function(xhr, status, error){
         console.log(error);
      }
	});



});
console.log(islate);
$(document).on("click", "#select", function(e){
	
	document.all.selcitycode.value = $(this).attr("data-citycode");
	document.all.selnodeid.value = $(this).attr("data-nodeid");
	var row = "";
	$("#info").html(row);
});

////////////////////////음성출력테스트/////////////////////////////////////////
   var alarmset = ["pororiya.mp3", "pororiya.mp3"];
   var current=0;
   var intervalId;
   $("#start").on("click", function(){
      
      intervalId = setInterval(function(){
         var filename = alarmset[current %2];
         $("#audio").attr("src", "gocome_voice/"+filename);
			document.querySelector("#audio").play();
			current++;
		}, 1000 * 5);
	});

	$("#stop").on("click", function() {
		clearInterval(intervalId);
	});
	
///////////실시간출력
function go_time(){
	//////////////////현재시간
 var now = new Date();

 var nowhour = now.getHours();  //현재 시
 var nowmin = now.getMinutes();  //현재 분
 var nowsec = now.getSeconds();  //현재 초
  document.getElementById("curtime").innerHTML 
 = nowhour+":"+nowmin+":"+nowsec
 var hourpersec = nowhour*3600; //현재 시->초 변환
 var minpersec = nowhour*60; //현재 분->초 변환
 var nowtotalsec = hourpersec + minpersec + nowsec;
 document.getElementById("curtimesec").innerHTML 
 = nowtotalsec
 
 
 if(islate=="지각이 아님. 추후 null로 수정"){
		//               ---------D 총소요시간----
		//  현재시간(18:17) 출발전시간 소요시간(4367)  도착시간(23:30)
		//       A                   E                B               C   
		// A+B>C -> A+B-C>0 지각
		// C-A=D(총소요시간)
		// C-A-B : E 출발전시간(준비시간)-> 5분전,10분전...알림
	var tabletime = "<%=request.getParameter("time") %>";
	var duringtime = "<%=request.getParameter("totaltime") %>";
	
	var tableTimeslice = tabletime.substring(0, 1);//"23"
	tableTimeslice*=1;
	var tableTimesec = tableTimeslice *= 3600; // 초로바꿈
	//분->초
	var tableTimeslice2 = tabletime.substring(3, 4);//"30"
	tableTimeslice2*=1;
	var tableTimesec2 = tableTimeslice2 *= 60;// 초로바꿈
	 
	var tableTimesec3 = tableTimesec+tableTimesec2;	
	
	tableTimesec3-nowtotalsec-duringtime;
	curremaintime=tableTimesec3;
	setTimeout("secdec(curremaintime)", 1000);
	document.getElementById("remaintime").innerHTML 
	 = tableTimesec3
	
	document.getElementById("curremaintime").innerHTML 
	= curremaintime

 } 

 
 
  /////////////////////출발까지 남은 시간 구하는 서비스 가져오기(리턴타입 int 초)
/*  if(starttime==1){
	 document.getElementById("starttime").innerHTML 
	 = starttime;
	 var remaintime = "지각입니다.";
	
	 document.getElementById("remaintimemove").innerHTML 
	 = remaintime;
 }else{
	 var remaintime = starttime-nowtotalsec;
	 document.getElementById("remaintimemove").innerHTML 
	 = remaintime;
 }
  */
 
/* 
  remainhours = remaintime / 3600;//시 
  remainminute = remaintime % 3600 / 60;//분
  remainsecond = remaintime % 3600 % 60;//마지막 남은 시간에서 분을 뺀 나머지 시간을 초로 계산함 

	  stringremaintime = "지각입니다.";
	  document.getElementById("stringremaintime").innerHTML 
	  = stringremaintime;
  }else{
	  var stringremaintime = remainhours + ":" + remainminute + ":" + remainsecond;
	  document.getElementById("stringremaintime").innerHTML 
	  = stringremaintime;
  }
    */
  
 ///////////////////////////////////출발 몇초 전인지 계산(B-A)
 
 setTimeout("go_time()", 1000);
 //1초마다 해당 펑션을 실행함.
}
 function secdec(vari){
	 vari-=1;
	 return vari;
 }
</script>
</html>