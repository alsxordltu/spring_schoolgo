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
<link rel="stylesheet" href="my_css/main.css" />
</head>
<body>

	<!-- Wrapper-->
	<div id="logo">
		<a href='gotomain'><img src="main_img/gogo.png" alt="" width="300"></a>

	</div>
	<div id="wrapper">

		<nav id="nav">	
		<nav id="nav" class="navtable"style="display:block">
			<div style="float:left; width:258px; height:100px"></div>
			<a id="animate" ><i class="icon fa-user fa-lg">Profile</i></a>
		</nav>	
		</nav>
		
		
		<!-- Main -->
		<div id="main">
			<!-- Me -->
			<article id="me" class="panel">
				<header>
					<h6 text-align=center>개인정보 수정</h6>
					<a href='gotomain#mypage'><input type="button" value="마이페이지로"></a>
				</header>
				
				
				
				
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
<script>
	$("document").ready(function(){
		$("#animate").animate({
			left:180,
			top:-140
		});
	});
	</script>
</body>
</html>