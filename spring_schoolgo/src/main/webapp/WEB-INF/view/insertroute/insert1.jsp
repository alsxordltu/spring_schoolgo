<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML>
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
<%
	String routename = (String)session.getAttribute("routename");
 	String start = (String)session.getAttribute("start");		
%>
	<!-- Content -->
	<div id="content">
		<div class="inner">

			<!-- Post -->
			<article class="box post post-excerpt">
				<form name="route1next" method="get" action="gotoinsertbus">
				<header>
					<h2 align="center">루트 등록</h2>
					<p align="center"><%=routename %></p>
<!-- 					<a href="http://map.naver.com/?query=
					대한민국 인천광역시 남동구 남촌도림동 도림주공1단지 
" target="_blank" ><img src="/images/common/btn/btn_quick_srch_02.gif" alt="빠른길 찾기" /></a>
 -->				</header>

				<div id="insert1left">

					<!-- insert1 top div (집쪽) -->
					<div id="insert1top">
						<img src="insert_img/home.png" width="140px">
					</div>

					<div id="insert1arrow">
						<img src="insert_img/arrow.png" width="140px">
					</div>

					<!-- insert1 mid div (지하철쪽)-->
					<div id="insert1mid">
						<img src="insert_img/metro.png" width="140px">
					</div>

					<div id="insert1arrow">
						<img src="insert_img/arrow.png" width="140px">
					</div>

					<!-- insert1 bottom div(학교쪽) -->
					<div id="insert1bot">
						<img src="insert_img/school.png" width="140px">
					</div>
				</div>


				<div id="insert1right">


					<div id="home" style="float: left; width: 100%; height: auto;">
						<h5 style="text-align: center; margin: 100px 0 30px 0;">집에서
							역까지 어떻게 가세요?</h5>
					</div>


					<div id="home" style="float: left; width: 100%; height: auto; text-align:center; margin: 0px 0 140px 0;">

						<select name="hometostation" >
							<option value="">교통수단선택
							<option value="working">도보
							<option value="bus">버스
							<option value="taxi">택시
							<option value="bicycle">자전거
						</select>
					</div>

					<div id="home" style="float: left; width: 100%; height: 30px;">
						<h5 style="text-align: center;">출발역과 도착역을 입력해주세요!</h5>
					</div>

					
						
					

					<div id="home" style="float: left; width: 100%; height: 50px; margin-bottom:100px; text-align:center;">
						<input type="hidden" name="resultStationCode"> <a href="#"
							id="stationName"> <input type="text" id="resultStationName" name="resultStationName"
							value="출발역을 입력하세요" readonly style="margin: 5px 0 5px 0"></a>
						<input type="hidden" name="resultStationCode2"> <a href="#"
							id="stationName2"> <input type="text" name="resultStationName2"
							value="도착역을 입력하세요" readonly style="margin: 5px 0 5px 0"></a>
					</div>

					<div id="home" style="float: left; width: 100%; height: 30px; margin: 0px 0 30px 0;">
						<h5 style="text-align: center;">역에서 학교까지 어떻게 가세요?</h5>
					</div>


					<div id="home"
						style="float: left; width: 100%; height: 30px; text-align:center; margin: 0px 0 90px 0; ">
						<select name="stationtoschool" >
							<option value="">교통수단선택
							<option value="working">도보
							<option value="bus">버스
							<option value="taxi">택시
							<option value="bicycle">자전거
						</select>
					</div>
					
					
					<div id="home"
						style="width: 100%; height: 60px; text-align:center; ">
						<input type="hidden" id="jsonresult">
						<input type="button" value="입력 완료!" onclick="movenextpage()">
					</div>


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
				
				<li><a href="gotomain">학교가기</a></li>
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
	<script>
	
	function movenextpage(){
	
		   var startPoint = "<%=start %>";
		   var startStation = document.getElementById("resultStationName").value;
		   var url = "https://maps.googleapis.com/maps/api/directions/json?origin="+ startPoint +"&destination=" + startStation + "&mode=transit&key=AIzaSyD2AhXMW8KO4eZkRCQ1-6Gg3Fv4YOfYV58";
		   //var url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + input + "&key=AIzaSyDMyDmCjogn6vLLZcCM-ZMCpNtk2BZoO5Y";	
		   getinformation(url);
		   //document.getElementById('form1').submit(); 
		}

		function getinformation(input){
		   var url = input; 
		   $.ajax({
		      url:url,
		      type:"get",
		        async: false,
		      success:function(responseTxt){
		         var result = responseTxt.routes;
		         console.log(result);
		         document.all.jsonresult.value = result;
		         console.log(document.all.jsonresult.value);
		      },
		      error:function(xhr, status, error){
		         alert("fail: "+error);
		      }
		   });
		}
		
	$("#stationName")
	.on(
			"click",
			function() {
				window
						.open(
								'gotofindStation',
								'',
								'left=200, top=200, width=640, height=480, scrollbars=no, status=no, resizable=no, fullscreen=no, channelmode=no');
			});
	
	$("#stationName2")
	.on(
			"click",
			function() {
			
				window
						.open(
								'gotofindStation2',
								'',
								'left=200, top=200, width=640, height=480, scrollbars=no, status=no, resizable=no, fullscreen=no, channelmode=no');
				
			});
	
	</script>

</body>
</html>