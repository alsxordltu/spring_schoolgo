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
		
			String searchdata = (String)session.getAttribute("start");
			String searchdata2 = (String)session.getAttribute("end");
				
		%>
		<!-- Content -->
			<div id="content">
				<div class="inner">

					<!-- Post -->
						<article class="box post post-excerpt">
						
							<!-- 헤더부분 -->
							<header>
								<h2 align="center">루트 등록</h2>
								<p align="center">당신의 루트를 등록할 수 있습니다.</p>
							</header>
							
							
					<form name="routenext" method="get" action="gotoinsert1">

						<!-- 출발지 값 -->
						<div style="width: 50%; float: left; padding: 0 50px 0 0;">
							<h5 align=center>출발지를 입력하세요!</h5>
							<a href="gotosearch"> <input type="text" name="start"
								value="${searchdata}" readonly></a>
								<input type="hidden" name="startlocation" value="${searchdata}">
						</div>


						<!-- 도착지 값 -->
						<div style="width: 50%; float: left; padding: 0 0 0 50px;">
							<h5 align=center>도착지를 입력하세요!</h5>
							<a href="gotosearch2"> <input type="text" name="end"
								value="${searchdata2}" readonly></a>
								<input type="hidden" name="endlocation" value="${searchdata2}">								
						</div>



						<!-- 루트명 입력(값넘기기) -->
						<div style="margin: 50px 0 100px 0; float: left; width: 100%;">
							<h5 align=center>루트 이름을 입력하세요!</h5>
							<input type="text" name="routename">
						</div>


					<!-- 섭밋 버튼 -->
					<div style="text-align:center">
						<input type="submit" value="등록하러 가기">
					</div>
					
					</form>
						</article>

				</div>
			</div>

		<!-- Sidebar -->
			<div id="sidebar">

				<!-- Logo -->
					<h1 id="logo"><a href="gotomain"><img src="insert_img/gogo.png" width="150px" alt="" /></a></h1>

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
						<li>&copy; Untitled.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>

			</div>

		<!-- Scripts -->
			<script src="insert_js/jquery.min.js"></script>
			<script src="insert_js/skel.min.js"></script>
			<script src="insert_js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="insert_js/main.js"></script>

	</body>
</html>