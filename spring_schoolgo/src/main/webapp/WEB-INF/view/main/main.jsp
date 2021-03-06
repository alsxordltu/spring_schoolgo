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
<title>루트 목록</title>
<link rel="shortcut icon" type="image/x-icon" href="main_img/titleicon.ico" />
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
                  <h2 align="center"><img src="main_img/routelist.png" width="70%"></h2>
                  <p align="center">당신이 등록한 루트들의 목록입니다.
                  <a id="kakao-link-btn" href="javascript:;"></a>
               </header>
            </article>
                       
                 
         <form name="routenext" method="get" action="gotogo">
            </form>
            
            <div id=schoolgo>
            
            </div>

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
        <div id="userinfodiv"> 
        <h5 id="welcomemsg">${nickName}님환영합니다!</h5>
        
		<input id="logoutbtn" type="submit" value="로그아웃">
 		</div>
      </form>

         <!-- Nav -->
         <nav id="nav">
            <ul>
               <li class="current"><a href="gotomain">학교가기</a></li>
               <li><a href="gotoinsertroute">루트등록</a></li>
               <li><a href="gotocontact">Contact Us</a></li>
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
         </ul>
         
         </section>
        

      <ul id="copyright">
         <li>&copy; Six Company.</li>
         <li>Kongju Univ.<br> Computer Engineering</a></li>
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
   console.log(getTime);
   var length = 1;
   var time = "";
  
   function showList(){
        var row="";
        var indexCount = -1;
         $.each(json, function(index, item){      
        	indexCount = index;
            row+="<div id='div"+ index + "'>"
            +"<input type='button' class='routelist' value='"+ json[index].routeName + "' data-index='"+index+"' data-routeId='"+ json[index].routeId +"' data-totaltime='"+ json[index].time +"' style='width:100%;'>"
            +"<br></div><div id='info"+index+"'></div><br> ";
            
         });  
         if(indexCount == -1){
        	 row="<div id='nothing'><h5>아직 루트가 없네요! 루트를 등록해 보세요~</h5></div>";
         }
         $("#schoolgo").html(row);
   }
   
   
$(document).ready(function() {
      showList();
   });
   
   
