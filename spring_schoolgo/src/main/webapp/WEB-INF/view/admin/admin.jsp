<!DOCTYPE HTML>	
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<title>Admin Template</title>
		<link rel="stylesheet" href="admin_css/style.css" type="text/css" media="screen" charset="utf-8" />	</head>
	<body>
		<c:forEach items="${countdata}" var="list">
		 ${list} <br>
		 ${list.sumr}<br>
		</c:forEach>
		 
	</body>
<script src="http://code.jquery.com/jquery.js"></script>
	<script>
		var countdata ="${countdata}";
		console.log(countdata);
		
	</script>
</html>