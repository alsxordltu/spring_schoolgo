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


				<div style="height: 400px;">

					<div style="padding-top: 15px; padding-bottom: 15px;">
						<h4 align=center>
							<input type="hidden" name="routename3"
								value="<%=routename3%>"><%=routename3%>
								</h4>
					</div>


					<div id="home" style="float: left; width: 100px; height: 120px;">
						<img src="insert_img/home.png" width="100px">
					</div>
					<div id="home" style="float: left; width: 100px; height: 120px;">
						<img src="insert_img/arrow.png" width="80px"
							style="margin: 20px 0 0 10px">
					</div>



					<div id="home" style="float: left; width: 150px; height: 120px;">
						<input type=hidden name="resultStationCode"> <input
							type=text name="resultStationName" value="역 명을 입력하세요" readonly
							style="margin: 5px 0 5px 0">
						<button id="stationName" style="width: 150px; height: 50px;">역
							명 검색</button>
					</div>

					<div id="home" style="float: left; width: 200px; height: 120px;">
						<img src="insert_img/metro.png" width="100px"
							style="margin: 5px 50px 5px 50px;">
					</div>

					<div id="school" style="float: left; width: 150px; height: 120px;">
						<input type=text name="resultStationName2" value="역 명을 입력하세요"
							readonly style="margin: 5px 0 5px 0">
						<button style="width: 150px; height: 50px;">역 명 검색</button>
					</div>

					<div id="school" style="float: left; width: 100px; height: 120px;">
						<img src="insert_img/arrow.png" width="80px"
							style="margin: 20px 0 0 10px">
					</div>

					<div id="school" style="float: left; width: 100px; height: 120px;">
						<img src="insert_img/school.png" width="100px">
					</div>



					<div id="home" style="float: left; width: 450px; height: 40px;">
						<h5>집에서 역까지 어떻게 가세요?</h5>
					</div>

					<div id="school" style="float: left; width: 450px; height: 40px;">
						<h5>역에서 학교까지 어떻게 가세요?</h5>
					</div>

					<div id="home" style="float: left; width: 450px; height: 40px;">
							집->지하철역 : <%=hometostaion %>
							<!-- <select name="hometostation" onchange="hometostation(this.value);">
								<option value="">교통수단선택
								<option value="working">도보
								<option value="bus">버스
								<option value="taxi">택시
								<option value="bicycle">자전거
							</select> -->
					</div>


					<div id="school" style="float: left; width: 450px; height: 40px;">
							지하철역->학교 : <%=stationtoschool %>
<!-- 							<select name="stationtoschool" onchange="stationtoschool(this.value);">
								<option value="">교통수단선택
								<option value="working">도보
								<option value="bus">버스
								<option value="taxi">택시
								<option value="bicycle">자전거
							</select> -->
					</div>


					<div id="home" style="float: left; width: 450px; height: 40px;">
						<h5>소요시간</h5>
					</div>

					<div id="school" style="float: left; width: 450px; height: 40px;">
						<h5>소요시간</h5>
					</div>


					<div id="home" style="float: left; width: 450px; height: 40px;">
								
								입력한 시간 : <%=hometostationhour %> 시간 <%=hometostationminute %> 분
								<!-- 							<select name="hometostationhour" onchange="hometostationhour(this.value);">
								<option value="">시간
								<option value="1">1시간
								<option value="2">2시간
								<option value="3">3시간
							</select> 시간  -->
						
<!-- 							<select name="hometostationminute" onchange="hometostationminute(this.value);">
								<option value="">분
								<option value="0">00분
								<option value="05">05분
								<option value="10">10분
								<option value="15">15분
								<option value="20">20분
								<option value="25">25분
								<option value="30">30분
								<option value="35">35분
								<option value="40">40분
								<option value="45">45분
								<option value="50">50분
								<option value="55">55분
							</select> 분 -->
					</div>

					<div id="school" style="float: left; width: 450px; height: 40px;">
						입력한 시간 : <%=stationtoschoolhour %> 시간 <%=stationtoschoolminute %> 분		
						
<!-- 													<select name="stationtoschoolhour" onchange="stationtoschoolhour(this.value);">
								<option value="">시간
								<option value="1">1시간
								<option value="2">2시간
								<option value="3">3시간
							</select> 시간
						
													
							<select name="stationtoschoolminute" onchange="stationtoschoolminute(this.value);">
								<option value="">분
								<option value="0">00분
								<option value="05">05분
								<option value="10">10분
								<option value="15">15분
								<option value="20">20분
								<option value="25">25분
								<option value="30">30분
								<option value="35">35분
								<option value="40">40분
								<option value="45">45분
								<option value="50">50분
								<option value="55">55분
							</select> 분 -->
					</div>

					<div id=btndiv style="float: left; width: 900px; height: 55px;">

						<div style="margin: 0 0 0 250px; float: left;">
							<a href='gotomain'><input type="button" value="저장하기"></a>
						</div>


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