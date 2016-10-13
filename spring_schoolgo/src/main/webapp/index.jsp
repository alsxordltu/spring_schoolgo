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
							<h3>현재 시간은 <span id="clock"></span><br>
							도착해야 하는 시간 : <span id="arrivetime"></span><br>
							남은 시간 : <span id="hour"></span>시간 <span id="min"></span>분 <span id="sec"> 초 남았다.</span></h3>
							<!-- <p>Senior Psychonautics Engineer</p> -->
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
				function printTime() {
				    // clock 객체 생성
				    var clock = document.getElementById("clock");
				    var hour = document.getElementById("hour"); 
				    var min = document.getElementById("min"); 
				    var sec = document.getElementById("sec"); 
					var arrivetime = document.getElementById("arrivetime");
				    
				    var now = new Date();
				    var arrive = new Date(null,null,null,11,50,45);
				    //도착시간-현재시간 의 간격을 초로 바꿈
				    //var remaintime = DateDiff("S",clock,arrivetime);
				    				    				   
				    var day, hour, min, sec, mod;
				    var remaincountext;
					
				    remaincounttext="";
				    
				    clock.innerHTML =  
				      now.getHours() + "시간 " +
				      now.getMinutes() + "분 " +
				      now.getSeconds() + "초";
				     
				    // 1초 후에 함수 호출
				    setTimeout("printTime()", 1000);
				    
				    arrivetime.innerHTML = 
					      arrive.getHours() + "시간 " +
					      arrive.getMinutes() + "분 " +
					      arrive.getSeconds() + "초";
				    //남은일수
				    day=Math.floor(remaintime/(3600*24));
				    mod=remaintime%(24*3600);
				    
				    //남은시간
				    hour=Math.floor(mod/3600);
				    mod=mod%3600;
				    
				    //남은분
				    min=Math.floor(mod/60);
				    
				    //남은초
				    sec=mod%60;
				    
/* 				    hour.innerHTML="hour";
				    min.innerHTML="min";
				    sec.innerHTML="sec";
				     */
				    	
				  };
				 
				  // 창이뜨면, html이 로딩되면 함수 호출
				  window.onload = function() {
				    printTime();
				  };
			</script>
</html>