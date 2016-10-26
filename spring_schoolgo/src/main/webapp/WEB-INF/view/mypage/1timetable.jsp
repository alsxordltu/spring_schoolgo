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
		<link rel="stylesheet" href="my_css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body>

		<!-- Content -->
			<div id="content">
				<div class="inner">

					<!-- Post -->
						<article class="box post post-excerpt">
							<header>
								
								<!-- 아티클 제목 -->
								<h2><a href="#">시간표 등록하자</a></h2>
								<p>빠른 시일내에 완성하겟슴다</p>
							</header>
						</article>

					<!-- Post -->
						<article>

				<div id=timetable>
					<table border="1">
						<tr>
							<th style="padding: 0 35px 15px 0;"><h6>월</h6></th>
							<th style="padding: 0 35px 15px 0;"><h6>화</h6></th>
							<th style="padding: 0 35px 15px 0;"><h6>수</h6></th>
							<th style="padding: 0 35px 15px 0;"><h6>목</h6></th>
							<th style="padding: 0 35px 15px 0;"><h6>금</h6></th>

						</tr>
						
						<tr>

							<td>
								<input id="mon1" name="mon" type="radio" class="radio">
									<label for="mon1" class="radio-label">
										<i class="fa fa-check"></i> <span>1교시</span>
									</label>
							</td>

							<td><input id="tue1" name="tue" type="radio" class="radio">
								<label for="tue1" class="radio-label"> 
								<i class="fa fa-check"></i> <span>1교시</span>
							</label></td>


							<td><input id="wed1" name="wed" type="radio" class="radio">
								<label for="wed1" class="radio-label"> 
								<i class="fa fa-check"></i> <span>1교시</span>
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

						<tr>

							<td><input id="mon3" name="mon" type="radio" class="radio">
								<label for="mon3" class="radio-label"> <i
									class="fa fa-check"></i> <span>3교시</span>
							</label></td>

							<td><input id="tue3" name="tue" type="radio" class="radio">
								<label for="tue3" class="radio-label"> <i
									class="fa fa-check"></i> <span>3교시</span>
							</label></td>

							<td><input id="wed3" name="wed" type="radio" class="radio">
								<label for="wed3" class="radio-label"> <i
									class="fa fa-check"></i> <span>3교시</span>
							</label></td>

							<td><input id="thu3" name="thu" type="radio" class="radio">
								<label for="thu3" class="radio-label"> <i
									class="fa fa-check"></i> <span>3교시</span>
							</label></td>

							<td><input id="fri3" name="fri" type="radio" class="radio">
								<label for="fri3" class="radio-label"> <i
									class="fa fa-check"></i> <span>3교시</span>
							</label></td>
						</tr>

						<tr>

							<td><input id="mon4" name="mon" type="radio" class="radio">
								<label for="mon4" class="radio-label"> <i
									class="fa fa-check"></i> <span>4교시</span>
							</label></td>

							<td><input id="tue4" name="tue" type="radio" class="radio">
								<label for="tue4" class="radio-label"> <i
									class="fa fa-check"></i> <span>4교시</span>
							</label></td>

							<td><input id="wed4" name="wed" type="radio" class="radio">
								<label for="wed4" class="radio-label"> <i
									class="fa fa-check"></i> <span>4교시</span>
							</label></td>

							<td><input id="thu4" name="thu" type="radio" class="radio">
								<label for="thu4" class="radio-label"> <i
									class="fa fa-check"></i> <span>4교시</span>
							</label></td>

							<td><input id="fri4" name="fri" type="radio" class="radio">
								<label for="fri4" class="radio-label"> <i
									class="fa fa-check"></i> <span>4교시</span>
							</label></td>
						</tr>

						<tr>

							<td><input id="mon5" name="mon" type="radio" class="radio">
								<label for="mon5" class="radio-label"> <i
									class="fa fa-check"></i> <span>5교시</span>
							</label></td>

							<td><input id="tue5" name="tue" type="radio" class="radio">
								<label for="tue5" class="radio-label"> <i
									class="fa fa-check"></i> <span>5교시</span>
							</label></td>

							<td><input id="wed5" name="wed" type="radio" class="radio">
								<label for="wed5" class="radio-label"> <i
									class="fa fa-check"></i> <span>5교시</span>
							</label></td>

							<td><input id="thu5" name="thu" type="radio" class="radio">
								<label for="thu5" class="radio-label"> <i
									class="fa fa-check"></i> <span>5교시</span>
							</label></td>

							<td><input id="fri5" name="fri" type="radio" class="radio">
								<label for="fri5" class="radio-label"> <i
									class="fa fa-check"></i> <span>5교시</span>
							</label></td>
						</tr>

						<tr>

							<td><input id="mon6" name="mon" type="radio" class="radio">
								<label for="mon6" class="radio-label"> <i
									class="fa fa-check"></i> <span>6교시</span>
							</label></td>

							<td><input id="tue6" name="tue" type="radio" class="radio">
								<label for="tue6" class="radio-label"> <i
									class="fa fa-check"></i> <span>6교시</span>
							</label></td>

							<td><input id="wed6" name="wed" type="radio" class="radio">
								<label for="wed6" class="radio-label"> <i
									class="fa fa-check"></i> <span>6교시</span>
							</label></td>

							<td><input id="thu6" name="thu" type="radio" class="radio">
								<label for="thu6" class="radio-label"> <i
									class="fa fa-check"></i> <span>6교시</span>
							</label></td>

							<td><input id="fri6" name="fri" type="radio" class="radio">
								<label for="fri6" class="radio-label"> <i
									class="fa fa-check"></i> <span>6교시</span>
							</label></td>
						</tr>

						<tr>

							<td><input id="mon7" name="mon" type="radio" class="radio">
								<label for="mon7" class="radio-label"> <i
									class="fa fa-check"></i> <span>7교시</span>
							</label></td>

							<td><input id="tue7" name="tue" type="radio" class="radio">
								<label for="tue7" class="radio-label"> <i
									class="fa fa-check"></i> <span>7교시</span>
							</label></td>

							<td><input id="wed7" name="wed" type="radio" class="radio">
								<label for="wed7" class="radio-label"> <i
									class="fa fa-check"></i> <span>7교시</span>
							</label></td>

							<td><input id="thu7" name="thu" type="radio" class="radio">
								<label for="thu7" class="radio-label"> <i
									class="fa fa-check"></i> <span>7교시</span>
							</label></td>

							<td><input id="fri7" name="fri" type="radio" class="radio">
								<label for="fri7" class="radio-label"> <i
									class="fa fa-check"></i> <span>7교시</span>
							</label></td>
						</tr>

						<tr>

							<td><input id="mon8" name="mon" type="radio" class="radio">
								<label for="mon8" class="radio-label"> <i
									class="fa fa-check"></i> <span>8교시</span>
							</label></td>

							<td><input id="tue8" name="tue" type="radio" class="radio">
								<label for="tue8" class="radio-label"> <i
									class="fa fa-check"></i> <span>8교시</span>
							</label></td>

							<td><input id="wed8" name="wed" type="radio" class="radio">
								<label for="wed8" class="radio-label"> <i
									class="fa fa-check"></i> <span>8교시</span>
							</label></td>

							<td><input id="thu8" name="thu" type="radio" class="radio">
								<label for="thu8" class="radio-label"> <i
									class="fa fa-check"></i> <span>8교시</span>
							</label></td>

							<td><input id="fri8" name="fri" type="radio" class="radio">
								<label for="fri8" class="radio-label"> <i
									class="fa fa-check"></i> <span>8교시</span>
							</label></td>
						</tr>
					</table>
				</div>
				
				
