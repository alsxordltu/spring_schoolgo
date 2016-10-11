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

					개인정보수정
					<sform:form method="post" action="updateUser" modelAttribute="userInfo">
						<div class="field">
						userId(변경불가)
							<sform:input path="userId" placeholder="Id" readonly="true" />
							<sform:errors element="span" path="userId"></sform:errors>
				
						</div>
						<div class="field">
							pass
							<sform:input type="password" path="pass" placeholder="Pass" />
							<sform:errors element="span" path="pass"></sform:errors>
							<!-- 	<input type="text" name="pass" id="pass" placeholder="Pass" />
							 -->
						</div>
						<div class="field">
							userName
							<sform:input path="userName" placeholder="Name" />
							<sform:errors element="span" path="userName"></sform:errors>
							<!-- 								<input type="text" name="userName" id="userNane" placeholder="Name" />
 -->
						</div>
						<div class="field">
							nickName
							<sform:input path="nickName" placeholder="Nickname" />
							<sform:errors element="span" path="nickName"></sform:errors>
							<!-- 								<input type="text" name="nickName" id="nickName" placeholder="Nickname" />
 -->
						</div>
						<div class="field">
							email
							<sform:input type="email" path="email" placeholder="Email" />
							<sform:errors element="span" path="email"></sform:errors>
							<!-- 								<input type="email" name="email" id="email" placeholder="Email" />
 -->
						</div>
						<div class="field">
							phoneNum
							<sform:input type="text" path="phoneNum" placeholder="Phone" />
							<sform:errors element="span" path="phoneNum"></sform:errors>
						</div>
						<div>
							<input type="submit" value="수정하기" >
							<input type="button" onclick="location.href='gotomain#mypage'"
								value="마이페이지로">
							<input type="button" onclick="location.href='deleteUser?id=${userId}'"
								value="회원탈퇴">
						</div>
					</sform:form>

				</div>
				<br>

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