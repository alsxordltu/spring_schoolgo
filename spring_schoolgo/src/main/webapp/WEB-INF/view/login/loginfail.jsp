<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML>
<!--
	Identity by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>LOGIN</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="login_css/login.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!-- <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript> -->
</head>
<body class="is-loading">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<section id="main">

			<h5>로그인에 실패하였습니다.</h5>
			<h6>ID와 비밀번호를 확인하세요.</h6>
			
				<div>
					<input type="button" onclick="location.href='gotofindid'" value="ID 찾기">
					<input type="button" onclick="location.href='gotofindpw'" value="비밀번호 찾기">	 
					<input type="button" onclick="location.href='gotologin'" value="돌아가기">
				</div>
			


		</section>

		<!-- Footer -->
		<footer id="footer">
			<ul class="copyright">
				<li>&copy; Jane Doe</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</footer>

	</div>

	<!-- Scripts -->
	<!--[if lte IE 8]><script src="assets/js/respond.min.js"></script><![endif]-->
	<script>
		if ('addEventListener' in window) {
			window.addEventListener('load', function() {
				document.body.className = document.body.className.replace(
						/\bis-loading\b/, '');
			});
			document.body.className += (navigator.userAgent
					.match(/(MSIE|rv:11\.0)/) ? ' is-ie' : '');
		}
	</script>

</body>
</html>