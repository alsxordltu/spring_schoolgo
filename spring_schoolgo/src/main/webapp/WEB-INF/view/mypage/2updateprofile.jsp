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
					<sform:form modelAttribute="userInfo">
						<sform:input path="userId"/>
						<sform:input path="pass"/>
						<sform:input path="userName"/>
						<sform:input path="nickName"/>
						<sform:input path="email"/>
						<sform:input path="phoneNum"/>
					</sform:form>
				</div>

				<br>
				
				<%-- <sform:form method="post" action="join" modelAttribute="user">
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
								<sform:input  path="phoneNum"  placeholder="Phone"/>
								<sform:errors element="span" path="phoneNum"></sform:errors>
								
					<!-- 			<input type="text" name="phoneNum" id="phoneNum" placeholder="Phone" />
					 -->		</div>
				
					
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
						</sform:form> --%>
		

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