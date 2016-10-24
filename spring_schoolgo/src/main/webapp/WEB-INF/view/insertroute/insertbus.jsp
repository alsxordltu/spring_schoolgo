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
<link rel="stylesheet" href="insert_css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>

	<!-- Content -->
	<div id="content">
		<div class="inner">

			<!-- Post -->
			<article class="box post post-excerpt">
				<header>
					<h2 align="center">이동 수단 중 버스 선택시,나오는 창</h2>
					<h2 align="center">이 버정들 중 당신이 주로 이용하는 버정을 선택하세요</h2>
					<p align="center">당신의 주변에 있는 버정들입니다..</p>
				</header>

<table id="info">
		<tr><th>역코드</th><th>역명</th><th>호선</th><th>버튼</th></tr>
		<c:forEach var="result" items="${buslist }" varStatus="status">
		
		<tr>
			<%-- <td><a href="<%=request.getContextPath()%>/EmpRetrieveServlet?empId=${employee.empId }">${employee.empId }</a></td> --%>
			<td><input type="text" name="citycode${status.count }" value="${result.citycode }" ></td>
			<td><input type="text" name="nodeid${status.count }" value="${result.nodeid }" ></td>
			<td><input type="text" name="nodenm${status.count }" value="${result.nodenm }"></td>
			<td><input type="button"  id="select" value="선택"  <%-- onclick="selectStation(${result.stationCode },${result.stationName })" --%> data-citycode="${result.citycode }"  data-nodeid="${result.nodeid }"></td>
		</tr>
	</c:forEach>
	</table>



				<form name="routenext" method="get" action="gotoinsertresult">

					<div style="width: 100%; float: left; padding: 0 50px 0 0;">
						<input type="text" id="selcitycode">
					</div>

					<div style="width: 100%; float: left; padding: 0 0 0 50px;">
						<input type="text" id="selnodeid">
						
					</div>





					<div style="text-align: center">
						<input type="submit" value="등록하러 가기">
					</div>

				</form>
			</article>
			

		</div>
	</div>

	<!-- Sidebar -->
	<div id="sidebar">

		<!-- Logo -->
		<h1 id="logo">
			<a href="gotomain"><img src="insert_img/gogo.png" width="150px"
				alt="" /></a>
		</h1>

		<!-- Nav -->
		<nav id="nav">
			<ul>
				<li><a href="gotomain">메인</a></li>
				<li><a href="#">학교가기</a></li>
				<li class="current"><a href="gotoinsertroute">루트등록</a></li>
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
	<script src="insert_js/jquery.min.js"></script>
	<script src="insert_js/skel.min.js"></script>
	<script src="insert_js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="insert_js/main.js"></script>
	<script src="http://code.jquery.com/jquery.js"></script>

</body>
<script>
$(document).on("click", "#select", function(e){
	
	document.all.selcitycode.value = $(this).attr("data-citycode");
	document.all.selnodeid.value = $(this).attr("data-nodeid");
	var row = "";
	$("#info").html(row);
});
		
	    //window.onload = showbuslist();
		<%-- function findStation(){
			var lat = <%=lat %>;
			var lng = <%=lng %>;
			var url = "http://openapi.tago.go.kr/openapi/service/BusSttnInfoInqireService/getCrdntPrxmtSttnList?ServiceKey=4p8gjXJj%2B4VfiBP4lA6EaCb2GfldRUjt%2BV1wLsZcBIdSQe7cp9rN590UtQ%2FTWeifk9dkcd3whm4xmR%2F1Wo5K%2Bw%3D%3D&gpsLati="+lat+"&gpsLong="+lng+"&numOfRows=999&pageSize=999&pageNo=1&startPage=1&_type=json";
			
			$.ajax({
				url:url,
				type:"get",
				dataType: "jsonp",
				success:function(responseTxt){
					
					var itemArray = responseTxt.response.body.items.item;
					var row="";
					$.each(itemArray,function(index,item){					
						var citycode = item.citycode;
						var gpslati = item.gpslati;
						var gpslong = item.gpslong;
						var nodeid = item.nodeid;
						var nodenm = item.nodenm;
						row +="<tr><td>"+citycode+"</td><td>"+gpslati+"</td><td>"+gpslong+"</td><td>"+nodeid+"</td><td>"+nodenm+"</td></tr>";
					});
					
					$("#info").html($("#info").html()+row);			
					console.log(responseTxt);
				},
				error:function(xhr,status,error){
					
				      alert(error);
				}
			});	
			console.log(url);
		}
 --%>
	</script>
</html>