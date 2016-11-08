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

</body>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
	var countdata = "${countdata}";
	console.log(countdata);
</script>
</html>