$(document).on("click", ".routelist", function(){
   showList();
   var index = $(this).attr("data-index");
   var info ="";
   var count=1;

   
 //총 소요시간 시분초로 변환/////////////////////////////////
   var calTime = Math.floor(json[index].time / 60);
   var calHour ="";
   var calMin="";
   if (calTime >= 60) {
      calHour = Math.floor(calTime / 60) + '시간 ';
    }
   calMin = calTime%60 + '분 ';
////////////////////////////////////////////////////////////


   var routeStep = json[index].stepList;
   var stepLat = "";
   var stepLng = "";
   
   $.each(routeStep, function(index, item){
      
      
      if(item.vmode == "TRANSIT"){
         var vehicleList = item.vehicleList;
         
         $.each(vehicleList, function(index, item){
            if(item.vehicleType == "BUS"){
               stepLat = item.startLat;
               stepLng = item.startLng;
              
               return false;
            }
         });
      }
      
      if(stepLat != "" && stepLng !=""){
         return false;
      }
   });
   
//루트 버튼 눌렀을때 해당 루트의 출발지 도착지 표시를 위한 변수
   var startadd =json[index].startAddress;
   var endadd =json[index].arriveAddress;
   var ttcost = json[index].totalCost;
   var ttwalk = json[index].totalWalk;
////////////////////////////////////////////////////////////////////////////
   
 
   
   var add ="<div id='info'>"
   
   
   
   +"<div id='infostartendtime'>"
   
   +"<div id='infostart'>"
   +"<img id='startendimg' src='main_img/start.png'/><h6>"+startadd+"</h6></div>"
   +"<div id='infoend'>"
   +"<img id='startendimg' src='main_img/end.png'/><h6>"+endadd+"</h6></div>"
   
   
   +"</div>"
   
   
   +"<div id='infoalltime'>"
   
   +"<div id='totali'>"
   +"<span id='timespan'><h5><img id='summaryimg1' src='main_img/walking.png'/>:"+ttwalk+"분</h5></span>"
   +"</div>"
   
   +"<div id='totali'>"
   +"<span id='timespan'><h5><img id='summaryimg2' src='main_img/money.png'/>&nbsp&nbsp:&nbsp&nbsp"+ttcost+"원</h5></span>"
   +"</div>"
   
   +"<div id='totali'>"
   +"<span id='timespan'><h5><img id='summaryimg3' src='main_img/hourglass.png'/>&nbsp:&nbsp&nbsp"+calHour + calMin + "</h5></span>"
   +"</div>"
   
   +"</div>"
   
   
    
   +"<div id='typeselectdiv1'>"
   
   +"<div id='typeselectdiv3'>"
   +"<input id='schoolradio' type='radio' name='radio' class='radio' data-index='1'  data-time='"+getTime.school+"'><label id='schoolradio' for='schoolradio' class='radio-label'><i class='fa fa-check'></i>"
   +"<span>학교<span id='cut'>가기</span></span></label>"
   +"<input id='albaradio' type='radio' name='radio' class='radio' data-index='2'  data-time='"+getTime.alba+"'><label id='albaradio' for='albaradio' class='radio-label'><i class='fa fa-check'></i>"
   +"<span>알바<span id='cut'>가기</span></span></label>"
   +"<input id='customradio' type='radio' name='radio' class='radio' data-index='3' data-routeindex='"+index+"'><label id='customradio' for='customradio' class='radio-label'><i class='fa fa-check'></i>"
   +"<span>사용자 <span id='cut'>지정 시간</span></span></label>"
   +"</div>"
   
   +"<div id='typeselectdiv4'>"
   +"<input id='custimehour' type='text' >시<input id='custimemin' type='text' >분"
   +"</div>"
   
   
   +"</div>"

   
   
   
   +"<div id='typeselectdiv2'>"
   +"<input type='button' class='gotoschool' value='Go!'"
   +"data-lat='"+ stepLat+"'" 
   +"data-lng='"+stepLng +"' data-index='"+index+"' data-totaltime='"+$(this).attr("data-totaltime")+"'>"
   +"<input type='button' id='route"+$(this).attr("data-index") + "' class='group' name='group'"
   +"value='삭제' data-routeId='"+$(this).attr("data-routeId")+"'>";
   +"</div>"
   
   
   +"</div>";
    
   
   $("#info" + index).html(add);
	count++;
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
         /* var row="";
         $.each(json, function(index, item){   
            row+="<div id='div"+ index + "'><input type='button' class='routelist' value='"+ json[index].routeName + "'><input type='button' id='routed"+index + "' class='group' name='group' value='삭제' data-routeId='"+ json[index].routeId +"'></div><br> ";         
         }); */
         showList();
      },
       error:function(xhr, status, error){
         console.log(error);
      }
   });
   
   
});
   

 $(document).on("click", ".radio", function(){
	$(".group").slideDown("slow")
	$(".gotoschool").slideDown("slow")
	            });


$(document).on("click", ".gotoschool", function(){
   location.href = "gotogo?index="+$(this).attr("data-index") + "&time="+time + "&totaltime="+$(this).attr("data-totaltime");
         });


var cushour="00";
var cusmin="00";
var tmptime="";
var timereg = /^[0-9]{1,2}$/;

$(document).on("input propoertychange", "#custimehour", function(){
	
	var isValid = timereg.test($(this).val());
	if(isValid && $(this).val() <= 23){
		cushour = $(this).val();
		tmptime=cushour+":"+cusmin;
		time = tmptime;
	}else{
		alert("00~23 사이의 숫자를 입력해 주세요.");
		$(this).val("");
		cushour="00";
	}
	console.log(time);
});
$(document).on("input propoertychange", "#custimemin", function(){
	var isValid = timereg.test($(this).val());
	if(isValid && $(this).val() <= 59){
		cusmin = $(this).val();
		tmptime=cushour+":"+cusmin;
		time = tmptime;
	}else{
		alert("00~59 사이의 숫자를 입력해 주세요.");
		$(this).val("");
		cusmin="00";
	}
	
	console.log(time);
});
$(document).on("change", ".radio", function(){
   var routeindex = $(this).attr("data-routeindex");
  
   if($(this).attr("data-index")==3){
	   $("#typeselectdiv"+4).slideDown("slow");
	   
   }else{
	   $("#typeselectdiv4").slideUp("slow");
	   time = $(this).attr("data-time");
   }    
});       
   </script>

</body>
</html>