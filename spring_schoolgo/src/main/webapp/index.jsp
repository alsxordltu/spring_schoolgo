<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<!DOCTYPE HTML>
<!--
	Identity by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Identity by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!-- <link rel="stylesheet" href="csds/login.css" /> -->
		<link rel="stylesheet" href="index_css/login.css" />
       

	</head>
	<body class="is-loading">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<section id="main">
						<header>
							<span class="avatar"><img src="index_img/00.jpg" alt="그림없음" width="150"/></span>
							<h1>학교가자!</h1>
						</header>
						<footer>
							<ul class="icons"><!--  메인화면의 아이콘 설정 -->
								<li><a href="gotologin" class="fa-sign-in">로그인</a></li>
								<li><a href="gotojoin" class="fa-user-plus">회원가입</a></li>
								<li><a href="gotomain" class="fa-user-plus">찬섭전용</a></li>
								
							</ul>
						</footer>
					</section>



				<!-- Footer -->
					<footer id="footer">
						<ul class="copyright">
							<li>&copy; Jane Doe</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
						</ul>
					</footer>

			</div>

		<!-- Scripts -->
			<!--[if lte IE 8]><script src="assets/js/respond.min.js"></script><![endif]-->
			<%
			
			
			%>

	</body>
				<script>
				if ('addEventListener' in window) {
					window.addEventListener('load', function() { document.body.className = document.body.className.replace(/\bis-loading\b/, ''); });
					document.body.className += (navigator.userAgent.match(/(MSIE|rv:11\.0)/) ? ' is-ie' : '');
				}
				
			</script>
</html>