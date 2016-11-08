<!DOCTYPE HTML>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<style>
body {
	padding: 15px;
}

table {
	border-collapse: separate;
	border-spacing: 0 5px;
}

thead th {
	background-color: #006DCC;
	color: white;
}
</style>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="canvasjs.min.js"></script>
<script type="text/javascript" src="/assets/script/jquery-1.11.1.min.js"></script>
<script src="http://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/canvasjs/1.4.1/canvas.min.js"></script>
</head>
<body>
	<%-- 	<c:forEach items="${countdata}" var="list">
		 ${list} 
	</c:forEach>


	<c:forEach items="${countdata}" var="list">
		  ${list.VNAME}<br>
		 ${list.SUMR}<br>
	</c:forEach> --%>

	<h1>admin page_bigdata 모든계정(user)의 루트목록 count</h1>

	<table class="table">
		<thead>
			<tr>
				<th>장소(경유출발지도착지)</th>
				<th>count</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${countdata}" var="list">
				<tr>
					<td>${list.VNAME}</td>
					<td>${list.SUMR}</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
	<div id="chartContainer" style="height: 300px; width: 100%;"></div>
</body>
<script>
	var countdata = "${countdata}";
	console.log(countdata);
		
	window.onload = function () {
	  var chart = new CanvasJS.Chart("chartContainer", {
	     theme: "theme2",//theme1
	     title:{
	        text: "대학생 등/하교시 많이 다니는 장소 ?"              
	    },
	     data: [              
	     {
	        type: "column",
	        dataPoints: [
	        { label: "사과", y: 10 },
	        { label: "오렌지", y: 15 },
	        { label: "바나나", y: 25 },
	        { label: "망고", y: 30 },
	        { label: "포도", y: 28 },
	        ]
	     }
	     ]
	  });
	  chart.render();
	}
	</script>

</html>