<div class="wrap">
  <input name="radio" type="radio" id="radio0" class="radio" checked="">
  <label for="radio0" class="radio-label">
    <i class="fa fa-check"></i>
    <span>라디오버튼1</span>
  </label>
  <input name="radio" type="radio" id="radio1" class="radio">
  <label for="radio1" class="radio-label">
    <i class="fa fa-check"></i>
    <span>라디오버튼2</span>
  </label>
</div>


				<div id=btndiv>

					<div style="margin: 0 0 0 200px; float: left;">
						<a href='gotomain#mypage'><input type="button" value="저장하기"></a>
					</div>

					<div style="margin: 0 0 0 20px; float: left;">
						<a href='gotomain#mypage'><input type="button" value="돌아가기"></a>
					</div>

				</div>


			</article>

					

				</div>
			</div>

		<!-- Sidebar -->
			<div id="sidebar">

				<!-- Logo -->
					<h1 id="logo"><a href="#">STRIPED</a></h1>

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

				<!-- Search -->
					<!-- <section class="box search">
						<form method="post" action="#">
							<input type="text" class="text" name="search" placeholder="Search" />
						</form>
					</section> -->

				<!-- Text -->
					<!-- <section class="box text-style1">
						<div class="inner">
							<p>
								<strong>Striped:</strong> A free and fully responsive HTML5 site
								template designed by <a href="http://twitter.com/ajlkn">AJ</a> for <a href="http://html5up.net/">HTML5 UP</a>
							</p>
						</div>
					</section> -->

				<!-- Recent Posts -->
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