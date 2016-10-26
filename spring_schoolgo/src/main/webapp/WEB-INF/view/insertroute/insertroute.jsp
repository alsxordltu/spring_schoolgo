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
<link rel="stylesheet" href="insert_css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>
   <%
      String searchdata = (String) session.getAttribute("start");
      String searchdata2 = (String) session.getAttribute("end");
      String routename = "";
      if (searchdata == null) {
         searchdata = "";
      }
      if (searchdata2 == null) {
         searchdata2 = "";
      }
      if (session.getAttribute("routename") != null) {
         routename = (String) session.getAttribute("routename");
      }
   %>
   <!-- Content -->
   <div id="content">
      <div class="inner">

         <!-- Post -->
         <article class="box post post-excerpt">

            <!-- 헤더부분 -->
            <header>
               <h2 align="center">루트 등록</h2>
               <p align="center">당신의 루트를 등록할 수 있습니다.</p>
            </header>


            

               <div id=insertstartend>
               <form name="routenext" method="get" action="gotoinsert1">
               
                  <!-- 출발지 값 -->
                  <div id=insertstart>
                     <h5 align=center>출발지<span id=endend>를 입력하세요</span></h5>
                     <a href="gotosearch"> <input type="text" name="start"
                        value="<%=searchdata%>" readonly></a> <input type="hidden"
                        name="startlocation" value="${searchdata}">
                  </div>

                  <!-- 화살표 -->
                  <div id=insertarrow>
                     <img id=insertarrowimg src="insert_img/arrowwide.png" width="100%">
                  </div>

                  <!-- 도착지 값 -->
                  <div id=insertend>
                     <h5 align=center>도착지<span id=endend>를 입력하세요</span></h5>
                     <a href="gotosearch2"> <input type="text" name="end"
                        value="<%=searchdata2%>" readonly></a> <input type="hidden"
                        name="endlocation" value="${searchdata2}">

                  </div>
                  
                  <!-- 조회 버튼 -->
                  <div id=insertselect>
                     <input type=text  id="selectedstring">
                     <input type=button id=insertselectbtn value=조회하기>
                     <input type=button  id="send" value=등록>
                  </div>
                  
                  




                  <%--    <!-- 루트명 입력(값넘기기) -->
                  <div style="margin: 50px 0 100px 0; float: left; width: 100%;">
                     <h5 align=center>루트 이름을 입력하세요!</h5>
                     <input type="text" name="routename" value="<%=routename %>">
                  </div> --%>


                  <!-- 섭밋 버튼 -->
                  <!-- <div style="text-align: center">
                     <input type="submit" value="등록하러 가기">
                  </div> -->
            </form>
      </div>
      <div id="routelist">
         
      </div>
      
      </article>

   </div>
   </div>

   <!-- Sidebar -->
   <div id="sidebar">

      <!-- Logo -->
      <h1 id="logo">
         <a href="gotomain"><img src="insert_img/gogo.png" width="150px"
            alt="" /></a>
      </h1>

      <!-- Nav -->
      <nav id="nav">
         <ul>
            <li><a href="gotomain">학교가기</a></li>
            <li class="current"><a href="gotoinsertroute">루트등록</a></li>
            <li><a href="#">루트공유</a></li>
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
            <li><a href="#">개인정보 수정</a></li>
            <li><a href="#">루트관리</a></li>
            <li><a href="#">교통비 가계부</a></li>
            <li><a href="#">활동내역</a></li>
         </ul>
      </section>




      <!-- Copyright -->
      <ul id="copyright">
         <li>&copy; Untitled.</li>
         <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
      </ul>

   </div>

   <!-- Scripts -->
   <script src="insert_js/jquery.min.js"></script>
   <script src="insert_js/skel.min.js"></script>
   <script src="insert_js/util.js"></script>
   <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
   <script src="insert_js/main.js"></script>
         <script src="http://code.jquery.com/jquery.js"></script>
         <script>
         var items;
         var selectedindex;
         <c:url value="/get" var="find" />
            $("#insertselectbtn").on("click", function(){
               $.ajax({
                  
                  url:"${find}",
                  type:"get",
               
                  success:function(data){
                     alert("성공");
                     items = data;
                     items2 = data.routes;
                     var row="";
                     var listindex=0;
                        $.each(items2, function(index, item){
                           var items3 = item.legs;
                           $.each(items3, function(index, item){
                			  var string0= item.duration;
                              var string = item.steps;
                              row += "<label><input TYPE='radio' class='group' name='group' value='"+listindex+"' data-idx='"+ listindex+ "'/>경로"+listindex;
                              $.each(string, function(index, item){
                            	  var string2 = item.travel_mode;
                            	 
                            	  
                                if(string2=="WALKING"){ 
                            	  row+=" "+"<img src='insert_img/walking.png' width='50px'/>";
                                }else{
                                	var string3 = item.transit_details.line.vehicle.type;
                                	if(string3=="BUS"){
                                		row+=" "+"<img src='insert_img/bus.png' width='50px'/>";
                                    }else{
                                    	row+=" "+"<img src='insert_img/subway.png' width='50px'/>";
                                    }                         	
                                }
                                
                              });
                              
                              
                              row+=string0+"</label><br>"
                              listindex++;
                              
                              
                              });
                        });
                      
                        $("#routelist").html($("#routelist").html()+row);
                        /* $("input:radio[name='book_type'][value='magazine']").prop('checked', true); */
                  },
                  error : function(xhr, status, error){
                     alert(error);
                  }
                  
               });
            });
            
      

   $(document).on("change", ".group", function () {
            //라디오 버튼 값을 가져온다.
            
            var selectedvalue =  $("input[name='group']:checked").val();
           
           selectedindex = ($(this).attr("data-idx"));
           $( "#selectedstring" ).val(selectedindex);
            //alert(selectedvalue);
            //$( "#selectedstring" ).val(selectedvalue);                
      });
   
   $("#send").on("click", function(){
      items.routes = [items.routes[selectedindex]];
      //var url = ${insertRoute};
      $.ajax({
         data: {data:JSON.stringify(items), routeName:"myroute"},
         url:"/mvc_project_practice/insertRoute",
         type:"post",
         success:function(response){
            location.href=response;
         },
         error:function(xhr, status, error){
            console.log("error : ", error);
         }
      });
   });
   
   
      
         </script>
         

</body>
</html>