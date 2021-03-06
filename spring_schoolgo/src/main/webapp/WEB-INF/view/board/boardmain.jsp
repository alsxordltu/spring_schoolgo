<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML>
<!--
	Striped by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Striped by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="board_css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>
<%
	String routename = (String)session.getAttribute("routename");
 	String start = (String)session.getAttribute("start");		
%>
	<!-- Content -->
	<div id="content">
		<div class="inner">
		<article class="box post post-excerpt">
			<!-- 헤더부분 -->
				<header>
				<h2 align="center"><img src="board_img/board.png" width="70%"></h2>
					<p align="center">나만의 루트를 공유해보세요!</p>
				</header>
				
			<!-- Post -->
			
					<h2 align="center">boardmain</h2>
					공지사항 <hr>
					<form action="gotoboardlist">
					루트공유게시판
					<input type="submit" value="gogo">
					</form>
					<hr>
					<form action="gotoboardlist">
					자유게시판
					<input type="submit" value="꼬꼬">
					</form>
			</article>
		</div>
	</div>

	<!-- Sidebar -->
   <div id="sidebar">

      <!-- Logo -->
      <h1 id="logo">
         <a href="gotomain"><img src="main_img/gogowhite.png"
            width="150px" alt="" /></a>
      </h1>
      <form name="logout" action="logout">
        <div id="userinfodiv"> 
        <h5 style="text-align: center">${nickName}님환영합니다!</h5>
		<input type="submit" value="로그아웃" style="align:center;">
 		</div>
      </form>

         <!-- Nav -->
         <nav id="nav">
            <ul>
               <li><a href="gotomain">학교가기</a></li>
               <li><a href="gotoinsertroute">루트등록</a></li>
               <li class="current"><a href="gotoboardmain">루트공유</a></li>
               <li><a href="gotocontact">Contact Me</a></li>
               <li><a href="gotoadmin">Admin page</a></li>
            </ul>
         </nav>



         <!-- Recent Posts -->
         <section class="box recent-posts">
            <header>
               <h2>마이페이지</h2>
            </header>
           <ul id="mypageside">
            <li><a href="updateTimetable">시간표 등록</a></li>
            <li><a href="updateUser">개인정보 수정</a></li>
            <li><a href="gotomyactivity">활동내역</a></li>
         </ul>
         
         </section>
        

      <ul id="copyright">
         <li>&copy; Untitled.</li>
         <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
      </ul>
   </div>

	<!-- Scripts -->
	<script src="board_js/jquery.min.js"></script>
	<script src="board_js/skel.min.js"></script>
	<script src="board_js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="board_js/main.js"></script>
	<script src="http://code.jquery.com/jquery.js"></script>
	<script>
	
	function movenextpage(){
	
		   var startPoint = "<%=start %>";
		   var startStation = document.getElementById("resultStationName").value;
		   var url = "https://maps.googleapis.com/maps/api/directions/json?origin="+ startPoint +"&destination=" + startStation + "&mode=transit&key=AIzaSyD2AhXMW8KO4eZkRCQ1-6Gg3Fv4YOfYV58";
		   //var url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + input + "&key=AIzaSyDMyDmCjogn6vLLZcCM-ZMCpNtk2BZoO5Y";	
		   getinformation(url);
		   //document.getElementById('form1').submit(); 
		}

		function getinformation(input){
		   var url = input; 
		   $.ajax({
		      url:url,
		      type:"get",
		        async: false,
		      success:function(responseTxt){
		         var result = responseTxt.routes;
		         console.log(result);
		         document.all.jsonresult.value = result;
		         console.log(document.all.jsonresult.value);
		      },
		      error:function(xhr, status, error){
		         alert("fail: "+error);
		      }
		   });
		}
		
	$("#stationName")
	.on(
			"click",
			function() {
				window
						.open(
								'gotofindStation',
								'',
								'left=200, top=200, width=640, height=480, scrollbars=no, status=no, resizable=no, fullscreen=no, channelmode=no');
			});
	
	$("#stationName2")
	.on(
			"click",
			function() {
			
				window
						.open(
								'gotofindStation2',
								'',
								'left=200, top=200, width=640, height=480, scrollbars=no, status=no, resizable=no, fullscreen=no, channelmode=no');
				
			});
	
	</script>

</body>
</html>