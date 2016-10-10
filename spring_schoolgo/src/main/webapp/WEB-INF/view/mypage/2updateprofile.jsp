<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE HTML>
<html>
<head>
<title>Astral by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="my_css/main.css" />
<link rel="stylesheet" href="my_css/form.css" />
</head>
<body>

	<!-- Wrapper-->
	<div id="logo">
		<a href='gotomain'><img src="my_img/gogo.png" alt="" width="300"></a>
	</div>

	<div id="wrapper">

		<nav id="nav" class="navtable" style="display: block;">
			<div style="float: left; width: 220px; height: 100px"></div>
			<a id="animate"><i class="icon fa-plus-circle fa-lg">Insert</i></a>
		</nav>

		<!-- Main -->
		<div id="main">

			<!-- Me -->
			<article id="me" class="panel"
				style="padding: 50px 100px 50px 100px;">

				<div style="height: 1000px;">
					개인정보수정 <a href='gotomain#mypage'><input type="button"
						value="마이페이지로"></a>
				</div>

				<br>
				<form method="post" action="updateUser" modelAttribute="userInfo">
					<div class="field">
						<sform:input path="userId"  placeholder="Id"/>
					</div>
					<sform:button>제출</sform:button>
				</form>

				<%-- 						<br>
						<sform:label path="name" class="inputlabel">이름</sform:label>
						<sform:input path="name" />
						<br>
						<sform:label path="password" class="inputlabel">비밀번호</sform:label>
						<sform:input path="password" />
						<br>
						<sform:label path="email" class="inputlabel">이메일</sform:label>
						<sform:input path="email" type="email" />
						<br> --%>



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
	<script src="my_js/jquery.min.js"></script>
	<script src="my_js/skel.min.js"></script>
	<script src="my_js/skel-viewport.min.js"></script>
	<script src="my_js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="my_js/main.js"></script>
	<script>
		$("document").ready(function() {
			$("#animate").animate({
				left : 160
			/* top:-140 */
			});
		});
	</script>
</body>
</html>