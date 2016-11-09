<!DOCTYPE HTML>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Striped by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="main_css/main.css" />
<script src="http://code.jquery.com/jquery.js"></script>
<script src="http://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/canvasjs/1.4.1/canvas.min.js"></script>
</head>
<body>
	 	
<div id="content">
      <div class="inner">
            <article class="box post post-excerpt">
               <header>
                  <h2 align="center"><img src="main_img/fix.png" width="70%"></h2>
               </header>
            </article>


<div id="admincontent">

	<h1>admin page_bigdata 모든계정(user)의 루트목록 count</h1>

	<table class="table">
		<thead>
			<tr>
				<th>장소(경유출발지도착지)</th>
				<th>count</th>
			</tr>
		</thead>
		
		<tbody id="countlist">
		</tbody>

	</table>
</div>

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

   
<script>
	var countData = ${countdata};
	console.log(countData);

		
	window.onload = function () {
		var row="";
	 	$.each(countData, function(index, item){
			row+="<tr><td id='vname"+index+"' data-vname"+index+"='"+item.VNAME+"'>" + item.VNAME + "</td><td id='sumr"+index+"' data-sumr"+index+"="+item.SUMR+">" + item.SUMR + "</td></tr>";
		}); 
	 	$("#countlist").html(row);
		
	 	var num1 = $("#sumr0").attr("data-sumr0");
	 	num1 *= 1;
	 	var num2 = $("#sumr1").attr("data-sumr1");
	 	num2 *= 1;
	 	var num3 = $("#sumr2").attr("data-sumr2");
	 	num3 *= 1;
	 	var num4 = $("#sumr3").attr("data-sumr3");
	 	num4 *= 1;
	 	var num5 = $("#sumr4").attr("data-sumr4");
	 	num5 *= 1;
	  var chart = new CanvasJS.Chart("chartContainer", {
	     theme: "theme2",//theme1
	     title:{
	        text: "대학생 등/하교시 많이 지나가는 장소 ?"              
	    },
	     data: [              
	     {
	        type: "column",
	        /* dataPoints: [
	        { label: $("#list0").attr("data-vname0"), y: $("#list0").attr("data-sumr0") },
	        { label: $("#list1").attr("data-vname1"), y: $("#list1").attr("data-sumr1") },
	        { label: $("#list2").attr("data-vname2"), y: $("#list2").attr("data-sumr2") },
	        { label: $("#list3").attr("data-vname3"), y: $("#list3").attr("data-sumr3") },
	        { label: $("#list4").attr("data-vname4"), y: $("#list4").attr("data-sumr4") },
	        ] */
	     dataPoints: [
	      	        { label: $("#vname0").attr("data-vname0"), y: num1 },
	      	        { label: $("#vname1").attr("data-vname1"), y: num2 },
	      	        { label: $("#vname2").attr("data-vname2"), y: num3 },
	      	        { label: $("#vname3").attr("data-vname3"), y: num4 },
	      	        { label: $("#vname4").attr("data-vname4"), y: num5 },
	      	        ]
	     }
	     ]
	  });
	  chart.render();
	}
	</script>

</html>
