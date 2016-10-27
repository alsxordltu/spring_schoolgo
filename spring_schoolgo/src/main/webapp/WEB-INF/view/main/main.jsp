<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="main_css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

<script src="https://apis.skplanetx.com/tmap/js?version=1&format=javascript&appKey=29d53ec8-b46f-3a50-b122-6bf04dea52e0"></script>
		<script type="text/javascript">
 
            var map;
            var mapW, mapH;     // 지도의 가로, 세로 크기(Pixel단위) 를 지정 합니다. 
            var cLonLat, zoom;      //중심 좌표와 지도레벨을 정의 합니다. 
             
           
             
            function initTmap(){
                centerLL = new Tmap.LonLat(14145677.4, 4511257.6);
                map = new Tmap.Map({div:'map_div',
                                    width:'100%', 
                                    height:'400px',
                                    transitionEffect:"resize",
                                    animation:true
                                }); 
                searchRoute();
            };
          //경로 정보 로드
            function searchRoute(){
                var routeFormat = new Tmap.Format.KML({extractStyles:true, extractAttributes:true});
                var startX = 14129105.461214;
                var startY = 4517042.1926406;
                var endX = 14136027.789587;
                var endY = 4517572.4745242;
                var startName = "홍대입구";
                var endName = "명동";
                var urlStr = "https://apis.skplanetx.com/tmap/routes/pedestrian?version=1&format=xml";
                    urlStr += "&startX="+startX;
                    urlStr += "&startY="+startY;
                    urlStr += "&endX="+endX;
                    urlStr += "&endY="+endY;
                    urlStr += "&startName="+encodeURIComponent(startName);
                    urlStr += "&endName="+encodeURIComponent(endName);
                    urlStr += "&appKey=29d53ec8-b46f-3a50-b122-6bf04dea52e0";
                var prtcl = new Tmap.Protocol.HTTP({
                                                    url: urlStr,
                                                    format:routeFormat
                                                    });
                var routeLayer = new Tmap.Layer.Vector("route", {protocol:prtcl, strategies:[new Tmap.Strategy.Fixed()]});
                routeLayer.events.register("featuresadded", routeLayer, onDrawnFeatures);
                map.addLayer(routeLayer);
            }
          
          //경로 그리기 후 해당영역으로 줌
            function onDrawnFeatures(e){
                map.zoomToExtent(this.getDataExtent());
            }



        </script>


</head>
<body onload="initTmap()">
${routes}
	<!-- Content -->
	<div id="content">
		<div class="inner">
			<!-- Post -->
			<article class="box post post-excerpt">

				<div id=schoolgo>
				
					
				</div>

			</article>



			<article id=whether >
				<div>
					<h1>오늘의 날씨 정보 출력 : 집 위치</h1>

				</div>
			</article>



			<article id=toeic>
				<div>
					<h1>오늘의 영단어 : 네이버 오늘의영단어</h1>

				</div>
			</article>



			<article>
				<span class="image"> <img src="main_img/pic04.jpg" alt="" />
				</span>
				<header class="major">
					<h3>
						<a href="landing.html" class="link">Ipsum</a>
					</h3>
					<p>Nisl sed aliquam</p>
				</header>
			</article>



			<article>
				<div id="map_div">
        </div>  
			</article>






			<!-- Post -->
			<article class="box post post-excerpt">
				<header> </header>

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
			<h5 style="text-align: center">${nickName}님환영합니다</h5>


		<!-- Nav -->
		<nav id="nav">
			<ul>
				<li class="current"><a href="gotomain">학교가기</a></li>
				<li><a href="gotoinsertroute">루트등록</a></li>
				<li><a href="gotoboardmain">루트공유</a></li>
				<li><a href="#">Contact Me</a></li>
			</ul>
		</nav>



			<!-- Recent Posts -->
			<section class="box recent-posts">
				<header>
					<h2>마이페이지</h2>
				</header>
				<ul>
					<li><a href="gototimetable">시간표 등록</a></li>
					<li><a href="updateUser?id=${userId}">개인정보 수정</a></li>
					<li><a href="gotoroutemanager">루트관리</a></li>
					<li><a href="gotocostcal">교통비 가계부</a></li>
					<li><a href="gotomyactivity">활동내역</a></li>
				</ul>
			</section>
			<input type="submit" value="로그아웃">
		</form>

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
			<li>&copy; Untitled.</li>
			<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
		</ul>
		
		
		

	</div>

	<!-- Scripts -->
	<script src="main_js/jquery.min.js"></script>
	<script src="main_js/skel.min.js"></script>
	<script src="main_js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="main_js/main.js"></script>
	<script>
		$(function() {
			// Geolocation API에 액세스할 수 있는지를 확인
			if (navigator.geolocation) {
				//위치 정보를 얻기
				navigator.geolocation.getCurrentPosition(function(pos) {
					$('#latitude').html(pos.coords.latitude); // 위도
					$('#longitude').html(pos.coords.longitude); // 경도
					console.log(pos.coords.latitude, pos.coords.longitude);
				});
			} else {
				alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
			}

		});
		
		$(document).ready(function(){
			$.ajax({
				url:"getroutelist",
				type:"get",
				data : {
	                   "userId" : <%=session.getAttribute("userId")%>
	            },
				success:function(data){
					alert("성공");
				},
	            error:function(xhr, statusTxt, errThrown){
	            	alert("실패", errThrown)	;
	            }
			});
		});
		
		

		/*    window.onload = function() {
		    printTime();
		  }; */
	</script>







</body>







</html>