<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML>

<!--
	Striped by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="my_css/main.css" />
<link rel="stylesheet" href="my_css/form.css" />
	<head>
		<title>Striped by HTML5 UP</title> 
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="my_css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body>

		<!-- Content -->
			<div id="content">
				<div class="inner">

	
	<div id="wrapper">



		<!-- Main -->
		<div id="main">

			<!-- Me -->
			<article id="me" class="panel"
				style="padding: 50px 100px 50px 100px;">

				<div style="height: 1000px;">

					개인정보수정
					<sform:form method="post" action="updateUser" modelAttribute="user">
						<div class="field">
						userId(변경불가)
							<sform:input path="userId" placeholder="Id" readonly="true" />
							<sform:errors element="span" path="userId"></sform:errors>
				
						</div>
						<div class="field">
							pass
							<sform:input type="password" path="pass" placeholder="Pass" />
							<sform:errors element="span" path="pass"></sform:errors>
							<!-- 	<input type="text" name="pass" id="pass" placeholder="Pass" />
							 -->
						</div>
						<div class="field">
							userName
							<sform:input path="userName" placeholder="Name" />
							<sform:errors element="span" path="userName"></sform:errors>
							<!-- 								<input type="text" name="userName" id="userNane" placeholder="Name" />
 -->
						</div>
						<div class="field">
							nickName
							<sform:input path="nickName" placeholder="Nickname" />
							<sform:errors element="span" path="nickName"></sform:errors>
							<!-- 								<input type="text" name="nickName" id="nickName" placeholder="Nickname" />
 -->
						</div>
						<div class="field">
							email
							<sform:input type="email" path="email" placeholder="Email" />
							<sform:errors element="span" path="email"></sform:errors>
							<!-- 								<input type="email" name="email" id="email" placeholder="Email" />
 -->
						</div>
						<div class="field">
							phoneNum
							<sform:input type="text" path="phoneNum" placeholder="Phone" />
							<sform:errors element="span" path="phoneNum"></sform:errors>
						</div>
						<div>
							<input type="submit" value="수정하기" >
							<input type="button" onclick="location.href='gotomain#mypage'"
								value="마이페이지로">
							<input type="button" onclick="location.href='deleteUser?id=${userId}'"
								value="회원탈퇴">
						</div>
					</sform:form>

				</div>
				<br>

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
				left : 145
			/* top:-140 */
			});
		});
	</script>
					
					
					
					
					
					

					<!-- Pagination -->
						<div class="pagination">
							<!--<a href="#" class="button previous">Previous Page</a>-->
							<div class="pages">
								<a href="#" class="active">1</a>
								<a href="#">2</a>
								<a href="#">3</a>
								<a href="#">4</a>
								<span>&hellip;</span>
								<a href="#">20</a>
							</div>
							<a href="#" class="button next">Next Page</a>
						</div>

				</div>
			</div>

		<!-- Sidebar -->
			<div id="sidebar">

				<!-- Logo -->
					<h1 id="logo"><a href="#">STRIPED</a></h1>
 <form name="logout" action="logout">
         <h5 style="text-align: center">${nickName}님환영합니다</h5>
         <input type="submit" value="로그아웃">
 </form>
				<!-- Nav -->
					<nav id="nav">
            <ul>
               <li class="current"><a href="gotomain">학교가기</a></li>
               <li><a href="gotoinsertroute">루트등록</a></li>
               <li><a href="gotoboardmain">루트공유</a></li>
               <li><a href="#">Contact Me</a></li>
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
            <li><a href="gotoroutemanager">루트관리</a></li>
            <li><a href="gotocostcal">교통비 가계부</a></li>
            <li><a href="gotomyactivity">활동내역</a></li>
         </ul>
         
					</section>

				<!-- Recent Comments -->
				<!-- 	<section class="box recent-comments">
						<header>
							<h2>Recent Comments</h2>
						</header>
						<ul>
							<li>case on <a href="#">Lorem ipsum dolor</a></li>
							<li>molly on <a href="#">Sed dolore magna</a></li>
							<li>case on <a href="#">Sed dolore magna</a></li>
						</ul>
					</section> -->

				<!-- Calendar -->
					<!-- <section class="box calendar">
						<div class="inner">
							<table>
								<caption>July 2014</caption>
								<thead>
									<tr>
										<th scope="col" title="Monday">M</th>
										<th scope="col" title="Tuesday">T</th>
										<th scope="col" title="Wednesday">W</th>
										<th scope="col" title="Thursday">T</th>
										<th scope="col" title="Friday">F</th>
										<th scope="col" title="Saturday">S</th>
										<th scope="col" title="Sunday">S</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="4" class="pad"><span>&nbsp;</span></td>
										<td><span>1</span></td>
										<td><span>2</span></td>
										<td><span>3</span></td>
									</tr>
									<tr>
										<td><span>4</span></td>
										<td><span>5</span></td>
										<td><a href="#">6</a></td>
										<td><span>7</span></td>
										<td><span>8</span></td>
										<td><span>9</span></td>
										<td><a href="#">10</a></td>
									</tr>
									<tr>
										<td><span>11</span></td>
										<td><span>12</span></td>
										<td><span>13</span></td>
										<td class="today"><a href="#">14</a></td>
										<td><span>15</span></td>
										<td><span>16</span></td>
										<td><span>17</span></td>
									</tr>
									<tr>
										<td><span>18</span></td>
										<td><span>19</span></td>
										<td><span>20</span></td>
										<td><span>21</span></td>
										<td><span>22</span></td>
										<td><a href="#">23</a></td>
										<td><span>24</span></td>
									</tr>
									<tr>
										<td><a href="#">25</a></td>
										<td><span>26</span></td>
										<td><span>27</span></td>
										<td><span>28</span></td>
										<td class="pad" colspan="3"><span>&nbsp;</span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</section> -->

				<!-- Copyright -->
					<ul id="copyright">
						<li>&copy; Untitled.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>

			</div>

		<!-- Scripts -->
			<script src="main_js/jquery.min.js"></script>
			<script src="main_js/skel.min.js"></script>
			<script src="main_js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="main_js/main.js"></script>

	</body>
</html>