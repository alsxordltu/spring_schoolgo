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

						<!-- 루트명 입력(값넘기기) -->
						<div style="margin: 50px 0 100px 0; float: left; width: 100%;">
							<h5 align=center>루트 이름을 입력하세요!</h5>
							<input type="text" id="routename">
						</div>
						<!-- 출발지 값 -->
						<div id=insertstart>
							<h5 align=center>
								출발지<span id=endend>를 입력하세요</span>
							</h5>
							<a href="gotosearch"> <input type="text" name="start"
								value="<%=searchdata%>" readonly></a>
						</div>

						<!-- 화살표 -->
						<div id=insertarrow>
							<img id=insertarrowimg src="insert_img/arrowwide.png"
								width="100%">
						</div>

						<!-- 도착지 값 -->
						<div id=insertend>
							<h5 align=center>
								도착지<span id=endend>를 입력하세요</span>
							</h5>
							<a href="gotosearch2"> <input type="text" name="end"
								value="<%=searchdata2%>" readonly></a>

						</div>

						<!-- 조회 버튼 -->
						<div id=insertselect>
							<input type=button id=insertselectbtn value=조회하기> <input
								type=button id="send" value=등록>
						</div>








						<!-- 섭밋 버튼 -->
						<!-- <div style="text-align: center">
                     <input type="submit" value="등록하러 가기">
                  </div> -->
					</form>
				</div>
				<div id="routelist"></div>

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
                     items = data;
                     items2 = data.routes;
                    /*  var row="";
                     var summary="";
                     var listindex=0;
                        $.each(items2, function(index, item){
                           var items3 = item.legs;
                           $.each(items3, function(index, item){
                			  var alltime= item.duration.text;
                              var step = item.steps;
                              var startadd= item.start_address;
                              var endadd= item.end_address;
                              
                              row += "<input TYPE='radio' id='radio"+listindex+"' class='radio' name='group' value='"+listindex+"' data-idx='"+ listindex+ "'/>"+
                              "<label for='radio"+listindex+"' class='radio-label'><i class='fa fa-check'></i><span>경로"+listindex+"<span>";
                              summary+="<div id='summary"+listindex+"'><h5>"+startadd+"</h5>";
                              
                             
                              $.each(step, function(index, item){
                            	  var travelmode = item.travel_mode;
                          		  
                                if(travelmode=="WALKING"){
                                	var walking = item.duration.text;
                            	  row+=" "+"<img src='insert_img/walking.png' width='8%'/>"+walking;
                            	  summary+=" " +"<h5>도보"+walking+"분</h5>";
                                }else{
                                	var transtype = item.transit_details.line.vehicle.type;
                                	var shortname = item.transit_details.line.short_name;
                                	var transname = item.transit_details.line.name;
                                	
                                	
                                	if(transtype=="BUS"){
                                		if(shortname==null){
                                			row+=" "+"<img src='insert_img/bus.png' width='8%'/>"+transname;
                                			summary+=" "+"<h5>시외버스"+transname+"</h5>";
                                		}else{
                                		row+=" "+"<img src='insert_img/bus.png' width='8%'/>"+shortname+"번 버스";
                                		summary+=" "+"<h5>시내버스"+shortname+"번버슈</h5>";
                                		}
                                		}else if(transtype=="SUBWAY"){
                                    	row+=" "+"<img src='insert_img/subway.png' width='8%'/>"+shortname;
                                    	summary+=" "+"<h5>전철"+shortname+"어디방면 타고 어디역에서 내린다.</h5>";
                                    }else if(transtype=="HEAVY_RAIL"){
                                    	row+=" "+"<img src='insert_img/train.png' width='8%'/>"+transname;
                                    	summary+=" "+"<h5>기차"+transname+"기차기차 무슨선 어디행?.</h5>";
                                    }else{
                                    	row+="음슴.";
                                    }
                                }
                                
                              });
                              
                              summary+="<h5>"+endadd+"</h5></div>";
                              row+=alltime+"</label><br>";
                              listindex++;
                              
                              
                              });
                        });
                      
                        $("#routelist").html($("#routelist").html()+row+summary);
                        
                         */
                         
                         showlist();
                         
                        /* $("input:radio[name='book_type'][value='magazine']").prop('checked', true); */
                  },
                  error : function(xhr, status, error){
                     alert(error);
                  }
                  
               });
            });
            
            
            
            function showlist(){
            var row="";
            var summary="";
            var rowsum="";
            var endadd;
            var listindex=0;
               $.each(items2, function(index, item){
                  var items3 = item.legs;
                  $.each(items3, function(index, item){
       			  var alltime= item.duration.text;
                     var step = item.steps;
                     var startadd= item.start_address;
                     endadd= item.end_address;
                     
                     row += "<input TYPE='radio' id='radio"+listindex+"' class='radio' name='group' value='"+listindex+"' data-idx='"+ listindex+ "'/>"+
                     "<label for='radio"+listindex+"' class='radio-label'><i class='fa fa-check'></i><span>경로"+listindex+"<span>";
                     summary+="<div id='summary"+listindex+"'><h5>"+startadd+"</h5>";
                     
                    
                     $.each(step, function(index, item){
                   	  var travelmode = item.travel_mode;
                 		  
                       if(travelmode=="WALKING"){
                       	var walking = item.duration.text;
                   	  row+=" "+"<img src='insert_img/walking.png' width='8%'/>"+walking;
                   	  summary+=" " +"<h5>도보"+walking+"분</h5>";
                       }else{
                       	var transtype = item.transit_details.line.vehicle.type;
                       	var shortname = item.transit_details.line.short_name;
                       	var transname = item.transit_details.line.name;
                       	
                       	
                       	if(transtype=="BUS"){
                       		if(shortname==null){
                       			row+=" "+"<img src='insert_img/bus.png' width='8%'/>"+transname;
                       			summary+=" "+"<h5>시외버스"+transname+"</h5>";
                       		}else{
                       		row+=" "+"<img src='insert_img/bus.png' width='8%'/>"+shortname+"번 버스";
                       		summary+=" "+"<h5>시내버스"+shortname+"번버슈</h5>";
                       		}
                       		}else if(transtype=="SUBWAY"){
                           	row+=" "+"<img src='insert_img/subway.png' width='8%'/>"+shortname;
                           	summary+=" "+"<h5>전철"+shortname+"어디방면 타고 어디역에서 내린다.</h5>";
                           }else if(transtype=="HEAVY_RAIL"){
                           	row+=" "+"<img src='insert_img/train.png' width='8%'/>"+transname;
                           	summary+=" "+"<h5>기차"+transname+"기차기차 무슨선 어디행?.</h5>";
                           }else{
                           	row+="음슴.";
                           }
                       }
                       
                     });
                     
                    
                     row+=alltime+"</label><br>";           
                     summary+="<h5>"+endadd+"</h5></div>";
                     rowsum+=row+summary;
                     
                     row="";
                     summary="";
                     
                     
                     listindex++;
                     });
                 
         
                  
               });
               
               $("#routelist").html($("#routelist").html()+rowsum);
              
               }
            
            
            
            
            
            
   $(document).on("change", ".radio", function () { 	   
           var selectedvalue =  $("input[name='group']:checked").val();
           
           selectedindex = ($(this).attr("data-idx"));
           $( "#selectedstring" ).val(selectedindex);
                           
      });
   
   
   $(document).on("click","#radio0", function () {
	   
      $("#summary0").css("display","block");  
      $("#summary1").css("display","none"); 
      $("#summary2").css("display","none"); 
      $("#summary3").css("display","none"); 
      $("#summary4").css("display","none"); 
	 });

   $(document).on("click","#radio1", function () {
	   
	      $("#summary1").css("display","block");
	      $("#summary0").css("display","none"); 
	      $("#summary2").css("display","none"); 
	      $("#summary3").css("display","none"); 
	      $("#summary4").css("display","none");
		 });
   $(document).on("click","#radio2", function () {
	   
	   $("#summary2").css("display","block");
	      $("#summary0").css("display","none"); 
	      $("#summary1").css("display","none"); 
	      $("#summary3").css("display","none"); 
	      $("#summary4").css("display","none");               
		 });
   $(document).on("click","#radio3", function () {
	   
	   $("#summary3").css("display","block");
	      $("#summary0").css("display","none"); 
	      $("#summary1").css("display","none"); 
	      $("#summary2").css("display","none"); 
	      $("#summary4").css("display","none");                
		 });
   $(document).on("click","#radio4", function () {
	   
	   $("#summary4").css("display","block");
	      $("#summary0").css("display","none"); 
	      $("#summary1").css("display","none"); 
	      $("#summary2").css("display","none"); 
	      $("#summary3").css("display","none");                
		 });
   
   
   
   
   
   
   $("#send").on("click", function(){
      items.routes = [items.routes[selectedindex]];
      //var url = ${insertRoute};
      $.ajax({
         data: {data:JSON.stringify(items), routeName: $("#routename").val()},
         url:"/mvc_project_practice/insertRoute",
         type:"post",
         success:function(response){
            location.href='<%=request.getContextPath()%>/gotomain';
				},
				error : function(xhr, status, error) {
					console.log("error : ", error);
				}
			});
		});
	</script>


</body>
</html>