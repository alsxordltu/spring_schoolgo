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


</head>
<body>

   <!-- Content -->
   <div id="content">
      <div class="inner">

            <article class="box post post-excerpt">
               <header>
                  <h2 align="center">루트 목록</h2>
                  <p align="center">당신이 등록한 루트들의 목록입니다~ㅇㅅㅇ
                  
               </header>
            </article>
                       
                 
			<form name="routenext" method="get" action="gotogo">
            </form>
            
            <div id=schoolgo>
            
            </div>


<!--          <article id=whether>
            <div>
               <h1>오늘의 날씨 정보 출력 : 집 위치</h1>
            </div>
         </article>-->
<!--          <article id=toeic>
            <div>
               <h1>오늘의 영단어 : 네이버 오늘의영단어</h1>
            </div>
         </article>-->

<!-- 
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
            <div id="map_div"></div>
         </article> -->






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
               <li><a href="gotoadmin">admin</a></li>
            </ul>
         </nav>



         <!-- Recent Posts -->
         <section class="box recent-posts">
            <header>
               <h2>마이페이지</h2>
            </header>
           <ul id="mypageside">
            <li><a href="gototimetable">시간표 등록</a></li>
            <li><a href="gotoupdateprofile">개인정보 수정</a></li>
            <li><a href="gotoroutemanager">루트관리</a></li>
            <li><a href="gotocostcal">교통비 가계부</a></li>
            <li><a href="gotomyactivity">활동내역</a></li>
         </ul>
         
         </section>
         <input type="submit" value="로그아웃">
      </form>

      <ul id="copyright">
         <li>&copy; Untitled.</li>
         <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
      </ul>
   </div>
   

   <script src="main_js/jquery.min.js"></script>
   <script src="main_js/skel.min.js"></script>
   <script src="main_js/util.js"></script>
   <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
   <script src="main_js/main.js"></script>
   <script src="http://code.jquery.com/jquery.js"></script>
   <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
   
   <script>
   
	$('#customtime').timepicker({
		timeFormat : 'HH:mm',
		interval : 30,
		minTime : '0',
		maxTime : '11:30pm',
		defaultTime : '0',
		startTime : '0',
		dynamic : false,
		dropdown : true,
		scrollbar : true
	});
	
	
   var json = ${routes};
   var getTime = ${getTime};
   console.log(json);
   var length = 1;
   var time = "";
   
   function showList(){
        var row="";
        
         $.each(json, function(index, item){      
            
            row+="<div id='div"+ index + "'>"
            +"<input type='button' class='routelist' value='"+ json[index].routeName + "' data-index='"+index+"' data-routeId='"+ json[index].routeId +"' data-totaltime='"+ json[index].time +"' style='width:100%;'>"
            +"<br></div><br> ";
            
         });      
         $("#schoolgo").html(row);
   }
   
   
$(document).ready(function() {
      showList();
   });
   
   
$(document).on("click", ".routelist", function(){
   showList();
   var index = $(this).attr("data-index");
   var calTime = Math.floor(json[index].time / 60);
   var calHour ="";
   var calMin="";
   var info ="";
   
   
   if (calTime >= 60) {
      calHour = Math.floor(calTime / 60) + '시간 ';
    }

   calMin = calTime%60 + '분 ';
   console.log(json[index].startLat);
   console.log(json[index].startLng);
 
   

   var routeStep = json[index].stepList;
   var stepLat = "";
   var stepLng = "";
   
   $.each(routeStep, function(index, item){
	   var vehicleList = item.vehicleList;
	   $.each(vehicleList, function(index, item){
		   if(item.startName != null){
			   stepLat = item.startLat;
			   stepLng = item.startLng;
			   return false;
		   }
	   });
	   if(stepLat != "" && stepLng !=""){
		   return false;
	   }
   });

   var startadd =json[index].startAddress;
   var endadd =json[index].arriveAddress;
   
   
 
   
   var add ="<div id='info'>"
   +"<div id='infostartend'>"
   +"<div id='infostart'>"
   +"<img id='startendimg' src='main_img/start.png' width='10%'/><h6>"+startadd+"</h6></div>"
   +"<div id='infoend'>"
   +"<img id='startendimg' src='main_img/end.png' width='10%'/><h6>"+endadd+"</h6></div></div>"
   +"<div id='infoalltime'>"+calHour + calMin + "소요</div></div>"
   
   
   +"<input id='schoolradio' type='radio' name='radio' class='radio' data-time='"+getTime.school+"'><label for='schoolradio' class='radio-label'><i class='fa fa-check'></i>"
   +"<span>학교가기</span></label>"
   +"<input id='albaradio' type='radio' name='radio' class='radio' data-time='"+getTime.alba+"'><label for='albaradio' class='radio-label'><i class='fa fa-check'></i>"
   +"<span>알바가기</span></label>"
   +"<input id='customradio' type='radio' name='radio' class='radio'><label for='customradio' class='radio-label'><i class='fa fa-check'></i>"
   +"<span>사용자 지정 시간</span></label>"
   
 
 
   
   
   +"<input type='button' class='gotoschool' value='등교'"
   +"data-lat='"+ stepLat+"'" 
   +"data-lng='"+stepLng +"' data-index='"+index+"' data-totaltime='"+$(this).attr("data-totaltime")+"'>"
   +"<input type='button' id='route"+$(this).attr("data-index") + "' class='group' name='group'"
   +"value='삭제' data-routeId='"+$(this).attr("data-routeId")+"'>";
   
   
   $("#div"+index).html($("#div"+index).html() + add);

});

   
$(document).on("click", ".group",  function(){
   
   var row="";
   $.ajax({
      url:"deleteRoute",
      type:"get",
      
      data:{ routeId : ($(this).attr("data-routeId")) },
      contentType: "application/x-www-form-urlencoded; charset=UTF-8",
      success:function(response){
         json = JSON.parse(response);
         console.log(json);
         /* var row="";
         $.each(json, function(index, item){   
            row+="<div id='div"+ index + "'><input type='button' class='routelist' value='"+ json[index].routeName + "'><input type='button' id='routed"+index + "' class='group' name='group' value='삭제' data-routeId='"+ json[index].routeId +"'></div><br> ";         
         }); */
         showList();
         
         
          //location.href='<%=request.getContextPath()%>/gotomain';
      },
       error:function(xhr, status, error){
         console.log(error);
      }
   });
   
   
});
   
      $(function() {
         // Geolocation API에 액세스할 수 있는지를 확인
         if (navigator.geolocation) {
            //위치 정보를 얻기
            navigator.geolocation.getCurrentPosition(function(pos) {
               $('#latitude').html(pos.coords.latitude); // 위도
               $('#longitude').html(pos.coords.longitude); // 경도
               //console.log(pos.coords.latitude, pos.coords.longitude);
            });
         } else {
            alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
         }

      });
      
$(document).on("click", ".gotoschool", function(){
   location.href = "gotogo?lat="+ $(this).attr("data-lat") +"&lng="+$(this).attr("data-lng") + "&index="+$(this).attr("data-index") + "&time="+time + "&totaltime="+$(this).attr("data-totaltime");
         });
         
         
$(document).on("change", ".radio", function(){
	time = $(this).attr("data-time");
	   console.log("seleted time : " + time);
	   
	         });
	                 
         
   </script>

</body>
</html>