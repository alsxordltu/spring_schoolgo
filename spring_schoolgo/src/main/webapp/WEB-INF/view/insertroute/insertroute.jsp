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
<script src="http://files.codepedia.info/uploads/iScripts/html2canvas.js"></script>
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
				<header >
				<h2 align="center"><img src="insert_img/routeadd.png" width="70%"></h2>
					<p align="center">나만의 루트를 등록해보세요!</p>
				</header>




				<div id=insertstartend>
					<form name="routenext" method="get" action="gotoinsert1">

						<!-- 루트명 입력(값넘기기) -->
						<div id="routenametext">
							<h5 align=center>루트 이름을 입력하세요!</h5>
							<input type="text" id="routename" style="width:50%; text-align:center;">
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
								width="80%">
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
							<input type=button id=insertselectbtn value=조회하기>
						</div>
					</form>
				</div>
				
				
				<div id="routelist"></div>
				<div id="addroutebtn"><input id="addroutebtnbtn" type=button  value=등록></div>
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
               <li><a href="gotomain">학교가기</a></li>
               <li class="current"><a href="gotoinsertroute">루트등록</a></li>
               <li><a href="gotoboardmain">루트공유</a></li>
               <li><a href="#">Contact Me</a></li>
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
         var seletedRouteCost1;
         var seletedRouteCost2;
         var seletedRouteCost3;
         var seletedRouteCost4;
         var seletedRouteCost5;
         var seletedRouteWalk1;
         var seletedRouteWalk2;
         var seletedRouteWalk3;
         var seletedRouteWalk4;
         var seletedRouteWalk5;
         $("#insertselectbtn").on("click", function(){
  		   $("#routelist").css("display","block"); 
  		 $("#addroutebtn").css("display","block");
         });
         
         <c:url value="/get" var="find" />
            $("#insertselectbtn").on("click", function(){
               $.ajax({
                  
                  url:"${find}",
                  type:"get",
               
                  success:function(data){
                     items = data;
                     items2 = data.routes;
                         showlist();
   					},
                  error : function(xhr, status, error){
                     alert(error);
                  }
                  
               });
            });
            
            
            
            function showlist(){
            var row="";
            var summary="";
            
            var total="";
            var totaldistance=0;
            var totalcost=0;
            var totalwalk=0;
            
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
                     "<label for='radio"+listindex+"' class='radio-label'><i style='float:right;' class='fa fa-check fa-2x'></i>";
                     
                     summary+="<div id='summary"+listindex+"'><div id='starta'><h6><img id='startendimg' src='insert_img/start.png' width='8%'/>"+startadd+"</h6></div>";
                     
                     total+="<div id='total"+listindex+"'>";
                     
                   
                     
                
                     
                     $.each(step, function(index, item){
                   	  var travelmode = item.travel_mode;
                 		  
                       if(travelmode=="WALKING"){ /* 도보 이용시  */
                       	var walkingtime = item.duration.text;
                       	var hwansng1 = item.html_instructions;
                       	
                       	
               			walkingtime = parseFloat(walkingtime.replace(/[^0-9]/g,''));
                        totalwalk += walkingtime;
                        
                        
                   	  row+=" "+"<div id='walkicon'><div id='icon'><img src='insert_img/walking.png' width='80%'/></div><div id='icontime'>"+walkingtime+"분</div></div>";
                   	  summary+=" " +"<div id='walking'><h6><img id='moreimg' src='insert_img/more.png' width='6%'/>"+hwansng1+"["+walkingtime+"분]</h6></div>";
                   	   
                   	  
                   	  
                       }
                       else{ /* 교통수단 이용시  */
                       	var transtype = item.transit_details.line.vehicle.type;
                       	var shortname = item.transit_details.line.short_name;
                       	var transname = item.transit_details.line.name;
                       	var depname = item.transit_details.departure_stop.name;
                       	var arrname = item.transit_details.arrival_stop.name;
                       	var headsign = item.transit_details.headsign;
                       	var hwansng2 = item.html_instructions;
                       	
                       	var stop = item.transit_details.num_stops;
                        /* 버스 이용시  */
                       	if(transtype=="BUS"){
                       		if(shortname==null){ /* 시외버스 이용시  */
                       			row+=" "+"<div id='busicon'><div id='icon'><img src='insert_img/bus.png' width='80%'/></div><div id='icontime'>"+transname+"</div></div>";
                       			summary+=" "+"<div id='siwoibus'>"
                       			+"<h6><img id='transimg' src='insert_img/bus.png'/>"
                       			+transname+hwansng2+"</h6>"
                       			+"<h6><img id='sumimg'  src='insert_img/circle2.png'/>[승차]"+depname+"</h6>"
                           		+"<h6><img id='more2img' src='insert_img/more2.png' width='6%'/></h6>"
                           		+"<h6><img id='sumimg'  src='insert_img/circle2.png'/>[하차]"+arrname+"</h6>"
                           		+"</div>";
                       			
                       			/* 요금계산을 위한 이동거리 더하기 */
                       			var busdistance=item.distance.text;
                       			busdistance = parseFloat(busdistance.replace(/\km/g,''));
                       			totaldistance += busdistance;
                       			
                       			/* 요금 계산..(계산할 수 없어서 임의 계산.....) */
                       			/* 거리당 110원 하면 거의 비슷하지만 편차가 큼 */
                      			totalcost += (Math.round(busdistance)*110);
                      
                       			
                       		}else{    /* 시내버스 이용시  */
                       			
                       		row+=" "+"<div id='busicon'><div id='icon'><img src='insert_img/bus.png' width='80%'/></div><div id='icontime'>"+shortname+"번 버스</div></div>";
                       		summary+=" "+"<div id='sinabus'>"
                       		+"<h6><img id='transimg' src='insert_img/bus.png'/>"
                       		+shortname+"번 버스 ["+headsign+"행] </h6>"
                       		+"<h6><img id='sumimg'  src='insert_img/circle2.png'/>[승차]"+depname+"</h6>"
                       		+"<h6><img id='more2img' src='insert_img/more2.png' width='6%'/>"+stop+"개 정류장 이동</h6>"
                       		+"<h6><img id='sumimg'  src='insert_img/circle2.png'/>[하차]"+arrname+"</h6>"
                       		+"</div>";
                       		
                       		/* 요금계산을 위한 이동거리 더하기*/
                   			var busdistance=item.distance.text;
                   			busdistance = parseFloat(busdistance.replace(/\km/g,''));
                   			totaldistance += busdistance;
                   			if(busdistance<=10){
                   				/* 10km이하 거리 갈때 요금=기본요금 */
                    			totalcost += 0;
                    		}else if(busdistance>10&&busdistance<=45){
                    			/* 10km초과 거리 갈때 요금 = 10km이후부터 5km당 100원이고 최대요금 700원*/
                    			totalcost += ((((Math.round(busdistance))-10)/5)*100);
                    		}else{
                    			/* 최대요금 */
                    			totalcost += 700;
                    			
                    		}
                       		
                       		
                       		
                       		}
                       		}else if(transtype=="SUBWAY"){ /* 전철 이용시  */
                           	row+=" "+"<div id='subwayicon'><div id='icon'><img src='insert_img/subway.png' width='80%'/></div><div id='icontime'>"+shortname+"</div></div>";
                           	summary+=" "+"<div id='subway'>"
                        	+"<h6><img id='transimg' src='insert_img/subway.png'/>"
                           	+shortname+"["+hwansng2+"]</h6>"
                           	+"<h6><img id='sumimg' src='insert_img/circle2.png'/>[승차]"+depname+"</h6>"
                       		+"<h6><img id='more2img' src='insert_img/more2.png' width='6%'/>"+stop+"개 정류장 이동</h6>"
                       		+"<h6><img id='sumimg' src='insert_img/circle2.png'/>[하차]"+arrname+"</h6>"
                           	+"</div>";
                           	
                           	/* 요금계산을 위한 이동거리 더하기*/
                   			var subwaydistance=item.distance.text;
                   			subwaydistance = parseFloat(subwaydistance.replace(/\km/g,''));
                   			totaldistance += subwaydistance;
                   			
                   			if(subwaydistance<=10){
                   				/* 10km이하 거리 갈때 요금=기본요금 */
                    			totalcost += 0;
                   				
                    		}else if(subwaydistance>10&&subwaydistance<=50){
                    			/* 10km초과 50km이하 거리 갈때 요금 = 10km이후부터 5km당 100원 */
                    			totalcost += (Math.round((subwaydistance-10)/5)*100);
                    			
                    		}else{
                    			/* 50km초과 거리 갈때 요금 = 50km이후부터 8km당 100원 */
                    			totalcost += 900+(Math.round((subwaydistance-50)/8)*100);
                    		}
                    		
                           	
                           	
                           }else if(transtype=="HEAVY_RAIL"){ /* 기차 이용시  */
                           	row+=" "+"<div id='trainicon'><div id='icon'><img src='insert_img/train.png' width='80%'/></div><div id='icontime'>"+transname+"</div></div>";
                           	summary+=" "+"<div id='train'>"
                           	+"<h6><img id='transimg' src='insert_img/train.png'/>"
                           	+transname+"["+hwansng2+"]</h6>"
                           	+"<h6><img id='sumimg' src='insert_img/circle2.png'/>[승차]"+depname+"</h6>"
                       		+"<h6><img id='more2img' src='insert_img/more2.png' width='6%'/>"+stop+"개 정류장 이동</h6>"
                       		+"<h6><img id='sumimg' src='insert_img/circle2.png'/>[하차]"+arrname+"</h6>"
                           	+"</div>";
                           	
                           	/* 요금계산을 위한 이동거리 더하기*/
                   			var traindistance=item.distance.text;
                   			traindistance = parseFloat(traindistance.replace(/\km/g,''));
                   			totaldistance += traindistance;
                   			
                   			
                   			/* 요금 계산..(계산할 수 없어서 임의 계산.....) */
                   			if(traindistance<=50){
                   				/* 50km이하 거리 갈때 요금*/
                   				totalcost += (((Math.round(traindistance))-10)*110);
                    		}else{
                    			/* 50km초과 거리 갈때 요금  */
                    			totalcost += 4400+(((Math.round(traindistance))-50)*100);
                    		}
                   			console.log(totalcost);
                           	
                           }else{
                           	row+="음슴.";
                           }
                       }
                       
                     });
                     
                     
                     
                     
                     
                     
                     /* 기본요금더하기 */
                     if(totaldistance==0){
                    	 totalcost=0;
                     }else{
                    	 totalcost+=1250;
                     }
                     
                    
                     row+="</label><br>";           
                     summary+="<div id='enda'><h6><img id='startendimg' src='insert_img/end.png' width='8%'/>"+endadd+"</h6></div></div>";
                     total+="<div id='totalwalk'><h6><img style='float:left; vertical-align:middle;' src='insert_img/walking.png' width='20%'/> : "+totalwalk+"분</h6></div>"
                    	 +"<div id='totalcost'><h6><img style='float:left; vertical-align:middle;' src='insert_img/money.png' width='20%'/> &nbsp: "+totalcost+"원</h6></div>"
                     	 +"<div id='alltime'><h6><img style='float:left; vertical-align:middle;' src='insert_img/hourglass.png' width='18%'/> &nbsp: "+alltime+"</h6></div></div>";
                     if(listindex == 0){
                    	 seletedRouteCost1 = totalcost;
                    	 seletedRouteWalk1  = totalwalk;
                     }else if(listindex == 1){
                    	 seletedRouteCost2 = totalcost;
                    	 seletedRouteWalk2  = totalwalk;
                     }
						else if(listindex == 2){
							seletedRouteCost3 = totalcost;
							seletedRouteWalk3  = totalwalk;
                     }
						else if(listindex == 3){
							seletedRouteCost4 = totalcost;
							seletedRouteWalk4  = totalwalk;
					}
						else if(listindex == 4){
							seletedRouteCost5 = totalcost;
							seletedRouteWalk5  = totalwalk;
					}

                     	
               

                     rowsum+=row+summary+total;
                     
                     row="";
                     summary="";
                     total="";
                     totalcost=0;
                     listindex++;
                     
                     
                     
                     
                     });
                 
         
                  
               });
               
               $("#routelist").html(rowsum);
              
               }
            
            
            
            
            
            
   $(document).on("change", ".radio", function () { 	   
           var selectedvalue =  $("input[name='group']:checked").val();
           
           selectedindex = ($(this).attr("data-idx"));
           $( "#selectedstring" ).val(selectedindex);
                           
      });
   
   
   $(document).on("click","#radio0", function () {
	   
	      $("#summary0").slideDown("slow"); 
	      $("#summary1").slideUp("slow"); 
	      $("#summary2").slideUp("slow"); 
	      $("#summary3").slideUp("slow");
	      $("#summary4").slideUp("slow");
	      
	      $("#total0").slideDown("slow"); 
	      $("#total1").slideUp("slow"); 
	      $("#total2").slideUp("slow"); 
	      $("#total3").slideUp("slow");
	      $("#total4").slideUp("slow");
	      
	      
		 });

	   $(document).on("click","#radio1", function () {
		   
		  $("#summary1").slideDown("slow");
		  $("#summary0").slideUp("slow"); 
		  $("#summary2").slideUp("slow");
		  $("#summary3").slideUp("slow"); 
		  $("#summary4").slideUp("slow");
		  

	      $("#total1").slideDown("slow"); 
	      $("#total0").slideUp("slow"); 
	      $("#total2").slideUp("slow"); 
	      $("#total3").slideUp("slow");
	      $("#total4").slideUp("slow");
	      
			 });
	   $(document).on("click","#radio2", function () {
		   
		   $("#summary2").slideDown("slow");
		      $("#summary0").slideUp("slow");
		      $("#summary1").slideUp("slow");
		      $("#summary3").slideUp("slow");
		      $("#summary4").slideUp("slow"); 
		      
		      
		      $("#total2").slideDown("slow"); 
		      $("#total0").slideUp("slow"); 
		      $("#total1").slideUp("slow"); 
		      $("#total3").slideUp("slow");
		      $("#total4").slideUp("slow");
			 });
	   $(document).on("click","#radio3", function () {
		   
		   $("#summary3").slideDown("slow");  
		   $("#summary0").slideUp("slow");
		   $("#summary1").slideUp("slow");
	       $("#summary2").slideUp("slow");
		   $("#summary4").slideUp("slow"); 
		   
		   $("#total3").slideDown("slow"); 
		      $("#total0").slideUp("slow"); 
		      $("#total1").slideUp("slow"); 
		      $("#total2").slideUp("slow");
		      $("#total4").slideUp("slow");
		      
		      
		      
			 });
	   $(document).on("click","#radio4", function () {
		   
		   $("#summary4").slideDown("slow");
		      $("#summary0").slideUp("slow");
		      $("#summary1").slideUp("slow");
		      $("#summary2").slideUp("slow");
		      $("#summary3").slideUp("slow"); 
		      
		      $("#summary4").slideDown("slow");  
			   $("#summary0").slideUp("slow");
			   $("#summary1").slideUp("slow");
		       $("#summary2").slideUp("slow");
			   $("#summary3").slideUp("slow"); 
			   
			   
			 });
   
   
   
   
   
   
   $("#addroutebtnbtn").on("click", function(){
	   var sendcost;
	   var sendwalk;
      items.routes = [items.routes[selectedindex]];
      if(selectedindex == 0){
    	  sendcost = seletedRouteCost1;
    	  sendwalk = seletedRouteWalk1;
      }else if(selectedindex == 1){
    	  sendcost = seletedRouteCost2;
    	  sendwalk = seletedRouteWalk2;
      }
			else if(selectedindex == 2){
				sendcost = seletedRouteCost3;
				sendwalk = seletedRouteWalk3;
      }
			else if(selectedindex == 3){
				sendcost = seletedRouteCost4;
				sendwalk = seletedRouteWalk4;
		}
			else if(selectedindex == 4){
				sendcost = seletedRouteCost5;
				sendwalk = seletedRouteWalk5;
		}
      //var url = ${insertRoute};
      $.ajax({
         data: {data:JSON.stringify(items), routeName: $("#routename").val(),
        	 routeTotalCost : sendcost,
         	routeTotalWalk : sendwalk
        	 },
         
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
   
   
   
   
 /*   $(document).ready(function(){

		
	   var element = $("#html-content-holder"); // global variable
	   var getCanvas; // global variable
	    
	       $("#btn-Preview-Image").on('click', function () {
	            html2canvas(element, {
	            onrendered: function (canvas) {
	                   $("#previewImage").append(canvas);
	                   getCanvas = canvas;
	                   console.log(typeof getCanvas);
	                   console.log(getCanvas);
	                }
	            });
	       }); 
	   
	   

	   	$("#btn-Convert-Html2Image").on('click', function () {
	       var imgageData = getCanvas.toDataURL("image/png");
	       // Now browser starts downloading it instead of just showing it
	       var newData = imgageData.replace(/^data:image\/png/, "data:application/octet-stream;charset=utf-16le;base64");
	       $("#btn-Convert-Html2Image").attr("download", "ccs.png").attr("href", newData);
	   	});

	   }); */
   
   
   
   
   
   
   
   
   
   
   
   
   
	</script>


</body>
</html>