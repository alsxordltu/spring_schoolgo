<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
	table{
		border: 1px solid;
	}
</style>
</head>
<body>
	
	<input type="text" id="stationName">
	<button id="getdata" onclick="findStation()">역 검색</button>
	<table id="info">
		
		
	</table>
</body>
<script src="http://code.jquery.com/jquery.js"></script>
<script>

function findStation(){
	var string = $("#stationName").val();
	location.href="findstation?input="+string;
}

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