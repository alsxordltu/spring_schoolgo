<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
table {
	border: 1px solid;
}
</style>
</head>
<body>

	<input type="text" id="stationName">
	<button id="getdata" onclick="findStation()">검색</button>


	<%-- 	<table id="info">
		<tr><th>역코드</th><th>역명</th><th>호선</th><th>버튼</th></tr>
		<c:forEach var="result" items="${stationSearchResultList }" varStatus="status">
		
		<tr>
			<td><a href="<%=request.getContextPath()%>/EmpRetrieveServlet?empId=${employee.empId }">${employee.empId }</a></td>
			<td><input type="text" name="code${status.count }" value="${result.stationCode }" ></td>
			<td><input type="text" name="stationName${status.count }" value="${result.stationName }" ></td>
			<td><input type="text" name="lineNum${status.count }" value="${result.lineNum }"></td>
			<td><input type="button"  id="select" value="선택"  onclick="selectStation(${result.stationCode },${result.stationName })" data-stationCode="${result.stationCode }"  data-stationName="${result.stationName }"></td>
		</tr>
	</c:forEach>
	</table>
 --%>
	<div id="map" style="width: 500px; height: 400px;"></div>
	<script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=3e62ecc809bbf6026130d87653a9dd87"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(33.450701, 126.570667),
			level : 3
		};

		var map = new daum.maps.Map(container, options);
	</script>

</body>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
	function findStation() {
		var string = $("#stationName").val();
		location.href = "findstation?input=" + string;
	}

	$(document).on(
			"click",
			"#select",
			function(e) {

				opener.document.all.resultStationCode.value = $(this).attr(
						"data-stationCode");
				opener.document.all.resultStationName.value = $(this).attr(
						"data-stationName");
				window.close();
			});

	/*  function selectStation(code, name){
	 opener.document.all.resultStationName.value = code;
	 opener.document.all.resultStationName2.value = name;
	
	 }  */

	/* $("#select1").on("click", function(){
	 console.log("hello");
	 }); */

	/*  <c:url value="/findstation" var="fstation" />
	 $("#getdata").on("click", function(){
	
	 $.ajax({
	 url:"${fstation}",
	 type:"post",
	 data:{
	 "input" : $("#stationName").val()
	 },
	 success:function(res){
	 console.log(res)
	 var row = "";
	 row += 	"<tr><th>역명</th><th>호선</th><th>선택</th></tr>";
	 $(res).each(function(index, data){
	 var name = data.stationName;
	 var line = data.lineNum;
	 row += "<tr><td>"+name+"</td><td>"+line+"</td><td><input type='button' action='test()' value='선택'></td></tr>";
	 });
	 $("#info").html($("#info").html()+row);
	 },
	 error : function(xhr, status, error){
	 alert(error);
	 }
	 });
	 });
	 */
</script>
</html>