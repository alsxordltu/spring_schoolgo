<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<!--
   Striped by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Striped by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="main_css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->


</head>
<body>

   <!-- Content -->
   <div id="content">
      <div class="inner">

            <article class="box post post-excerpt">
               <header>
                  <h2 align="center"><img src="main_img/contact.png" width="80%"></h2>
                  <p align="center">불편사항 건의사항
               </header>
            </article>
                       
<div id="contactus">

<div id="contact1">
<h5><span id="contact1span">Contact Us</span></h5>
<ul id="contact1ul">

<li>
<span id="tit">Address.</span>
<span id="contt">충청남도 천안시 서북구 천안대로 1223-24 8공학관 717호</span>
</li>

<li>
<span id="tit">Tel.</span>
<span id="contt">010-6346-6473</span>
</li>

<li>
<span id="tit">Fax.</span>
<span id="contt">04102323101</span>
</li>

<li>
<span id="tit">담당자</span>
<span id="contt">최찬섭 / ccs6473@naver.com</span>
</li>

</ul>
</div>






<div id="contact3">
<h5><span id="contact3span">Questions</span></h5>
<ul id="contact1ul">

<li>
<span id="tit">이름<font style="color:red;">&#42;</font></span>
<span id="contt"><input type="text" id="shorttextbox"></span>
</li>

<li>
<span id="tit">연락처<font style="color:red;">&#42;</font></span>
<span id="contt"><input type="text" id="shorttextbox"></span>
</li>

<li>
<span id="tit">이메일<font style="color:red;">&#42;</font></span>
<span id="contt"><input type="text" id="shorttextbox"></span>
</li>

<li>
<span id="tit">문의유형</span>
<span id="contt">
<select id="shorttextbox">
<option>선택하세요</option>
<option>회원가입/로그인</option>
<option>탈퇴문의</option>
<option>일반문의</option>
<option>개선/제안</option>
<option>사업문의</option>
</select></span>
</li>


<li>
<span id="tit2">문의내용</span>
<span id="contt"><textarea id="longtextbox"></textarea></span>
</li>
</ul>

<div id="sendbtndiv">
<input id="sendbtn" type="button" value="보내기">
</div>


</div>






<div id="contact2">
<h5><span id="contact2span">Location</span></h5>
<iframe id="gmap" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4515.197547335777!2d127.15038434467891!3d36.84901844349274!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b28c12a18e90f%3A0x95df92b0331c5c65!2z6rO17KO864yA7ZWZ6rWQIOyynOyViOy6oO2NvOyKpA!5e0!3m2!1sko!2s!4v1478572673488" frameborder="0" style="border:0"></iframe>
</div>



</div>






      </div>
   </div>


   <!-- Sidebar -->
   <div id="sidebar">

      <!-- Logo -->
      <h1 id="logo">
         <a href="gotomain"><img src="main_img/gogowhite.png"
            width="150px" alt="" /></a>
      </h1>
      <form name="logout" action="logout">
         <h5 style="text-align: center">${nickName}님환영합니다</h5>


         <!-- Nav -->
         <nav id="nav">
            <ul>
               <li><a href="gotomain">학교가기</a></li>
               <li><a href="gotoinsertroute">루트등록</a></li>
               <li><a href="gotoboardmain">루트공유</a></li>
               <li class="current"><a href="gotocontact">Contact Me</a></li>
               <li><a href="gotoadmin">Admin page</a></li>
            </ul>
         </nav>



         <!-- Recent Posts -->
         <section class="box recent-posts">
            <header>
               <h2>마이페이지</h2>
            </header>
           <ul id="mypageside">
            <li><a href="updateTimetable">시간표 등록</a></li>
            <li><a href="updateUser">개인정보 수정</a></li>
            <li><a href="gotoroutemanager">루트관리</a></li>
            <li><a href="gotocostcal">교통비 가계부</a></li>
            <li><a href="gotomyactivity">활동내역</a></li>
         </ul>
         
         </section>
         <input type="submit" value="로그아웃">
      </form>

      <ul id="copyright">
         <li>&copy; Untitled.</li>
         <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
      </ul>
   </div>
   

   <script src="main_js/jquery.min.js"></script>
   <script src="main_js/skel.min.js"></script>
   <script src="main_js/util.js"></script>
   <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
   <script src="main_js/main.js"></script>
   <script src="http://code.jquery.com/jquery.js"></script>
   
   <script>
   </script>

</body>
</html>