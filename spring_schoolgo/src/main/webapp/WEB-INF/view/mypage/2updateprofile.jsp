<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML>

<!--
   Striped by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="my_css/main.css" />
   <head>
      <title>개인정보 수정</title>
<link rel="shortcut icon" type="image/x-icon" href="main_img/titleicon.ico" />
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
      <link rel="stylesheet" href="my_css/main.css" />
      <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
   </head>
   <body>

      <!-- Content -->
         <div id="content">
            <div class="inner">

         <article class="box post post-excerpt">
         
            <!-- 헤더부분 -->
            <header >
            <h2 align="center"><img src="my_img/update.png" width="80%"></h2>
               <p align="center">갠정보수정!</p>
            </header>
            
            
         </article>
         
            <sform:form method="post" action="updateUser" modelAttribute="user">
            <div id="updateprofile">
                  <div class="field">
                  <div id="updatett">
                  <h5>아이디</h5>
                  </div>
                  <div id="updatetext">
                     <sform:input path="userId" placeholder="Id" readonly="true" />
                     <sform:errors element="span" path="userId">
                  </sform:errors>
                     
                     </div>
                  </div>
                  
                  
                  <div class="field">
                  <div id="updatett">
                  <h5>비밀번호</h5>
                  </div>
                  <div id="updatetext">   
                     <sform:input type="password" path="pass" placeholder="Pass" />
                     <sform:errors element="span" path="pass">
                  </sform:errors>
                     
                  </div>
                  </div>
                  
                  
                  <div class="field">
                  <div id="updatett">
                  <h5>이름</h5>
                     </div>
                     <div id="updatetext">   
                     <sform:input path="userName" placeholder="Name" />
                     <sform:errors element="span" path="userName">
                  </sform:errors>
                     
                     </div>
                  </div>
                  
                  
                  <div class="field">
                  <div id="updatett">
                  <h5>닉네임</h5>
                     </div>
                     <div id="updatetext">   
                     <sform:input path="nickName" placeholder="Nickname" />
                     <sform:errors element="span" path="nickName">
                  </sform:errors>
                     
                     </div>
                  </div>
                  
                  
                  <div class="field">
                  <div id="updatett">
                  <h5>이메일</h5>
                     </div>
                     <div id="updatetext">
                     <sform:input type="email" path="email" placeholder="Email" />
                     <sform:errors element="span" path="email">
                  </sform:errors>
                     
                     </div>
                  </div>
                  
                  
                  <div class="field">
                  <div id="updatett">
                  <h5>전화번호</h5>
                     </div>
                     <div id="updatetext">
                     <sform:input type="text" path="phoneNum" placeholder="Phone" />
                     <sform:errors element="span" path="phoneNum">
                  </sform:errors>
                     
                     </div>
                  </div>
            </div>
            
            <div id="updatebtn">
                     <input type="submit" value="수정하기" >
                     <input type="button" onclick="location.href='gotomain#mypage'"
                        value="돌아가기">
                     <input type="button" onclick="location.href='deleteUser?id=${userId}'"
                        value="회원탈퇴">
                  </div>
            </sform:form>
            
            
            <br>   
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
        <div id="userinfodiv"> 
        <h5 id="welcomemsg">${nickName}님환영합니다!</h5>
        
		<input id="logoutbtn" type="submit" value="로그아웃">
 		</div>
      </form>

         <!-- Nav -->
         <nav id="nav">
            <ul>
               <li><a href="gotomain">학교가기</a></li>
               <li><a href="gotoinsertroute">루트등록</a></li>
               <li><a href="gotocontact">Contact Us</a></li>
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
            <li class="current"><a href="updateUser">개인정보 수정</a></li>
         </ul>
         
         </section>
        

      <ul id="copyright">
         <li>&copy; Six Company.</li>
         <li>Kongju Univ.<br> Computer Engineering</a></li>
      </ul>
   </div>

      <!-- Scripts -->
         <script src="main_js/jquery.min.js"></script>
         <script src="main_js/skel.min.js"></script>
         <script src="main_js/util.js"></script>
         <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
         <script src="main_js/main.js"></script>

   </body>
</html>