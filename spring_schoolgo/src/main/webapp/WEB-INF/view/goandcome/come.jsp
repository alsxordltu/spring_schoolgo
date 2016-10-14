<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Astral by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="gocome_css/main.css" />
<link rel="stylesheet" href="gocome_css/form.css" />
</head>
<body>

	<!-- Wrapper-->
	<div id="logo">
		<a href='gotomain'><img src="gocome_img/gogo.png" alt="" width="300"></a>
	</div>
	
	<div id="wrapper">
	
			<nav id="nav" class="navtable" style="display:block;">
			<div style="float:left; width:220px; height:100px"></div>
			<a id="animate" ><i class="icon fa-plus-circle fa-lg">Insert</i></a>
		</nav>	
		
		<!-- Main -->
		<div id="main">
		
			<!-- Me -->
			<article id="me" class="panel" style="padding:50px 100px 50px 100px;">
			<div style="height:1000px;">
			나의 활동내역
			<a href='gotomain'><input type="button" value="학교가기페이지로"></a>
			</div>
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
	<script src="gocome_js/jquery.min.js"></script>
	<script src="gocome_js/skel.min.js"></script>
	<script src="gocome_js/skel-viewport.min.js"></script>
	<script src="gocome_js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="gocome_js/main.js"></script>
<script>
$("document").ready(function(){
	$("#animate").animate({
		left:160
		/* top:-140 */
	});
});
</script>
</body>
</html>