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

<script
   src="https://apis.skplanetx.com/tmap/js?version=1&format=javascript&appKey=29d53ec8-b46f-3a50-b122-6bf04dea52e0"></script>
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
            </ul>
         </nav>



         <!-- Recent Posts -->
         <section class="box recent-posts">
            <header>
               <h2>마이페이지</h2>
            </header>
            <ul>
               <li><a href="updateTimetable?id=${userId}">시간표 등록</a></li>
               <li><a href="updateUser?id=${userId}">개인정보 수정</a></li>
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
   <script>
   var json = ${routes};
   console.log(json);
   var length = 1;
   
   function showList(){
        var row="";
        
         $.each(json, function(index, item){      
            
            row+="<div id='div"+ index + "'>"
            +"<input type='button' class='routelist' value='"+ json[index].routeName + "' data-index='"+index+"' data-routeId='"+ json[index].routeId +"' style='width:100%;'>"
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
   
   
   
   
   
   var add ="<div id='info'><div id='infostartend'><img id='startendimg' src='main_img/start.png' width='10%'/><img id='startendimg' src='main_img/end.png' width='10%'/></div>"
	       +"<div id='infoalltime'>"+calHour + calMin + "소요</div></div>"
	   
   
   
   
   
   
   +"<input type='button' class='gotoschool' value='등교'"
   +"data-lat='"+ json[index].startLat+"'" 
   +"data-lng='"+ json[index].startLng +"' data-index='"+index+"'>"
   +"<input type='button' id='route"+$(this).attr("data-index") + "' class='group' name='group'"
   +"value='삭제' data-routeId='"+$(this).attr("data-routeId")+"' >";
   
   
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
   location.href = "gotogo?lat="+ $(this).attr("data-lat") +"&lng="+$(this).attr("data-lng") + "&index="+$(this).attr("data-index");
         });
   </script>

</body>
</html>