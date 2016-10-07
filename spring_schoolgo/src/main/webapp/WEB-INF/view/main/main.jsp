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
</head>
<body>

	<!-- Wrapper-->
	<div id="logo">
		<a href='gotomain'><img src="main_img/gogo.png" alt="" width="300"></a>


	</div>
	<div id="wrapper" >
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
			<a href="#addroute"><i class="icon fa-plus-circle fa-lg"></i>
			<span>루트등록</span></a> 
			<a href="#shareroute"><i class="icon fa-comments fa-lg"></i>
			<span>루트공유</span></a>
			<a href="#mypage"><i class="icon fa-user fa-lg"></i><span>마이페이지</span></a>
			<a href="#contactus"><i class="icon fa-question-circle fa-lg"></i><span>Contact
					Us</span></a>
							
					
		</nav>
		
		<!-- <nav id="nav" class="navtable"style="display:none">
			<div style="float:left; width:258px; height:100px"></div>
			<a id="animateT" ><i class="icon fa-user fa-lg">Timetable</i></a>
		</nav>
		
		<nav id="nav" class="navupdate"style="display:none">	
			<div style="float:left; width:258px; height:100px"></div>
			<a id="animateU" ><i class="icon fa-user fa-lg">Profile</i></a>
		</nav>

		<nav id="nav" class="navmanage"style="display:none">	
			<div style="float:left; width:258px; height:100px"></div>
			<a id="animateM" ><i class="icon fa-user fa-lg">Manager</i></a>
		</nav>
		
		<nav id="nav" class="navcost"style="display:none">	
			<div style="float:left; width:258px; height:100px"></div>
			<a id="animateC" ><i class="icon fa-user fa-lg">Cost</i></a>
		</nav>

		<nav id="nav" class="navactive"style="display:none">	
			<div style="float:left; width:258px; height:100px"></div>
			<a id="animateA" ><i class="icon fa-user fa-lg">MyActivity</i></a>
		</nav> -->




		<!-- Main -->
		<div id="main">



			<!-- Me -->
			<article id="me" class="panel">
				<header>
					<h1>여기에다가 학교가기 페이지</h1>
					<a class="button">섭이의 루트1</a>
				</header>
			</article>



			<!-- addroute -->
			<article id="addroute" class="panel">
				<header>
					<h6 text-align=center>루트 등록하기</h6>
				</header>
				<section>


<div style="margin-left:200px; margin-right:auto;">
				<h5 style="float:left">루트 이름을 입력하세요! &nbsp&nbsp&nbsp</h5>
				<input type="text">
					<!-- <h5 style="float:left">어디로 가세요? &nbsp&nbsp&nbsp</h5>
					<select>
					<option>학교</option>
					<option>학교</option>
					</select> -->
					</div>
<div style="margin: 50px auto auto 300px">
				<a class="button" onclick="location.href='gotoinsertroute'">등록하러 가기</a>
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
					<h6 text-align=center>마이페이지</h6>				<!-- h6=헤더 -->
				</header>
				
			<div style="margin: 80px auto auto 200px">
	<input type="button" value="등교시간 등록하기" id="timetable" onclick="location.href='gototimetable'">&nbsp&nbsp&nbsp
			
	<input type="button" value="개인정보 수정"  id="updateprofile" onclick="location.href='gotoupdateprofile'">
			</div>
					
					
					<!-- onclick="location.href='gotoroutemanager'" -->
					
					
			<div style="margin: 50px auto auto 140px">
				<input type="button" value="루트 관리"  id="routemanager" onclick="location.href='gotoroutemanager'">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				<input type="button" value="교통비 가계부"  id="costcal" onclick="location.href='gotocostcal'">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				<input type="button" value="나의 활동내역"  id="myactivity" onclick="location.href='gotomyactivity'">
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
				<header>
					<h2>여기에 컨택트</h2>
				</header>
		
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
	<script src="main_js/jquery.min.js"></script>
	<script src="main_js/skel.min.js"></script>
	<script src="main_js/skel-viewport.min.js"></script>
	<script src="main_js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="main_js/main.js"></script>
<script>
/* $("#timetable").on("click",function(){
	$("#nav").css("display", "none");
	$(".navtable").css("display", "block");
	 $("#animateT").animate({
			left:180,
			top:-140
		});
});


$("#costcal").on("click",function(){
	$("#nav").css("display", "none");
	$(".navcost").css("display", "block");
	$("#animateC").animate({
		left:180,
		top:-140
	});
});

$("#myactivity").on("click",function(){
	$("#nav").css("display", "none");
	$(".navactive").css("display", "block");
	$("#animateA").animate({
		left:180,
		top:-140
	});
});

$("#routemanager").on("click",function(){
	$("#nav").css("display", "none");
	$(".navmanage").css("display", "block");
	$("#animateM").animate({
		left:180,
		top:-140
	});
	
});

$("#updateprofile").on("click",function(){
	$("#nav").css("display", "none");
	$(".navupdate").css("display", "block");
	$("#animateU").animate({
		left:180,
		top:-140
	});
	
}); */
</script>
</body>
</html>