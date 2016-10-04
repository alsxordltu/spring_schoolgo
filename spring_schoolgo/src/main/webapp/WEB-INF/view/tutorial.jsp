<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Simplex</title>
<meta charset="utf-8">


<link rel="stylesheet" href="tutorial/css/style.css">
<link rel="stylesheet" href="tutorial/css/camera.css">
<script src="tutorial/js/jquery.js"></script>
<script src="tutorial/js/jquery-migrate-1.1.1.js"></script>
<script src="tutorial/js/tms-0.4.1.js"></script>


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
			slideshow : 8000,
			numStatus : false,
			banners : 'fade',
			waitBannerAnimation : false,
			progressBar : false
		});
	});
</script>
<style>
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
	color: #333333;
	background: #FFCCFF; /* 연핑 */
	padding-bottom: 191px;
}

.rightsort {
	text-align: right;
}
</style>
</head>




<body>
	<div id="page1" class="content">
		<div class="container_12">
			<div class="grid_12">
				<div class="slider_wrapper">
					<ul class="items">
						<li><img src="tutorial/images/spacer.gif" alt="">
							<div class="caption banner">
								<img src="tutorial/images/schoolgo.png"
		style="margin-left: auto; margin-right: auto; display: block; width: 800px; height:440px; padding: 50px;">
						</div></li>
						<li><img src="tutorial/images/spacer.gif" alt="">
							<div class="caption banner">
								<h3>루트명과 교통수단, 전철역을 입력하고 등록하세요!</h3>
							</div></li>
						<li><img src="tutorial/images/spacer.gif" alt="">
							<div class="caption banner">
								<h3>등교시간을 등록해서 편하게 가야할 시간을 받아오세요!</h3>
								<h3>등록하지 않아도, 시간을 입력하면 됩니다!</h3>
							</div></li>
						<li><img src="tutorial/images/spacer.gif" alt="">
							<div class="caption banner">
								<h3>게시판을 이용해 나만의 루트를 공유하세요!</h3>
							</div></li>
					</ul>
				</div>
				<div class="rightsort">
					<form action="gotoindex" class="signUp" id="start"
						name="startbutton">
						<input type="submit" value="시작하기" class="signUpButton">
					</form>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>