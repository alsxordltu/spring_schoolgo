<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>

<title>Insert title here</title>
<style>
	img{
		width: 100px;
	}
</style>
</head>
<body>
	<button id = "getData">데이타 요청</button>
	
	<table id = "info">
		<tr>
			<th>title</th><th>tel</th><th>img</th><th>addr</th>
		</tr>
	
	</table>
	
	
</body>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
	var key = "SWOqe1xJ80NQHr%2BIGIrR5NcVLSfrw0lnvbGs0CgTGApdihm0E9CTIr1HG2zDUFnG21ibnxCofdJT69N4Ld9EiA%3D%3D";
	$("#getData").on("click",function(){
		var myurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=SWOqe1xJ80NQHr%2BIGIrR5NcVLSfrw0lnvbGs0CgTGApdihm0E9CTIr1HG2zDUFnG21ibnxCofdJT69N4Ld9EiA%3D%3D&areaCode=35&MobileOS=ETC&MobileApp=AppTestinghttp://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=SWOqe1xJ80NQHr%2BIGIrR5NcVLSfrw0lnvbGs0CgTGApdihm0E9CTIr1HG2zDUFnG21ibnxCofdJT69N4Ld9EiA%3D%3D&areaCode=35&MobileOS=ETC&MobileApp=AppTesting&_type=json";
		
		
		$.ajax({
			url:myurl,
			type:"get",
			success:function(responseTxt){
				
				var itemArray = responseTxt.response.body.items.item;
				var row="";
				$.each(itemArray,function(index,item){
					var title = item.title;
					var tel = item.tel;
					var img = item.firstimage;
					var addr = item.addr1;
					
					row +="<tr><td>"+title+"</td><td>"+tel+"</td><td>"+"<img src='"+img+"'>"+"</td><td>"+addr+"</td></tr>";
					
					console.log(title,tel,img,addr);
				});
				
				$("#info").html($("#info").html()+row);
				
				
				console.log(responseTxt);
			},
			error:function(xhr,status,error){
				alert("Fail : "+error);
			}
		});		
	});

</script>

</html>