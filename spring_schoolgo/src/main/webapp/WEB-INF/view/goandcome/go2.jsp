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
			<div id="top" style="height:50px;">
			<h1 align=center>등교하기</h1>
			</div>
			
			<div id="gogo" style="height:500px;">
			<h5>출발할 때 버튼을 눌러주세요</h5> 
			
			</div>
			
			
			
			<div id="bottom" style="height:50px;">
			<a href='gotomain'><input type="button" value="다음"></a>
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
<script>

   var today = new Date();

   var currentTime =
   today.getHours()+"시 " +
   today.getMinutes()+ "분 "+
   today.getSeconds()+"초";

  console.log(currentTime);

</script>


			
</body>
</html>