<!DOCTYPE HTML>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="gocome_css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body onload="go_time()">

   <!-- Content -->
   <div id="content">
      <div class="inner">

         <!-- Post -->
         <article class="box post post-excerpt">
            <!-- 헤더부분 -->
            <header >
            <h2 align="center"><img src="gocome_img/go1go1.png" width="70%"></h2>
               <p align="center">학교가기 페이지입니다.</p>
            </header>

<div id="transdiv">
            <div id="busarrive">
            </div>
            
            <div id="subwayArrive">
            </div>
</div>   
            
            
        <div id="timediv">
        
           	 
            <div id="curtime"></div>
            
            <div id="curtimesec"></div>
            <br>
             <div id="islate" ></div> 

<!--               <div id="remaintime" ></div>             
              <div id="curremaintime" ></div>                         
 -->            <br>
            <br>
            <br>
            
            <button id="start">시작</button>
            <button id="stop">종료</button>
            <audio id="audio" src=""></audio>
         </div>
            
            
            
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
               <li class="current"><a href="gotomain">학교가기</a></li>
               <li><a href="gotoinsertroute">루트등록</a></li>
               <li><a href="gotoboardmain">루트공유</a></li>
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

      <!-- Copyright -->
      <ul id="copyright">
         <li>&copy; Untitled.</li>
         <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
      </ul>

   </div>

   <!-- Scripts -->
   <script src="gocome_js/jquery.min.js"></script>
   <script src="gocome_js/skel.min.js"></script>
   <script src="gocome_js/util.js"></script>
   <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
   <script src="gocome_js/main.js"></script>
   





</body>
<script src="http://code.jquery.com/jquery.js"></script>
<script>

