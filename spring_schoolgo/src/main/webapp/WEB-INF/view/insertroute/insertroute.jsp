<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE HTML>
<!--
   Astral by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Astral by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="insert_css/main.css" />
<link rel="stylesheet" href="insert_css/form.css" />

<%
	String routename = request.getParameter("routename");
%>

</head>
<body>

	<!-- Wrapper-->
	<div id="logo">
		<a href='gotomain'><img src="insert_img/gogo.png" alt=""
			width="300"></a>


	</div>
	<div id="wrapper">




		<nav id="nav" class="navtable" style="display: block;">
			<div style="float: left; width: 220px; height: 100px"></div>
			<a id="animate"><i class="icon fa-plus-circle fa-lg">Insert</i></a>
		</nav>

		<!-- Main -->
		<div id="main">



			<!-- Me -->
			<form name="insertroutehometostation" action="gotoinsertroute2">
				<article id="me" class="panel" style="padding: 50px 0 50px 0;">


					<div style="width: 100%;">
						<h6 style="text-align: center;">루트 등록하기 Part1</h6>
					</div>

					<div style="width: 900px; height: 50px; margin-top: 20px;">
						<h4 align=center>
							<input type="hidden" name="routename1"
								value="<%=routename%>"><%=routename%></h4>
					</div>



					<div id="rou1"
						style="width: 900px; height: 200px; padding: 0 150px 10px 150px;">

						<div id="home"
							style="float: left; width: 200px; height: 180px; padding: 30px 0 0 20px;">
							<img src="insert_img/home.png" width="140px">
						</div>

						<div id="home"
							style="float: left; width: 200px; height: 180px; padding: 30px 0 0 35px;">
							<img src="insert_img/arrow.png" width="120px">
							<!-- style="margin: 20px 0 0 10px" -->
						</div>

						<div id="home"
							style="float: left; width: 200px; height: 180px; padding: 30px 0 0 20px;">
							<img src="insert_img/metro.png" width="140px">
						</div>
					</div>


					<div id="rou2" style="width: 900px; height: 100px;">

						<div id="home" style="float: left; width: 450px; height: 50px;">
							<h5 style="text-align: center;">출발역을 알려주세요!</h5>
						</div>

						<div id="home" style="float: left; width: 450px; height: 50px;">
						<input type="hidden" name="resultStationCode">
							<a href="#" id="stationName"> <input type="text" name="resultStationName" 
								value="역 명을 입력하세요" readonly style="margin: 5px 0 5px 0"></a>
							<!-- <button id="stationName"     style="width:150px; height:50px;">역 명 검색</button> -->
						</div>

					</div>


					<div id="rou3" style="width: 900px; height: 100px;">


						<div id="home" style="float: left; width: 450px; height: 150px;">
							<h5 style="text-align: center;">집에서 역까지 어떻게 가세요?</h5>
						</div>


						<div id="home"
							style="float: left; width: 150px; height: 100px; border: 1pt solid silver;">
							
							<select name="hometostation" onchange="hometostation(this.value);">
								<option value="">교통수단선택
								<option value="working">도보
								<option value="bus">버스
								<option value="taxi">택시
								<option value="bicycle">자전거
							</select>
							<!-- <input type="hidden" name="hometostationtrans"> -->

						</div>
					</div>







					<div id=btndiv style="float: left; width: 900px; height: 55px;">

						

						<div style="margin: 0 0 0 270px; float: left;">
							<a href='gotomain#addroute'><input type="button" value="돌아가기"></a>
						</div>
						
						<div style="margin: 0 0 0 20px; float: left;">
							<input type="submit" value="다음"></a>
						</div>
					</div>



				</article>
			</form>

		</div>

		<!-- Footer -->
		<div id="footer">
			<ul class="copyright">
				<li>&copy; Untitled.</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>
	</div>

	<!-- Scripts -->
	<script src="insert_js/jquery.min.js"></script>
	<script src="insert_js/skel.min.js"></script>
	<script src="insert_js/skel-viewport.min.js"></script>
	<script src="insert_js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="insert_js/main.js"></script>
	<script type='text/javascript'
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery.js"></script>

	<script>
		$("document").ready(function() {
			$("#animate").animate({
				left : 160
			/* top:-140 */
			});

		});
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
		
/* 		function hometostation(value) {
			document.insertroutehometostation.hometostationtrans.value=value;
		} */
	</script>

</body>
</html>