<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
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
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

</head>
<%
	String id = request.getParameter("id");
%>
<body>

	<!-- Content -->
	<div id="content">
		<div class="inner">

			<!-- Post -->
			<article class="box post post-excerpt">
				<header>

					<!-- 아티클 제목 -->
					<h2>
						<a href="#">시간표 수정 완료</a>
					</h2>















					<div >
						<a href='gotomain#mypage'><input type="button" value="학교가기">
					</div>
				</header>
			</article>
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
				<li><a href="gotomain">메인</a></li>
				<li><a href="#">학교가기</a></li>
				<li><a href="gotoinsertroute">루트등록</a></li>
				<li><a href="#">루트공유</a></li>
				<li><a href="#">Contact Me</a></li>
			</ul>
		</nav>


		<section class="box recent-posts">
			<header>
				<h2>마이페이지</h2>
			</header>
			<ul>
				<li><a href="gototimetable">시간표 등록</a></li>
				<li class="current"><a href="gotoupdateprofile">개인정보 수정</a></li>
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
	<script src="my_js/jquery.min.js"></script>
	<script src="my_js/skel.min.js"></script>
	<script src="my_js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="my_js/main.js"></script>
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

	<script type="text/javascript" src="my_timepicker/jquery.timepicker.js"></script>
	<link rel="stylesheet" type="text/css"
		href="my_timepicker/jquery.timepicker.css" />

	<script type="text/javascript"
		src="my_timepicker/lib/bootstrap-datepicker.js"></script>
	<link rel="stylesheet" type="text/css"
		href="my_timepicker/lib/bootstrap-datepicker.css" />
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>


	<script>
		$('#school_mon').timepicker({
			timeFormat : 'HH:mm',
			interval : 30,
			minTime : '0',
			maxTime : '11:30pm',
			defaultTime : '0',
			startTime : '0',
			dynamic : false,
			dropdown : true,
			scrollbar : true
		});
		$('#school_tue').timepicker({
			timeFormat : 'HH:mm',
			interval : 30,
			minTime : '0',
			maxTime : '11:30pm',
			defaultTime : '0',
			startTime : '0',
			dynamic : false,
			dropdown : true,
			scrollbar : true
		});

		$('#school_wed').timepicker({
			timeFormat : 'HH:mm',
			interval : 30,
			minTime : '0',
			maxTime : '11:30pm',
			defaultTime : '0',
			startTime : '0',
			dynamic : false,
			dropdown : true,
			scrollbar : true
		});
		$('#school_thu').timepicker({
			timeFormat : 'HH:mm',
			interval : 30,
			minTime : '0',
			maxTime : '11:30pm',
			defaultTime : '0',
			startTime : '0',
			dynamic : false,
			dropdown : true,
			scrollbar : true
		});

		$('#school_fri').timepicker({
			timeFormat : 'HH:mm',
			interval : 30,
			minTime : '0',
			maxTime : '11:30pm',
			defaultTime : '0',
			startTime : '0',
			dynamic : false,
			dropdown : true,
			scrollbar : true
		});

		$('#alba_mon').timepicker({
			timeFormat : 'HH:mm',
			interval : 30,
			minTime : '0',
			maxTime : '11:30pm',
			defaultTime : '0',
			startTime : '0',
			dynamic : false,
			dropdown : true,
			scrollbar : true
		});

		$('#alba_tue').timepicker({
			timeFormat : 'HH:mm',
			interval : 30,
			minTime : '0',
			maxTime : '11:30pm',
			defaultTime : '0',
			startTime : '0',
			dynamic : false,
			dropdown : true,
			scrollbar : true
		});

		$('#alba_wed').timepicker({
			timeFormat : 'HH:mm',
			interval : 30,
			minTime : '0',
			maxTime : '11:30pm',
			defaultTime : '0',
			startTime : '0',
			dynamic : false,
			dropdown : true,
			scrollbar : true
		});

		$('#alba_thu').timepicker({
			timeFormat : 'HH:mm',
			interval : 30,
			minTime : '0',
			maxTime : '11:30pm',
			defaultTime : '0',
			startTime : '0',
			dynamic : false,
			dropdown : true,
			scrollbar : true
		});

		$('#alba_fri').timepicker({
			timeFormat : 'HH:mm',
			interval : 30,
			minTime : '0',
			maxTime : '11:30pm',
			defaultTime : '0',
			startTime : '0',
			dynamic : false,
			dropdown : true,
			scrollbar : true
		});

		$('#alba_mon').timepicker({
			timeFormat : 'HH:mm',
			interval : 30,
			minTime : '0',
			maxTime : '11:30pm',
			defaultTime : '0',
			startTime : '0',
			dynamic : false,
			dropdown : true,
			scrollbar : true
		});
	</script>
</body>
</html>