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
		<a href='gotomain'><img src="gocome_img/gogo.png" alt=""
			width="300"></a>
	</div>

	<div id="wrapper">

		<nav id="nav" class="navtable" style="display: block;">
			<div style="float: left; width: 220px; height: 100px"></div>
			<a id="animate"><i class="icon fa-plus-circle fa-lg">Insert</i></a>
		</nav>

		<!-- Main -->
		<div id="main">

			<!-- Me -->
			<article id="me" class="panel"
				style="padding: 50px 100px 50px 100px;">
				<div id="top" style="height: 50px;">
					<h1 align=center>등교하기</h1>
				</div>

				<div id="gogo1" style="height: 30px;">
					<h5>출발할 때 버튼을 눌러주세요</h5>
				</div>


				<div id="gogo2"
					style="height: 200px; width: 700px; padding-top: 50px; border: 3pt solid black;">

					<h6>
						현재 시간 : <span id="clock"></span>
					</h6>
					<br>
					<h5>
						도착해야 하는 시간 : <span id="arrivetime"></span> <br> 남은 시간 : <span
							id="remaintime"></span>
					</h5>
				</div>



				<div id="bottom" style="height: 50px;">
					<a href='gotomain'><input type="button" value="출발하기" style="margin: 20px 0 0 290px"></a>
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
		
					function printTime() {
					now = new Date(); 
					
					//디데이 설정하기, (년, 월, 일, 시, 분, 초)
					dday = new Date(2016,10,14,18,00,00);  
					
					
					//날자 계산해줌
					days = (dday - now) / 1000 / 60 / 60 / 24; 
					dRound = Math.floor(days); 
					
					//시간 계산해줌
					hours = (dday - now) / 1000 / 60 / 60 - (24 * dRound); 
					hRound = Math.floor(hours); 
					
					//분 계산해줌
					minutes = (dday - now) / 1000 /60 - (24 * 60 * dRound) - (60 * hRound); 
					mRound = Math.floor(minutes); 
					
					//초 계산해줌
					seconds = (dday - now) / 1000 - (24 * 60 * 60 * dRound) - (60 * 60 * hRound) - (60 * mRound); 
					sRound = Math.round(seconds); 
					
					
					//1초마다 함수호출
				    setTimeout("printTime()", 1000);
				    
					//현재시간 clock에 담아 보내기
				    var clock = document.getElementById("clock");
				    
 				 	if(now.getHours()<=12){
				    	
 				 		clock.innerHTML =  
 				 			 "AM " + 
 						      now.getHours() + "시 " +
 						      now.getMinutes() + "분 " +
 						      now.getSeconds() + "초";
				   }else{
					   
					   clock.innerHTML =  
						   "PM " + 
						      (now.getHours()- 12) + "시 " +
						      now.getMinutes() + "분 " +
						      now.getSeconds() + "초";
					   
				   } 
				    
				    //디데이 시간 arrivetime에 담아 보내기
				    var arrivetime = document.getElementById("arrivetime");
				   
				    
				    
 					if(dday.getHours()<=12){
 						 arrivetime.innerHTML = 
 							 "AM " + 
 					    	dday.getHours() + "시 " +
 					    	dday.getMinutes() + "분 " +
 					    	dday.getSeconds() + "초";
 						 
				   }else{
					   arrivetime.innerHTML = 
							 "PM " + 
					    	(dday.getHours() - 12)  + "시 " +
					    	dday.getMinutes() + "분 " +
					    	dday.getSeconds() + "초";
					   
				   }
 					
				    //현재시간에서 디데이까지 남은시간 담아서 보내기
				    var remaintime = document.getElementById("remaintime")

				    	remaintime.innerHTML = 
				    	hRound + "시간  " +
				    	mRound+ "분  " +
				    	sRound + "초";
			
					   
				    
				    
				 /* document.getElementById("hour").innerHTML = hRound; 
				    document.getElementById("min").innerHTML = mRound; 
				    document.getElementById("sec").innerHTML = sRound; 
				*/
				  
				  };
				 
				  // 창이뜨면, html이 로딩되면 함수 호출
				  window.onload = function() {
				    printTime();
				  };
				 
				  
				  
			</script>



</body>
</html>