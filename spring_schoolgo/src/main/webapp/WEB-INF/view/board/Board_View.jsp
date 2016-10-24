<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 읽기</title>
<script type="text/javascript">
	function move(url) {
		location.href=url;
	}
	function boardViewCheck() {
		var form = document.BoardViewForm;
		return true;
	}
</script>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
	font-family: 'Nanum Gothic', sans-serif;
}
</style>
</head>

<body>
	<form name="BoardViewForm" method="post">
	<table summary="전체 테이블 구성">
	<tr>
		<td ><div align="center"><h3><b>글 읽기</b></h3></div></td>
	</tr>
	<tr>
		<td colspan=2>
		<table border="1" summary="목록 테이블 구성"> 
    <tr> 
		<td align=center bgcolor=#dddddd width=20%> 작성자</td>
		<td bgcolor=#ffffe8 width=40%>닉네임뭐짓지메롱아</td>
		<td align=center bgcolor=#dddddd width=50%> 작성일</td>
		<td bgcolor=#ffffe8 width=40%>2015/11/23</td>
	</tr>
    <tr>
		<td align=center bgcolor=#dddddd> E-mail </td>
		<td bgcolor=#ffffe8 >asdfsd@asdfasdf</td> 
		<td align=center bgcolor=#dddddd> 두둠칫 </td>
		<td bgcolor=#ffffe8><a href="http://hunit.tistory.com" target="_new">두둠칫</a></td> 
	</tr>
	<tr> 
		<td align=center bgcolor=#dddddd> 제 목</td>
		<td bgcolor=#ffffe8 colspan=3> 글제목x1000000</td>
   </tr>
   <tr> 
		<td colspan=4><br>으어어어어게시판테스트뷰우우우으우으우으ㅜ으<br></td>
   </tr>
   <tr>
		<td colspan=4 align=right> 조회수  : ㅇㅅㅇ~~~~~</td>
   </tr>
	</table>
	</td>
 	</tr>
	<tr>
		<td align=center colspan=2> 
		<hr size=1>
		<div align="center">
		[ <input type="button" value="목록" onclick="location.href='gotoboardlist'">[  
		<input type="button" value="수정" onclick="location.href='gotoboardupdate'"> |
		<input type="button" value="답변" onclick="location.href='gotoboardreply'"> |
		<input type="button" value="삭제" onclick="location.href='gotoboarddelete'">]<br>
		</div>
		</td>
	</tr>
	</table>
</form>

</body>
</html>