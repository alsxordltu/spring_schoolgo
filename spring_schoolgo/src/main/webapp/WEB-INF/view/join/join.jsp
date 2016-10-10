<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML>

<!--
	Identity by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>JOIN ^_^</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="join_css/login.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!-- <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript> -->
	</head>
	<body class="is-loading">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<section id="main">
						
					
						<h2>JOIN</h2>
						<sform:form method="post" action="join" modelAttribute="user">
							<div class="field">
								<sform:input path="userId"  placeholder="Id"/>
								<sform:errors element="span" path="userId"></sform:errors>
				<!-- 				<input type="text" name="userId" id="userId" placeholder="Id" />
				 -->		</div>
							<div class="field">
							<sform:input type="password" path="pass" placeholder="Pass"/>
							<sform:errors element="span" path="pass"></sform:errors>
							<!-- 	<input type="text" name="pass" id="pass" placeholder="Pass" />
							 --></div>													
							<div class="field">
								<sform:input path="userName" placeholder="Name"/>
								<sform:errors element="span" path="userName"></sform:errors>
<!-- 								<input type="text" name="userName" id="userNane" placeholder="Name" />
 -->							</div>
							<div class="field">
								<sform:input path="nickName"  placeholder="Nickname"/>
								<sform:errors element="span" path="nickName"></sform:errors>
<!-- 								<input type="text" name="nickName" id="nickName" placeholder="Nickname" />
 -->							</div>
							<div class="field">
								<sform:input type="email" path="email"  placeholder="Email"/>
								<sform:errors element="span" path="email"></sform:errors>
<!-- 								<input type="email" name="email" id="email" placeholder="Email" />
 -->							</div>
							<div class="field">
								<sform:input type="text" path="phoneNum"  placeholder="Phone"/>
								<sform:errors element="span" path="phoneNum"></sform:errors>
								
					<!-- 			<input type="text" name="phoneNum" id="phoneNum" placeholder="Phone" />
					 -->		</div>
							<div class="field">	
								<input type="checkbox" id="agree" name="agree" placeholder="Agree" required /><label for="agree">개인정보 활용에 동의합니다</label>
							</div>
					
<!-- 							<div class="field">
								<textarea name="message" id="message" placeholder="Message" rows="4"></textarea>
							</div> -->
<!-- 							
							<div class="field">
								<label>But are you a robot?</label>
								<input type="radio" id="robot_yes" name="robot" /><label for="robot_yes">Yes</label>
								<input type="radio" id="robot_no" name="robot" /><label for="robot_no">No</label>
							</div> -->
							<div>
								<input type="submit" value="회원가입">
								<!-- <input type="button"   onclick="location.href='gototutorial'"         value="회원가입"> -->
								<input type="button"     onclick="location.href='index.jsp'"         value="돌아가기">
							</div>
						</sform:form>
						
						
						
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
			<script>
				if ('addEventListener' in window) {
					window.addEventListener('load', function() { document.body.className = document.body.className.replace(/\bis-loading\b/, ''); });
					document.body.className += (navigator.userAgent.match(/(MSIE|rv:11\.0)/) ? ' is-ie' : '');
				}
			</script>

	</body>
</html>