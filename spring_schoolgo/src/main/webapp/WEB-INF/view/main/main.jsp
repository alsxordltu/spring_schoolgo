<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE HTML>
<!--
   Astral by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Astral by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="main_css/main.css" />
<link rel="stylesheet" href="main_css/form.css" />
</head>
<body>

	<!-- Wrapper-->
	<div id="logo" style="float: left">
		<a href='gotomain'><img src="main_img/gogo.png" alt="" width="300"></a>
	</div>
	<div id="welcome" style="float: right; margin: 15px 10px 0 0;">
		<h5>${nickName}님☆환영합니다^-^</h5>
		<form name="logout" action="logout" style="margin-bottom: 0;">
			<input type="submit" value="로그아웃">
		</form>
	</div>
	<div id="wrapper">
		<!-- style=" padding-top:68px; opacity:1; " -->

		<!-- Nav -->
		<!--  <nav id="nav">
                  <a href="#me" class="icon fa-home  active "><span>학교가기</span></a>
                  <a href="#addroute" class="icon fa-plus-circle fa-3x"><span>루트 등록</span></a>
                  <a href="#shareroute" class="icon fa-comments"><span>루트 공유</span></a>
                  <a href="#mypage" class="icon fa-user"><span>마이페이지</span></a>
                  <a href="#contactus" class="icon fa-question-circle"><span>Contact Us</span></a>
               </nav>  -->



		<nav id="nav">
			<a href="#me" class="active"><i class="icon fa-home fa-lg"></i><span>학교가기</span></a>
			<a href="#addroute"><i class="icon fa-plus-circle fa-lg"></i> <span>루트등록</span></a>
			<a href="#shareroute"><i class="icon fa-comments fa-lg"></i> <span>루트공유</span></a>
			<a href="#mypage"><i class="icon fa-user fa-lg"></i><span>마이페이지</span></a>
			<a href="#contactus"><i class="icon fa-question-circle fa-lg"></i><span>Contact
					Us</span></a>


		</nav>


		<!-- Main -->
		<div id="main">



			<!-- Me -->

			<article id="me" class="panel"
				style="padding: 50px 120px 65px 120px;">


				<div id="route1" class="routeclass"
					style="width: 600px; height: auto; margin-bottom:15px;">
					<button id="btn1" style="width: 600px; height: 50px;">섭이의
						루트1</button>
				</div>

				<div id="route11" class="routeclass"
					style="width: 600px; height: auto; display: none;">
					<button id="btn11" style="width: 150px; height: 40px; float: left;" onclick="location.href='gotoroute1go'">등교하기</button>
					<button id="btn12" style="width: 150px; height: 40px; margin: 0 70px 0 70px; float: left;" onclick="location.href='gotoroute1come'">하교하기</button>
					<button id="btn13" style="width: 150px; height: 40px; float: left;">루트정보</button>
				</div>




			</article>


			<!-- addroute -->
			<article id="addroute" class="panel">
				<header>
					<h6 text-align=center>루트 등록하기</h6>
				</header>
				<section>


					<div style="margin-left: 200px; margin-right: auto;">
						<h5 style="float: left">루트 이름을 입력하세요! &nbsp&nbsp&nbsp</h5>
						<input type="text">
						<!-- <h5 style="float:left">어디로 가세요? &nbsp&nbsp&nbsp</h5>
					<select>
					<option>학교</option>
					<option>학교</option>
					</select> -->
					</div>
					<div style="margin: 50px auto auto 300px">
						<a class="button" onclick="location.href='gotoinsertroute'">등록하러
							가기</a>
					</div>




				</section>
			</article>



			<!-- shareroute -->
			<article id="shareroute" class="panel">
				<header>
					<h2>여기에 루트 공유 게시판</h2>
				</header>

			</article>



			<!-- mypage -->
			<article id="mypage" class="panel">
				<header>
					<h6 text-align=center>마이페이지</h6>
					<!-- h6=헤더 -->
				</header>

				<div style="margin: 80px auto auto 200px">
					<input type="button" value="등교시간 등록하기" id="timetable"
						onclick="location.href='gototimetable'">&nbsp&nbsp&nbsp <input
						type="button" value="개인정보 수정" id="updateprofile"
						onclick="location.href='updateUser?id=${userId}'">
					<%-- "${updateUser }?id=hong" --%>
				</div>


				<!-- onclick="location.href='gotoroutemanager'" -->


				<div style="margin: 50px auto auto 140px">
					<input type="button" value="루트 관리" id="routemanager"
						onclick="location.href='gotoroutemanager'">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<input type="button" value="교통비 가계부" id="costcal"
						onclick="location.href='gotocostcal'">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<input type="button" value="나의 활동내역" id="myactivity"
						onclick="location.href='gotomyactivity'">
				</div>
			</article>

			<!-- mypage - 등교시간 등록하기 -->
			<article id="mytimetable" class="panel">

				<div style="margin: 50px auto auto 140px">
					<h6>12313123213</h6>
				</div>
			</article>











			<!-- contactus -->
			<article id="contactus" class="panel">
				<div class="container_12">
					<div class="grid_12">
						<div class="slogan">
							<h3>Get in Touch</h3>
							<div class="text1">Gyrto ivamus at magna non nunc tristique
								rhoncusu. Lliquam nibh ante, egestas id dictum a, commodo luctus
								mibero. Praesent faucibus malesuada faucibu. Monec laoreet metus
								id laoreet malesuadw.</div>
						</div>
					</div>
					<div class="clear"></div>
					<div class="map">
						<div class="grid_3">
							<div class="text1">Address</div>
							<address>
								<dl>
									<dt>
										The Company Name Inc.<br> 8901 Marmora Road,<br>
										Glasgow, D04 89GR.
									</dt>
									<dd>
										<span>Freephone:</span>+1 800 559 6580
									</dd>
									<dd>
										<span>Telephone:</span>+1 800 603 6035
									</dd>
									<dd>
										<span>FAX:</span>+1 800 889 9898
									</dd>
									<dd>
										E-mail: <a href="#" class="link-1">mail@demolink.org</a>
									</dd>
									<dd>
										Skype: <a href="#" class="link-1">@skypename</a>
									</dd>
								</dl>
							</address>
						</div>
						<div class="grid_3">
							<div class="text1">&nbsp;</div>
							<figure>
								<iframe
									src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Brooklyn,+New+York,+NY,+United+States&amp;aq=0&amp;sll=37.0625,-95.677068&amp;sspn=61.282355,146.513672&amp;ie=UTF8&amp;hq=&amp;hnear=Brooklyn,+Kings,+New+York&amp;ll=40.649974,-73.950005&amp;spn=0.01628,0.025663&amp;z=14&amp;iwloc=A&amp;output=embed"></iframe>
							</figure>
						</div>
						<div class="grid_5 prefix_1">
							<div class="text1">Ask a Question</div>
							<form id="form" action="#">
								<div class="success_wrapper">
									<div class="success">
										Contact form submitted!<br> <strong>We will be
											in touch soon.</strong>
									</div>
								</div>
								<fieldset>
									<label class="name"> <input type="text" value="Name:">
										<br class="clear"> <span class="error error-empty">*This
											is not a valid name.</span><span class="empty error-empty">*This
											field is required.</span>
									</label> <label class="email"> <input type="text"
										value="E-mail:"> <br class="clear"> <span
										class="error error-empty">*This is not a valid email
											address.</span><span class="empty error-empty">*This field is
											required.</span>
									</label> <label class="message"> <textarea>Message:</textarea>
										<br class="clear"> <span class="error">*The
											message is too short.</span> <span class="empty">*This field
											is required.</span>
									</label>
									<div class="clear"></div>
									<div class="btns">
										<a data-type="submit" class="link1">Send</a>
										<div class="clear"></div>
									</div>
								</fieldset>
							</form>
						</div>
						<div class="clear"></div>
					</div>
				</div>
			</article>







			<!-- Footer -->
			<div id="footer">
				<ul class="copyright">
					<li>&copy; Untitled.</li>
					<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
				</ul>
			</div>

		</div>

		<!-- Scripts -->
		<script src="main_js/jquery.min.js"></script>
		<script src="main_js/skel.min.js"></script>
		<script src="main_js/skel-viewport.min.js"></script>
		<script src="main_js/util.js"></script>
		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script src="main_js/main.js"></script>

		<!-- Footer -->
		<div id="footer">
			<ul class="copyright">
				<li>&copy; Untitled.</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>

	</div>

	<!-- Scripts -->
	<script src="main_js/jquery.min.js"></script>
	<script src="main_js/skel.min.js"></script>
	<script src="main_js/skel-viewport.min.js"></script>
	<script src="main_js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="main_js/main.js"></script>
	<script>
		var index = 0;
		$("#btn1").on("click", function() {
			if (index == 0) {
				$("#route11").fadeIn(350);
				index++;
			} else {
				$("#route11").fadeOut(350);
				index--;
			}
		});
	</script>
</body>
</html>