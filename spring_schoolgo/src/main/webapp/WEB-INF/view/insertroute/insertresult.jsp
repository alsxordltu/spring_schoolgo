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
	String routename3 = request.getParameter("routename2");

	String hometostaion = request.getParameter("hometostaion");
	String hometostationhour = request.getParameter("hometostationhour");
	String hometostationminute = request.getParameter("hometostationminute");

	String stationtoschool = request.getParameter("stationtoschool");
	String stationtoschoolhour = request.getParameter("stationtoschoolhour");
	String stationtoschoolminute = request.getParameter("stationtoschoolminute");
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


			<article id="me" class="panel" style="padding: 50px 0 50px 0;">


				<div style="width: 100%;">
					<h6 style="text-align: center;">루트 등록하기 최종화면이야</h6>
				</div>

				<div style="padding-top: 15px; padding-bottom: 15px;">
					<h4 align=center>
						<input type="hidden" name="routename3" value="<%=routename3%>"><%=routename3%></h4>
				</div>





				<!-- **전체 상단** 아이콘들과 입력도착 역들 나오는 곳  -->
				<div style="width: 100%; height: 120px; margin: 30px 0 100px 0">





					<!-- 좌측 40%부분 div -->
					<div style="height: 120px; width: 40%; float: left;">

						<!-- 집 모양 아이콘 div -->
						<div id="home"
							style="width: 40%; height: 100%; float: left; margin-bottom: 50px">
							<img src="insert_img/home.png" width="100%;">
						</div>

						<!-- 화살표 아이콘, 입력한 출발역 출력 div -->
						<div id="home"
							style="width: 60%; height: 100%; float: left; margin-bottom: 50px">

							<div
								style="width: 100%; height: 50%; padding: 10px 10px 10px 20px">
								<img src="insert_img/arrow.png" width="50%">
							</div>

							<div
								style="width: 100%; height: 50%; padding: 30px 10px 10px 20px">
								<input type=hidden name="resultStationCode"> <input
									type=text name="resultStationName" value="입력한 출발역 여기다가"
									readonly style="margin: 5px 0 5px 0">
							</div>


						</div>

					</div>




					<!-- 중간 지하철 부분 20% div -->
					<div style="height: 100px; width: 20%; float: left;">

						<!-- 지하철 모양 아이콘 div -->
						<div id="home" style="width: 100%; height: 100%;">
							<img src="insert_img/metro.png" width="100%;">
						</div>

					</div>


					<!-- 우측 40%부분 div -->
					<div style="height: 100%; width: 40%; float: left;">

						<!-- 화살표 아이콘, 입력한 출발역 출력 div -->
						<div id="home"
							style="width: 60%; height: 100%; float: left; margin-bottom: 50px">

							<div
								style="width: 100%; height: 50%; padding: 10px 10px 10px 20px">
								<img src="insert_img/arrow.png" width="50%">
							</div>

							<div
								style="width: 100%; height: 50%; padding: 30px 10px 10px 20px">
								<input type=hidden name="resultStationCode"> <input
									type=text name="resultStationName" value="입력한 도착역 여기다가"
									readonly style="margin: 5px 0 5px 0">
							</div>


						</div>
						<!-- 학교 모양 아이콘 div -->
						<div id="school" style="width: 40%; height: 100%; float: left;">
							<img src="insert_img/school.png" width="100%;">
						</div>

					</div>

				</div>


				<!-- **전체 하단** 입력 교통수단, 계산된 각각의 소요시간 나오는 곳  -->
				<div style="width: 100%; height: 200px">


					<!-- 좌측 33.3333%부분 div -->
					<div style="height: 100%; width: 300px; float: left; border: 2pt solid black;">

						<div style="height: 50%; width: 100%; padding: 0 0 20px 0;">
						
							<!-- 입력한 이동수단 출력 div -->
							<div id="home" style="width: 50%; height: 100%; float: left;">
								<h5>이동수단 :</h5>
							</div>
							
							<div id="home" style="width: 50%; height: 100%; float: left;">
								<%=hometostaion%>
							</div>
							
						</div>
						
						
						<div style="height: 50%; width: 100%">
						
							<!-- 우리가 계산해서 넣어주는 소요시간 div -->
							<div id="home" style="width: 50%; height: 100%; float: left;">
								<h5>소요시간 :</h5>
							</div>

							<div id="home" style="width: 50%; height: 100%; float: left;">
								<h5>우리가 계산해서 넣어쥰다</h5>
							</div>
							
						</div>
						
					</div>




					<!-- 중간 지하철 부분 33.3333% div -->
					<div
						style="height: 100%; width: 300px; float: left; border: 2pt solid black;">


						<div style="height: 50%; width: 100%; padding: 0 0 20px 0;">
						
							<div id="home" style="width: 50%; height: 100%; float: left;">
								<h5>지나는 정거장 수</h5>
							</div>

							<div id="home" style="width: 50%; height: 100%; float: left;">
								<h5>우리가 계산해서 넣어쥰다</h5>
							</div>
							
						</div>

						<div style="height: 50%; width: 100%">
						
							<div id="home" style="width: 50%; height: 100%; float: left;">
								<h5>소요시간 :</h5>
							</div>

							<div id="home" style="width: 50%; height: 100%; float: left;">
								<h5>우리가 계산해서 넣어쥰다</h5>
							</div>
							
						</div>
						
					</div>


					<!-- 우측 33.3333%부분 div -->
					<div
						style="height: 100%; width: 300px; float: left; border: 2pt solid black;">


						<div style="height: 50%; width: 100%; padding: 0 0 20px 0;">
						
							<div id="school" style="width: 50%; height: 100%; float: left;">
								<h5>이동수단 :</h5>
							</div>


							<div id="school" style="width: 50%; height: 100%; float: left;">
								<%=stationtoschool%>
							</div>
							
						</div>

						<div style="height: 50%; width: 100%">
						
							<div id="school" style="width: 50%; height: 100%; float: left;">
								<h5>소요시간 :</h5>
							</div>

							<div id="school" style="width: 50%; height: 100%; float: left;">
								<h5>우리가 계산해서 넣어쥰다</h5>
							</div>
							
						</div>
					</div>




				</div>
				
				

				<div id=allresult style="float: left; width: 100%; height: 55px; border:2pt solid black">
						<h6>총 소요시간 : 우리가 계산해서 넣어주기</h6>
				</div>
				
				<div id=btndiv style="float: left; width: 100%; height: 55px;">

					<div style="margin: 0 0 0 380px; float: left;">
						<a href='gotomain'><input type="button" value="저장하기"></a>
					</div>

				</div>
				
				
			</article>


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
							windObject = window
									.open(
											'gotofindStation',
											'',
											'left=200, top=200, width=640, height=480, scrollbars=no, status=no, resizable=no, fullscreen=no, channelmode=no');
						});
	</script>
</body>
</html>