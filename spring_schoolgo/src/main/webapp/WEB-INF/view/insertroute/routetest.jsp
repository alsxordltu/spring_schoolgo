<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type='text' id="text2" name='text2' value="안들어왔지롱">
</body>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
	$(document).ready(function(){
		var string = opener.document.all.selectedstring.value;
		$("#text2").val(string);
	});
</script>
</html>