var islate;
var curremaintime;
$(document).ready(function(){
   var routes = ${routes };
   console.log(routes);
   var routeStep = routes.stepList;
   
   //var busStopList = buslist.response.body.items.item;

   var vehicleListName = "";
   var cityCode="";
   var busStopId="";
   var vehicleNum="";
   var bustime="";
   var stationName="";
   var temp="";
   var busstopname="";
   var subwaystopname="";
   
   var subwayupdown;
   
   
    $.each(routeStep, function(index, item){      
      if(item.vmode == "TRANSIT"){
         var vehicleList = item.vehicleList;
         
         $.each(vehicleList, function(index, item){
            if(item.vehicleType == "BUS" && vehicleNum == ""){
               console.log("버스로 들어옴");
               vehicleListName = item.startName;
               vehicleNum = item.vehicleNum;
               var buslist;
               $.ajax({
                  url:"getStationList",
                  type:"get",
                  
                  data:{ lat : item.startLat,
                     lng : item.startLng
                  },
                  async:false,
                  contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                  success:function(response){
                     buslist = JSON.parse(response);
                  },
                  error:function(xhr, status, error){
                        console.log(error);
                  }
               });
               console.log(buslist);
               var busStopList = buslist.response.body.items.item;
               
               $.each(busStopList, function(index, item){
                  if(item.nodenm == vehicleListName){
                     
                     busStopId = item.nodeid;
                     cityCode = item.citycode;
                     return false;
                  }
               });
               var busArrList;
               $.ajax({
                  url:"getBusList",
                  type:"get",
                  
                  data:{ cityCode : cityCode, 
                        nodeId : busStopId,
                        vehicleNum : vehicleNum
                  },
                  async:false,
                  contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                  success:function(response){
                	  busArrList = JSON.parse(response);
                	  
                	  $.each(busArrList, function(index, item){
                          	busstopname=item.nodenm;
                          
                       });
                	  
                		
                	  
                	  
                	  
                     var busrow ="";
                     busrow+="<div id='businfo'><h5><img id='titleimg' src='gocome_img/bus.png'>"+busstopname+" 정류소</h5><ul>"
                     		+"<li>"
                     		
                     		 +"<span id='bustit'>"
                     		+"<img id='busimg' src='gocome_img/busstop.png'><br><h4>버스</h4>"
                     		+"</span>"
                     		
                     		+"<span id='bustit'>"
                     		+"<img id='busimg' src='gocome_img/marker.png'><br><h4>현재위치</h4>"
                     		+"</span>"
                     		
                     		+"<span id='bustit'>"
                     		+"<img id='busimg' src='gocome_img/hourglass.png'><br><h4>남은시간</h4>"
                     		+"</span>" 
                     		
                     		/* +"<span id='bustit'>"
                     		+"버스"
                     		+"</span>"
                     		
                     		+"<span id='bustit'>"
                     		+"현재위치"
                     		+"</span>"
                     		
                     		+"<span id='bustit'>"
                     		+"남은시간"
                     		+"</span>" */
                     		
                     		
                     		+"</li>";
                     		
                     $.each(busArrList, function(index, item){
                    	 var itemarrtime;
                        if(temp != item.routeno){
                        	
                        	busrow+="<li>"
                        	
                        	+"<span id='bustext'>"
                        	+item.routeno +"번" 
                        	+"</span>"
                        	
                        	
                        	+"<span id='bustext'>"
                        	+item.arrprevstationcnt + "개 전"
                        	+"</span>";
                        	
                        	itemarrtime = Math.ceil((item.arrtime/60));
                        	/* 올림 처리 */
                        	if(itemarrtime==0||itemarrtime==1){
                        		busrow+="<span id='bustext'>"
                                	+"잠시 후 도착" 
                                	+"</span>"
                        		
                        	}else{
                        		busrow+="<span id='bustext'>"
                        			+itemarrtime+ "분 남음" 
                        			+"</span>"
                        	}
                        	
                        	+"</li>"
                        	temp = item.routeno;
                        	/* 정류소명 : " + item.nodenm */
                        	
                        }
                        
                        
                     });
                     busrow+="</ul></div>"
                     $("#busarrive").html(busrow);   
                     
                  },
                   error:function(xhr, status, error){
                     console.log(error);
                  }
               });
               console.log(busArrList);
               
            }
            
            
            if(item.vehicleType == "SUBWAY" && stationName == ""){
               console.log("지하철로 들어옴");
               stationName = item.startName;
               var subwayList;
               var subwayArrList;
               $.ajax({
                  url:"getSubwayArrive",
                  type:"get",
                  
                  data:{   
                     stationName : stationName
                  },
                  
                  async:false,
                  contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                  success:function(response){
                	  subwayList = JSON.parse(response);
                	  subwayArrList = subwayList.realtimeArrivalList;
                     console.log(subwayArrList);
                     
                     
                     /* 역명 빼오기 위해  */
                     $.each(subwayArrList, function(index, item){
                    	 subwaystopname=item.statnNm;
                  });
                     
                     
                     console.log(subwaystopname);
                     
                     var subwayinforow="";
                     var subwayuprow ="";
                     var subwaydownrow ="";
                     
                     subwayinforow+="<div id='subwayinfo'><h5><img id='titleimg' src='gocome_img/subway.png'>"+subwaystopname+"역</h5>"
                     
                     subwayuprow+="<div id='subup'><ul>"
                     +"<li>"
              		 +"<span id='subtit'><img id='subwayimg' src='gocome_img/upline.png'><br><h4>행선지</h4></span>"
              	 	 +"<span id='subtit'><img id='busimg' src='gocome_img/marker.png'><br><h4>현재위치</h4></span>"
              	     +"</li>";
              	     
              	     subwaydownrow+="<div id='subdown'><ul>"
                     +"<li>"
            		 +"<span id='subtit'><img id='subwayimg' src='gocome_img/downline.png'><br><h4>행선지</h4></span>"
            	 	 +"<span id='subtit'><img id='busimg' src='gocome_img/marker.png'><br><h4>현재위치</h4></span>"
            	     +"</li>";
            	     
              	     
              	     
              		
                     $.each(subwayArrList, function(index, item){
                    	 subwayupdown=item.updnLine;
                     
                    	 if(subwayupdown=="상행"){
                    		 
                    		 subwayuprow+="<li>"
                          	
                          	+"<span id='subtext'>"
                          	+item.bstatnNm
                          	+"</span>"
                          	
                          	+"<span id='subtext'>"
                          	+item.arvlMsg2
                          	+"</span>"
                          	
                          
                          	
                          	+"</li>"
                          	}else{
                          		
                          		subwaydownrow+="<li>"
                              	+"<span id='subtext'>"
                              	+item.bstatnNm
                              	+"</span>"
                              	
                              	+"<span id='subtext'>"
                              	+item.arvlMsg2
                              	+"</span>"
                              	
                              
                              	
                              	+"</li>"
                          	}
                    	 
                    	 
                    	 	
                         	
                         	
                         	
                         	
                     });
                     
                     subwayinforow+="</div>"
                     subwayuprow+="</ul></div>"
                     subwaydownrow+="</ul></div>"
                     $("#subwayArrive").html(subwayinforow+subwayuprow+subwaydownrow);   
                     
                  },
                   error:function(xhr, status, error){
                     console.log(error);
                  }
               });
               
            }
         });
      }
      
      if(vehicleListName != "" && stationName != ""){
         
         return false;
      }
      
   });    
   
   



});

