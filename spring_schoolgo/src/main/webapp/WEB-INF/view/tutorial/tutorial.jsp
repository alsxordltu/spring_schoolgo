<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Simplex</title>
<meta charset="utf-8">

<script src="tutorial_js/jquery.js"></script>
<script src="tutorial_js/jquery-migrate-1.1.1.js"></script>
<script src="tutorial_js/tms-0.4.1.js"></script>
<script>
	$(document).ready(function() {
		$('.slider_wrapper')._TMS({
			show : 0,
			pauseOnHover : false,
			prevBu : '.prev',
			nextBu : '.next',
			playBu : false,
			duration : 800,
			preset : 'fade',
			pagination : true, //'.pagination',true,'<ul></ul>'
			pagNums : false,
			slideshow : 16000,		//페이지 넘어가는 속도
			numStatus : false,
			banners : 'fade',
			waitBannerAnimation : false,
			progressBar : false
		});
	});
</script>
<style>


html {
	width: 100%;
}

/* 기본버튼핫핑 */
.signUpButton {
	display: inline-block;
	vertical-align: top;
	width: 300px;
	height: 60px;
	padding: 10px;
	font-size: 22px;
	color: white;
	text-align: center;
	text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
	background: #FF66FF;
	border: 0;
	border-bottom: 2px solid #D76B60;
	border-radius: 5px;
	cursor: pointer;
	-webkit-box-shadow: inset 0 -3px #D76B60;
	box-shadow: inset 0 -3px #FF00CC;
}

/* 기본버튼 핫핑 눌렀을때 눌리는 모션*/
.signUpButton:active {
	top: 2px;
	outline: none;
	-webkit-box-shadow: none;
	box-shadow: none;
}

#page1 {
	font: 13px/20px 'Helvetica Neue', Helvetica, Arial, sans-serif;
	
	padding-bottom: 191px;
}

.content {
	padding-top: 125px;
	text-align: center;
	position: relative;				/* 상단 패딩 */
}

.container_12 {
	margin-left: auto;
	margin-right: auto;
	width: 960px;
	height: 700px;				/* 콘테이너 */
}

.grid_12 {
	display: block;
	float: left;
	margin-left: 10px;
	margin-right: 10px;
	}


.container_12 .grid_12 {
	width: 940px;
}

.slider_wrapper {
	overflow: hidden;
	position: relative;
	z-index: 0;
	width: 940px;
	height: 700px;				/* 실제 출력물 크기 */

}

.clearfix:before, .clearfix:after, .container_12:before, .container_12:after
	{
	content: '.';
	display: block;
	overflow: hidden;
	visibility: hidden;
	font-size: 0;
	line-height: 0;
	width: 0;
	height: 0;
	clear: both;
	zoom: 1;
}

body {
	font: 13px/19px  Arial, Helvetica, sans-serif;
	color:#ecedef;
	position:relative;
	min-width:960px;
	background: #334960;
	height: 100%;
		background-color: #ffffff;
		background-image: url("tutorial_img/overlay.png"), -moz-linear-gradient(60deg, rgba(255, 165, 150, 0.5) 5%, rgba(0, 228, 255, 0.35)), url("tutorial_imgbg.jpg");
		background-image: url("tutorial_img/overlay.png"), -webkit-linear-gradient(60deg, rgba(255, 165, 150, 0.5) 5%, rgba(0, 228, 255, 0.35)), url("tutorial_img/bg.jpg");
		background-image: url("tutorial_img/overlay.png"), -ms-linear-gradient(60deg, rgba(255, 165, 150, 0.5) 5%, rgba(0, 228, 255, 0.35)), url("tutorial_img/bg.jpg");
		background-image: url("tutorial_img/overlay.png"), linear-gradient(60deg, rgba(255, 165, 150, 0.5) 5%, rgba(0, 228, 255, 0.35)), url("tutorial_img/bg.jpg");
		background-repeat: repeat,			no-repeat,			no-repeat;
		background-size: 100px 100px, cover,				cover;
		background-position: top left,		center center,		bottom center;
		background-attachment: fixed,			fixed,				fixed;
	
}
h3 {
	font-size: 48px;
	line-height: 54px;
		font-weight: normal;
	font-family: 'Signika', sans-serif;
	color: #ecedef;
}
.rightsort {
	text-align: right;
}

img {
	vertical-align: top;
}
 u, ul {
	background: transparent;
	border: 0 none;
	font-size: 100%;
	margin: 0;
	padding: 0;
	border: 0;
	outline: 0;
	vertical-align: top;
}

ol, ul {
	list-style: none;
}

.caption {
	left: 0px;
	right: 0px;
	top: 0;
	bottom: 0;
	position: absolute;
	z-index: 1 !important;

}
.pagination  {
	display: block;
	position: absolute;
	left: 50%;
	bottom: 73px;
	width: 178px;
	height: 32px;
	margin-left: -89px;
	overflow: hidden;
	right: 0;
	z-index: 999;
	text-align: left;

}
.pagination li {
	float: left;
}
.pagination li+li {
	margin-left: 16px;
}
.pagination li a {
	display: block;
	width: 32px;
	cursor: pointer;
	height: 32px;
	background: url(tutorial_img/pagination.png) right 0 no-repeat;
	overflow: hidden;
	color: transparent;
	text-indent: -100px;
	transition: 0s ease;
	-o-transition: 0s ease;
	-webkit-transition: 0s ease;
}
.pagination li a:hover, .pagination li.current a {
	background-position: 0 0;
	cursor: pointer;
}

#logo{
	padding : 12px 20px 20px 12px;
	
	width:435px;
	height:50px;
	float:left;
} 

#hello{
	padding : 40px 20px 20px 12px;
	width:450px;
	height:50px;
	float:left;
} 



</style>
</head>




<body>

<div id="head">

<div id="logo">
<img src="main_img/gogo.png" alt="" width="300">
</div>

<div id="hello">
<h1>000님 가입을 환영합니다!</h1>
</div>


</div>




	<div id="page1" class="content">
		<div class="container_12">
			<div class="grid_12">
				<div class="slider_wrapper">
					<ul class="items">
						
						
						<li><img src="tutorial_img/spacer.gif" alt="">
							<div class="caption banner">
							
<img src="tutorial_img/tutoimg.png" style="margin:0 50px 0 50px; display: block; 
		width: 800px; height:500px; padding: 50px;">
						</div></li>
						
						
						
						<li><img src="tutorial_img/spacer.gif" alt="">
							<div class="caption banner">
								<h3>루트명과 교통수단, 전철역을 입력하고 등록하세요!</h3>
							</div></li>
						
						
						<li><img src="tutorial_img/spacer.gif" alt="">
							<div class="caption banner">
								<h3>등교시간을 등록해서 편하게 가야할 시간을 받아오세요!</h3>
								<h3>등록하지 않아도, 시간을 입력하면 됩니다!</h3>
							</div></li>
						
						
						<li><img src="tutorial_img/spacer.gif" alt="">
							<div class="caption banner">
								<h3>게시판을 이용해 나만의 루트를 공유하세요!</h3>
							</div></li>
					</ul>
				</div>
				<div class="rightsort">
					<form action="gotomain" class="signUp" id="start"
						name="startbutton">
						
						<input type="submit" value="시작하기" class="signUpButton">
					</form>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>