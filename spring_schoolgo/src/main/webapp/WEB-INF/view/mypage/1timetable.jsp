<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
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
<link rel="stylesheet" href="my_css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<%
	String id = request.getParameter("id");
%>
<body>

	<!-- Content -->
	<div id="content">
		<div class="inner">

			<!-- Post -->
			<article class="box post post-excerpt">
				<header>

					<!-- 아티클 제목 -->
					<h2>
						<a href="#">시간표 등록하자</a>
					</h2>
				</header>
			</article>
			<div id=timetable>
				<sform:form method="post" action="updateTimetable"
					modelAttribute="TimetableTotal">
					<p>userId
					<sform:input type="text" path="userId" placeholder="userId" />
						
						
						
						<div id="schoolgottdiv">
						
						<div id="leftdiv">
						
						</div>
						
						<div id="godiv">
						<h6>월</h6>
						</div>
						
						<div id="godiv">
						<h6>화</h6>
						</div>
						
						<div id="godiv">
						<h6>수</h6>
						</div>
						
						<div id="godiv">
						<h6>목</h6>
						</div>
						
						<div id="godiv">
						<h6>금</h6>
						</div>
						
						</div>
						
						
						<div id="schoolgottdiv">
						
						<div id="leftdiv">
						<h6>학교가기</h6>
						</div>
						
						<div id="godiv">
						<sform:input class="schoolgott" id="school_mon"  type="text" path="sMon" placeholder="sMon"/>
						</div>
						
						<div id="godiv">
						<sform:input class="schoolgott" id="school_tue" type="text"  path="sTue" placeholder="sTue"/>
						</div>
						
						<div id="godiv">
						<sform:input class="schoolgott" id="school_wed" type="text"  path="sWed" placeholder="sWed"/> 
						</div>
						
						<div id="godiv">
						<sform:input class="schoolgott" id="school_thu" type="text"  path="sThu" placeholder="sThu"/> 
						</div>
						
						<div id="godiv">
						<sform:input class="schoolgott" id="school_fri" type="text"  path="sFri" placeholder="sFri"/>
						</div>
						
						</div>
						  
               	 
               	
               	
                
            
						
						
						<div id="albagottdiv">
						
						<div id="leftdiv">
						<h6>알바가기</h6>
						</div>
						
						<div id="godiv">
						<sform:input class="albagott" id="alba_mon" type="text"  path="aMon" placeholder="aMon"/>
						</div>
						
						<div id="godiv">
						<sform:input class="albagott" id="alba_tue" type="text"  path="aTue" placeholder="aTue"/> 
						</div>
						
						<div id="godiv">
						<sform:input class="albagott" id="alba_wed" type="text"  path="aWed" placeholder="aWed"/> 
						</div>
						
						<div id="godiv">
						<sform:input class="albagott" id="alba_thu" type="text"  path="aThu" placeholder="aThu"/> 
						</div>
						
						<div id="godiv">
						<sform:input class="albagott" id="alba_fri" type="text"  path="aFri" placeholder="aFri"/>
						</div>
						
						</div>
						
						
						
                
                
                
                
            
						
						
						
						
						
						
					<%-- <table border="1">
						<tr>
							<th style="padding: 0 35px 15px 0;"><h6>월</h6></th>
							<th style="padding: 0 35px 15px 0;"><h6>화</h6></th>
							<th style="padding: 0 35px 15px 0;"><h6>수</h6></th>
							<th style="padding: 0 35px 15px 0;"><h6>목</h6></th>
							<th style="padding: 0 35px 15px 0;"><h6>금</h6></th>

						</tr>

						<tr>

							<td><input id="mon1" name="mon" type="radio" class="radio">
								<label for="mon1">
							<sform:input class="schoolgott" id="school_mon"  type="text" path="sMon" placeholder="sMon" />
							</label></td>

							<td><input id="tue1" name="tue" type="radio" class="radio">
								<label for="tue1"> 
							<sform:input class="schoolgott" id="school_tue" type="text"  path="sTue" placeholder="sTue"/>
							</label></td>

							<td><input id="wed1" name="wed" type="radio" class="radio">
								<label for="wed1" class="radio-label"> <i
									class="fa fa-check"></i> <span>1교시</span>
							</label></td>

							<td><input id="thu1" name="thu" type="radio" class="radio">
								<label for="thu1" class="radio-label"> <i
									class="fa fa-check"></i> <span>1교시</span>
							</label></td>

							<td><input id="fri1" name="fri" type="radio" class="radio">
								<label for="fri1" class="radio-label"> <i
									class="fa fa-check"></i> <span>1교시</span>
							</label></td>
						</tr>

						<tr>

							<td><input id="mon2" name="mon" type="radio" class="radio">
								<label for="mon2" class="radio-label"> <i
									class="fa fa-check"></i> <span>2교시</span>
							</label></td>

							<td><input id="tue2" name="tue" type="radio" class="radio">
								<label for="tue2" class="radio-label"> <i
									class="fa fa-check"></i> <span>2교시</span>
							</label></td>

							<td><input id="wed2" name="wed" type="radio" class="radio">
								<label for="wed2" class="radio-label"> <i
									class="fa fa-check"></i> <span>2교시</span>
							</label></td>

							<td><input id="thu2" name="thu" type="radio" class="radio">
								<label for="thu2" class="radio-label"> <i
									class="fa fa-check"></i> <span>2교시</span>
							</label></td>

							<td><input id="fri2" name="fri" type="radio" class="radio">
								<label for="fri2" class="radio-label"> <i
									class="fa fa-check"></i> <span>2교시</span>
							</label></td>
						</tr>

						
					</table> --%>



					<%--   <div id="schoolgottdiv">
          <h6 style="float:left;">학교가기</h6>
                <sform:input class="schoolgott" id="school_mon"  type="text" path="sMon" placeholder="sMon" />  
               	<sform:input class="schoolgott" id="school_tue" type="text"  path="sTue" placeholder="sTue"/> 
               	<sform:input class="schoolgott" id="school_wed" type="text"  path="sWed" placeholder="sWed"/> 
               	<sform:input class="schoolgott" id="school_thu" type="text"  path="sThu" placeholder="sThu"/> 
                <sform:input class="schoolgott" id="school_fri" type="text"  path="sFri" placeholder="sFri"/>
            <p>
            </div>
          
            
            <div id="albagottdiv">
            <h6 style="float:left;">알바가기</h6>
                <sform:input class="albagott" id="alba_mon" type="text"  path="aMon" placeholder="aMon"/>
                <sform:input class="albagott" id="alba_tue" type="text"  path="aTue" placeholder="aTue"/> 
                <sform:input class="albagott" id="alba_wed" type="text"  path="aWed" placeholder="aWed"/> 
                <sform:input class="albagott" id="alba_thu" type="text"  path="aThu" placeholder="aThu"/> 
                <sform:input class="albagott" id="alba_fri" type="text"  path="aFri" placeholder="aFri"/>
            </div> --%>



					<div style="margin: 0 0 0 200px;">
						<input type="submit" value="수정하기"> <a
							href='gotomain#mypage'><input type="button" value="돌아가기"></a>
					</div>

				</sform:form>
			</div>
			
			
			
			
			
			
		</div>
	</div>

	<!-- Sidebar -->
	<div id="sidebar">

		<!-- Logo -->
		<h1 id="logo">
			<a href="#">STRIPED</a>
		</h1>

		<!-- Nav -->
		<nav id="nav">
			<ul>
				<li class="current"><a href="gotomain">메인</a></li>
				<li><a href="#">학교가기</a></li>
				<li><a href="gotoinsertroute">루트등록</a></li>
				<li><a href="#">루트공유</a></li>
				<li><a href="#">Contact Me</a></li>
			</ul>
		</nav>


		<section class="box recent-posts">
			<header>
				<h2>마이페이지</h2>
			</header>
			<ul>
				<li><a href="gototimetable">시간표 등록</a></li>
				<li><a href="gotoupdateprofile">개인정보 수정</a></li>
				<li><a href="gotoroutemanager">루트관리</a></li>
				<li><a href="gotocostcal">교통비 가계부</a></li>
				<li><a href="gotomyactivity">활동내역</a></li>
			</ul>
		</section>



		<!-- Copyright -->
		<ul id="copyright">
			<li>&copy; Untitled.</li>
			<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
		</ul>

	</div>

	<!-- Scripts -->
	<script src="my_js/jquery.min.js"></script>
	<script src="my_js/skel.min.js"></script>
	<script src="my_js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="my_js/main.js"></script>
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

	<script type="text/javascript" src="my_timepicker/jquery.timepicker.js"></script>
	<link rel="stylesheet" type="text/css"
		href="my_timepicker/jquery.timepicker.css" />

	<script type="text/javascript"
		src="my_timepicker/lib/bootstrap-datepicker.js"></script>
	<link rel="stylesheet" type="text/css"
		href="my_timepicker/lib/bootstrap-datepicker.css" />

	<script>
		$(function() {
			$('#school_mon').timepicker();
		});
		$(function() {
			$('#school_tue').timepicker();
		});
		$(function() {
			$('#school_wed').timepicker();
		});
		$(function() {
			$('#school_thu').timepicker();
		});
		$(function() {
			$('#school_fri').timepicker();
		});
		$(function() {
			$('#alba_mon').timepicker();
		});
		$(function() {
			$('#alba_tue').timepicker();
		});
		$(function() {
			$('#alba_wed').timepicker();
		});
		$(function() {
			$('#alba_thu').timepicker();
		});
		$(function() {
			$('#alba_fri').timepicker();
		});
		$(function() {
			$('#alba_mon').timepicker();
		});
	</script>
</body>
</html>