/* $(document).on("click", "#select", function(e){
   
   document.all.selcitycode.value = $(this).attr("data-citycode");
   document.all.selnodeid.value = $(this).attr("data-nodeid");
   var row = "";
   $("#info").html(row);
}); */

////////////////////////음성출력테스트/////////////////////////////////////////


var current=0;
var timeoutId=0;
   $("#start").on("click", function(){
      timeout();
   });

   var current=0;
   var timeoutId=0;
      $("#start").on("click", function(){
         timeout();
      });
   
   function timeout(){
	timeoutId = setTimeout(function() {
			var filename = "pororiya.mp3";
			$("#audio").attr("src", "gocome_voice/" + filename);
			
			var audio = document.querySelector("#audio");
			
			audio.loop = false;
			audio.play();
			current++;
			timeout();
		}, 1000 * 5);

	}


	$("#stop").on("click", function() {
		clearTimeout(timeoutId);
		alert("알람 종료됨.");

	});

	///////////실시간출력
	function go_time() {
		//////////////////현재시간
		
		var resultString = "${calTimeResultMessage}";
		
		$("#islate").html("${calTimeResultMessage}");
		islate = "${calTimeResultMessage}";
		var now = new Date();

		var nowhour = now.getHours(); //현재 시
		var nowmin = now.getMinutes(); //현재 분
		var nowsec = now.getSeconds(); //현재 초
		
		var hourpersec = nowhour * 3600; //현재 시->초 변환
		var minpersec = nowmin * 60; //현재 분->초 변환
		var nowtotalsec = hourpersec + minpersec + nowsec;
		
		var tabletime = "${time}";
		
		
		
		var timerow="";
		var hh1;
		var mm1;
		var ss1;
		var hh2;
		var mm2;
		var necessarygotime;
		var hh3
		var mm3
		

			//               ---------D 총소요시간----
			// 	현재시간(18:17)            출발전시간         소요시간(4367)  도착시간(23:30)
			//       A                   E                B               C   
			// A+B>C -> A+B-C>0 지각
			// C-A=D(총소요시간)
			// C-A-B : E 출발전시간(준비시간)-> 5분전,10분전...알림
			
			
			var tabletime = "${time}";
			var duringtime = "${totaltime}";

			var tableTimeslice = tabletime.substring(0, 2);//"23"
			
			/* 빼다쓸라고 만든 것 */
			hh2=tableTimeslice;
			
			
			tableTimeslice *= 1;
			var tableTimesec = tableTimeslice *= 3600; // 초로바꿈
			//분->초
			
			var tableTimeslice2 = tabletime.substring(3, 5);//"30"
			
			
			/* 빼다쓸라고 만든 것 */
			mm2=tableTimeslice2;
			
			
			tableTimeslice2 *= 1;
			var tableTimesec2 = tableTimeslice2 *= 60;// 초로바꿈

			var tableTimesec3 = tableTimesec + tableTimesec2;
	/////////////////////////////////////////////////////////////////		
			/*출발까지 남은 시간 ::-> 도착해야하는 시간 - 현재시간 - 소요시간 */
			curremaintime = tableTimesec3- nowtotalsec - duringtime;
			
			/*출발해야 하는 시간 ::-> 도착해야하는 시간 -소요시간 */
			necessarygotime = tableTimesec3 - duringtime;
			console.log(duringtime);
			console.log(tableTimesec3);
			
			
			/* 시 */
			hh3= Math.floor(necessarygotime/3600);
			
			if(hh3<0){
				hh3+=12;
			}
			
			/* 분 */
			mm3=Math.floor(necessarygotime%3600/60)
			if(mm3<0){
				mm3+=60;
			}
	/////////////////////////////////////////////////////////////////
			//setTimeout("secdec(curremaintime)", 1000);


			
			
			
			/* 시 */
			hh1= Math.floor(curremaintime/3600);
			
			/* 분 */
			mm1=Math.floor(curremaintime%3600/60)
			
			/* 초 */
			ss1=(curremaintime%3600%60)

			

		
		

		if (curremaintime == 900) {
			timeout();
		}
		if (curremaintime == 600) {
			timeout();
		}
		if (curremaintime == 300) {
			timeout();
		}

		/////////////////////출발까지 남은 시간 구하는 서비스 가져오기(리턴타입 int 초)
		/*  if(starttime==1){
		 document.getElementById("starttime").innerHTML 
		 = starttime;
		 var remaintime = "지각입니다.";
		
		 document.getElementById("remaintimemove").innerHTML 
		 = remaintime;
		 }else{
		 var remaintime = starttime-nowtotalsec;
		 document.getElementById("remaintimemove").innerHTML 
		 = remaintime;
		 }
		 */

		/* 
		 remainhours = remaintime / 3600;//시 
		 remainminute = remaintime % 3600 / 60;//분
		 remainsecond = remaintime % 3600 % 60;//마지막 남은 시간에서 분을 뺀 나머지 시간을 초로 계산함 

		 stringremaintime = "지각입니다.";
		 document.getElementById("stringremaintime").innerHTML 
		 = stringremaintime;
		 }else{
		 var stringremaintime = remainhours + ":" + remainminute + ":" + remainsecond;
		 document.getElementById("stringremaintime").innerHTML 
		 = stringremaintime;
		 }
		 */

		 timerow+="<div id='nowtimediv'><ul>"
				timerow+="<li>"
				
				
				/* 현재시간 */
				timerow+="<span id='timetit'>"
				timerow+="<h4>현재시간 : </h4>"
				timerow+="</span>"
				
				timerow+="<span id='timetext'>"
				timerow+="<h4>"+nowhour+"시"+nowmin+"분"+nowsec+"초</h4>"
				timerow+="</span>"
				
				timerow+="</li>"
				
				
				/* 도착해야하는시간 */
				timerow+="<li>"
				timerow+="<span id='timetit'>"
				timerow+="<h4>도착해야 하는 시간 : </h4>"
				timerow+="</span>"
								
				timerow+="<span id='timetext'>"
				timerow+="<h4>"+hh2+"시"+mm2+"분</h4>"
				timerow+="</span>"
				timerow+="</li>"
				
				
				/* 집에서 나와야 하는 시간 */
				timerow+="<li>"
				timerow+="<span id='timetit'>"
				timerow+="<h4>출발해야 하는 시간  : </h4>"
				timerow+="</span>"
												
				timerow+="<span id='timetext'>"
				timerow+="<h4>"+hh3+"시"+mm3+"분</h4>"
				timerow+="</span>"
				timerow+="</li>"
				
				
				/* 남은 시간 */
				timerow+="<li>"
				timerow+="<span id='timetit'>"
				timerow+="<h4>출발까지 남은 시간  : </h4>"
				timerow+="</span>"
										
				timerow+="<span id='timetext'>"
				timerow+="<h4>"+hh1+"시간"+mm1+"분"+ss1+"초</h4>"
				timerow+="</span>"
				timerow+="</li>"
			
				timerow+="</ul></div>"
				
				$("#curtime").html(timerow);
		 
		 

		 
		///////////////////////////////////출발 몇초 전인지 계산(B-A)
		 
		 
		/* setTimeout("go_time()", 1000);  */
		
		
		//1초마다 해당 펑션을 실행함.
	}
</script>
</html>