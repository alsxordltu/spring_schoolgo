<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
	<meta content="charset=utf-8">
	<title>FlexSlider 2</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link rel="stylesheet" href="tutorial_css/demo.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="tutorial_flex/flexslider.css" type="text/css" media="screen" />
  <script src="tutorial_js/modernizr.js"></script>
</head>
<body class="loading">

  <div id="container" class="cf">
    <div id="main" role="main">
      <section class="slider">
        <div class="flexslider">
          <ul class="slides">
          
            	<li>
            	<div id="tutodiv1">
  	    	    <img id="tuto1img" src="tutorial_img/tutoimg.png">
                </div>
  	    		</li>
  	    		
  	    		<li>
  	    	    <img src="tutorial_img/kitchen_adventurer_lemon.jpg" />
              <p class="flex-caption">루트명과 교통수단, 전철역을 입력하고 등록하세요!</p>
  	    		</li>
  	    		<li>
  	    	    <img src="tutorial_img/kitchen_adventurer_donut.jpg" />
              <p class="flex-caption">등교시간을 등록해서 편하게 가야할 시간을 받아오세요!</p>
  	    		</li>
  	    		
  	    		<li>
  	    	    <div class="rightsort">
					<form action="gotomain" class="signUp" id="start"
						name="startbutton">
						
						<input type="submit" value="시작하기" class="signUpButton">
					</form>
				</div>
              <p class="flex-caption">게시판을 이용해 나만의 루트를 공유하세요!</p>
  	    		</li>
          </ul>
        </div>
      </section>
      
 
    </div>

  </div>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="js/libs/jquery-1.7.min.js">\x3C/script>')</script>
  <script defer src="tutorial_flex/jquery.flexslider.js"></script>
  <script type="text/javascript">
    $(function(){
      SyntaxHighlighter.all();
    });
    $(window).load(function(){
      $('.flexslider').flexslider({
        animation: "slide",
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
    });
  </script>

  <!-- Syntax Highlighter -->
  <script type="text/javascript" src="tutorial_js/shCore.js"></script>
  <script type="text/javascript" src="tutorial_js/shBrushXml.js"></script>
  <script type="text/javascript" src="tutorial_js/shBrushJScript.js"></script>


  <!-- Optional FlexSlider Additions -->
  <script src="tutorial_js/jquery.easing.js"></script>
  <script src="tutorial_js/jquery.mousewheel.js"></script>
  <script defer src="tutorial_js/demo.js"></script>

</body>
</html>