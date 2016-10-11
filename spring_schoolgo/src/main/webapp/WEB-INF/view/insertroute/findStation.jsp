<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<button id="getdata">역 검색</button>
	<table id="info">
		
		
	</table>
</body>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
<c:url value="/findstation" var="fstation" />
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
					row += "<tr><td>"+name+"</td><td>"+line+"</td><td><input type='button' value='선택'></td></tr>";
				});
				$("#info").html($("#info").html()+row);
			},
			error : function(xhr, status, error){
				alert(error);
			}
		});
	});
	/* $("#getdata").on("click", function(){
		var key = "9nRC4NTh4waNv7iJtSs7W%2BddezbrVvRMb2uaeoM2XVenvorbVJARTyddCJPpzEurbhXBY8KbrZXBlMF4zmEkIg%3D%3D";
		//var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=9nRC4NTh4waNv7iJtSs7W%2BddezbrVvRMb2uaeoM2XVenvorbVJARTyddCJPpzEurbhXBY8KbrZXBlMF4zmEkIg%3D%3D&contentTypeid=15&areaCode=4&sigunguCode=4&MobileOS=ETC&MobileApp=AppTesting&_type=json";
		var url = "http://openapi.seoul.go.kr:8088/4e6974774f616c733130374851774c43/json/StationDstncReqreTimeHm/1/122";
		/* var url = "http://openAPI.seoul.go.kr:8088/6479647361616c7332334e757a6d4e/json/SearchSTNBySubwayLineService/1/150/1/"; */
		
/* 		$.ajax({
			url:url,
			type:"get",
			success:function(responseTxt){
				var items = responseTxt.StationDstncReqreTimeHm.row;
				var row = 	"<tr><th>호선</th><th>역명</th><th>거리</th><th>누계</th><th>시간(분)</th></tr>";
				$.each(items, function(index, item){
					var line = item.LINE;
					var statn = item.STATN_NM;
					var dstnc = item.DSTNC;
					var acmtl = item.ACMTL;
					var mnt = item.MNT;
					row += "<tr><td>"+line+"</td><td>"+statn+"</td><td>"+dstnc+"</td><td>"+acmtl+"</td><td>"+mnt+"</td></tr>"
					console.log(line,statn,dstnc,acmtl,mnt);
				});
				$("#info").html($("#info").html()+row);
				
			},
			error:function(xhr, status, error){
				alert("fail: "+error);
			}
		});
	}); */
</script>
</html>