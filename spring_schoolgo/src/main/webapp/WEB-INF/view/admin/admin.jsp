<!DOCTYPE HTML>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<style>
body {
	padding: 15px;
}
<title>Striped by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="assets/js/ie/html5shiv.js"></script>
<link rel="stylesheet" href="main_css/main.css" />
<link rel="stylesheet" href="assets/css/ie8.css" />
table {
	border-collapse: separate;
	border-spacing: 0 5px;
}

thead th {
	background-color: #006DCC;
	color: white;
}
</style>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="canvasjs.min.js"></script>
<script type="text/javascript" src="/assets/script/jquery-1.11.1.min.js"></script>
<script src="http://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/canvasjs/1.4.1/canvas.min.js"></script>
</head>
<body>
	 	<c:forEach items="${countdata}" var="list">
		 ${list} 
	</c:forEach>
<div id="content">
      <div class="inner">
            <article class="box post post-excerpt">
               <header>
                  <h2 align="center"><img src="main_img/fix.png" width="70%"></h2>
               </header>
            </article>

	<h1>admin page_bigdata 모든계정(user)의 루트목록 count</h1>

	<table class="table">
		<thead>
			<tr>
				<th>장소(경유출발지도착지)</th>
				<th>count</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${countdata}" var="list">
				<tr>
					<td>${list.VNAME}</td>
					<td>${list.SUMR}</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>

	<div id="chartContainer" style="height: 300px; width: 100%;"></div>
	
	

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
               <li><a href="gotoboardmain">루트공유</a></li>
               <li><a href="gotocontact">Contact Me</a></li>
               <li class="current"><a href="gotoadmin">Admin page</a></li>
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
	
</body>

   <script src="main_js/jquery.min.js"></script>
   <script src="main_js/skel.min.js"></script>
   <script src="main_js/util.js"></script>
   <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
   <script src="main_js/main.js"></script>
   <script src="http://code.jquery.com/jquery.js"></script>
   <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
   
<script>
	var countdata = "${countdata}";
	console.log(countdata);
		
	window.onload = function () {
	  var chart = new CanvasJS.Chart("chartContainer", {
	     theme: "theme2",//theme1
	     title:{
	        text: "대학생 등/하교시 많이 다니는 장소 ?"              
	    },
	     data: [              
	     {
	        type: "column",
	        dataPoints: [
	        { label: "사과", y: 10 },
	        { label: "오렌지", y: 15 },
	        { label: "바나나", y: 25 },
	        { label: "망고", y: 30 },
	        { label: "포도", y: 28 },
	        ]
	     }
	     ]
	  });
	  chart.render();
	}
	</script>

</html>
