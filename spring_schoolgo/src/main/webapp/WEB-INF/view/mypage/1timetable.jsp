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
<link rel="stylesheet" href="my_css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>

	<!-- Content -->
	<div id="content">
		<div class="inner">

			<!-- Post -->
			<article class="box post post-excerpt">
				<header>

					<!-- 아티클 제목 -->
					<h2>
						<a href="#">시간표 등록하자</a>
					</h2>
				</header>
			</article>


			<form method="get" action="updatetimetable" id=timetable>

				<h2>월화수목금</h2>
				<p>
					학교가기 <input id="school_mon" type="text" class="time"
						name=school_mon /> <input id="school_tue" type="text"
						class="time" name=school_tue /> <input id="school_wed"
						type="text" class="time" name=school_wed /> <input
						id="school_thu" type="text" class="time" name=school_thu /> <input
						id="school_fri" type="text" class="time" name=school_fri />
				<p>
					알바가기 <input id="alba_mon" type="text" class="time" name=alba_mon />
					<input id="alba_tue" type="text" class="time" name=alba_tue /> <input
						id="alba_wed" type="text" class="time" name=alba_wed /> <input
						id="alba_thu" type="text" class="time" name=alba_thu /> <input
						id="alba_fri" type="text" class="time" name=alba_fri />

					<!-- 				<pre class="code" data-language="javascript"></pre>
 -->
				<div style="margin: 0 0 0 200px; float: left;">
					<input type="submit" value="저장하기">
				</div>

				<div style="margin: 0 0 0 20px; float: left;">
					<a href='gotomain#mypage'><input type="button" value="돌아가기"></a>
				</div>

			</form>

		</div>
	</div>

	<!-- Sidebar -->
	<div id="sidebar">

		<!-- Logo -->
		<h1 id="logo">
			<a href="#">STRIPED</a>
		</h1>

		<!-- Nav -->
		<nav id="nav">
			<ul>
				<li class="current"><a href="gotomain">메인</a></li>
				<li><a href="#">학교가기</a></li>
				<li><a href="gotoinsertroute">루트등록</a></li>
				<li><a href="#">루트공유</a></li>
				<li><a href="#">Contact Me</a></li>
			</ul>
		</nav>

		<!-- Search -->
		<!-- <section class="box search">
						<form method="post" action="#">
							<input type="text" class="text" name="search" placeholder="Search" />
						</form>
					</section> -->

		<!-- Text -->
		<!-- <section class="box text-style1">
						<div class="inner">
							<p>
								<strong>Striped:</strong> A free and fully responsive HTML5 site
								template designed by <a href="http://twitter.com/ajlkn">AJ</a> for <a href="http://html5up.net/">HTML5 UP</a>
							</p>
						</div>
					</section> -->

		<!-- Recent Posts -->
		<section class="box recent-posts">
			<header>
				<h2>마이페이지</h2>
			</header>
			<ul>
				<li><a href="gototimetable">시간표 등록</a></li>
				<li><a href="gotoupdateprofile">개인정보 수정</a></li>
				<li><a href="gotoroutemanager">루트관리</a></li>
				<li><a href="gotocostcal">교통비 가계부</a></li>
				<li><a href="gotomyactivity">활동내역</a></li>
			</ul>
		</section>



		<!-- Copyright -->
		<ul id="copyright">
			<li>&copy; Untitled.</li>
			<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
		</ul>

	</div>

	<!-- Scripts -->
	<script src="main_js/jquery.min.js"></script>
	<script src="main_js/skel.min.js"></script>
	<script src="main_js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="main_js/main.js"></script>
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

	<script type="text/javascript" src="my_timepicker/jquery.timepicker.js"></script>
	<link rel="stylesheet" type="text/css"
		href="my_timepicker/jquery.timepicker.css" />

	<script type="text/javascript" src="my_timepicker/lib/bootstrap-datepicker.js"></script>
	<link rel="stylesheet" type="text/css"
		href="my_timepicker/lib/bootstrap-datepicker.css" />

	<script>
		$(function() {
			$('#school_mon').timepicker();
		});
		$(function() {
			$('#school_tue').timepicker();
		});
		$(function() {
			$('#school_wed').timepicker();
		});
		$(function() {
			$('#school_thu').timepicker();
		});
		$(function() {
			$('#school_fri').timepicker();
		});
		$(function() {
			$('#alba_mon').timepicker();
		});
		$(function() {
			$('#alba_tue').timepicker();
		});
		$(function() {
			$('#alba_wed').timepicker();
		});
		$(function() {
			$('#alba_thu').timepicker();
		});
		$(function() {
			$('#alba_fri').timepicker();
		});
		$(function() {
			$('#alba_mon').timepicker();
		});
	</script>
</body>
</html>