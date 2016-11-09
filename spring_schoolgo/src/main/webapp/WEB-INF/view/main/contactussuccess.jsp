<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="main_css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->


</head>
<body>

	<!-- Content -->
	<div id="content">
		<div class="inner">

			<article class="box post post-excerpt">
				<header>
					<h2 align="center">
						<img src="main_img/contact.png" width="80%">
					</h2>
					<p align="center">문의가 완료되었습니다
				</header>
			</article>

		

		</div>
	</div>


	<!-- Sidebar -->
	<div id="sidebar">

		<!-- Logo -->
		<h1 id="logo">
			<a href="gotomain"><img src="main_img/gogowhite.png"
				width="150px" alt="" /></a>
		</h1>
		<form name="logout" action="logout">
			<div id="userinfodiv">
				<h5 style="text-align: center">${nickName}님환영합니다!</h5>
				<input type="submit" value="로그아웃" style="align: center;">
			</div>
		</form>

		<!-- Nav -->
		<nav id="nav">
			<ul>
				<li><a href="gotomain">학교가기</a></li>
				<li><a href="gotoinsertroute">루트등록</a></li>
				<li><a href="gotoboardmain">루트공유</a></li>
				<li class="current"><a href="gotocontact">Contact Me</a></li>
				<li><a href="gotoadmin">Admin page</a></li>
			</ul>
		</nav>



		<!-- Recent Posts -->
		<section class="box recent-posts">
			<header>
				<h2>마이페이지</h2>
			</header>
			<ul id="mypageside">
				<li><a href="updateTimetable">시간표 등록</a></li>
				<li><a href="updateUser">개인정보 수정</a></li>
				<li><a href="gotomyactivity">활동내역</a></li>
			</ul>

		</section>


		<ul id="copyright">
			<li>&copy; Untitled.</li>
			<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
		</ul>
	</div>


	<script src="main_js/jquery.min.js"></script>
	<script src="main_js/skel.min.js"></script>
	<script src="main_js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="main_js/main.js"></script>
	<script src="http://code.jquery.com/jquery.js"></script>

	<script>
		
	</script>

</body>
</html>