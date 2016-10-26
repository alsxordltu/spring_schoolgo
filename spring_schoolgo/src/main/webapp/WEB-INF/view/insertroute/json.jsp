<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="button" id="checkId" value="데이터 불러오기">
</body>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
<c:url value="/duplicationCheckId" var="check" />
    $("#checkId").on("click", function(){
       $.ajax({
          url : "${check}",
          type : "post",
          data : {
             "id" : $("#userId").val()
          },
          success:function(res){
             if(res==0){
                alert("중복 ID입니다.");
             }else{
                alert("사용 가능한 ID입니다.");
             }
             
             
          },
          error : function(xhr, status, error){
             alert(error);
          }
       });
    });
</script>

</html>