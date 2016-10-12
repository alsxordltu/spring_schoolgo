<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Astral by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="my_css/main.css" />
<link rel="stylesheet" href="my_css/form.css" />
</head>
<body>

	<!-- Wrapper-->
	<div id="logo">
		<a href='gotomain'><img src="my_img/gogo.png" alt="" width="300"></a>
	</div>

	<div id="wrapper">

		<nav id="nav" class="navtable" style="display: block;">
			<div style="float: left; width: 220px; height: 100px"></div>
			<a id="animate"><i class="icon fa-user fa-lg">Cost</i></a>
		</nav>

		<!-- Main -->
		<div id="main">

			<!-- Me -->
			<article id="me" class="panel"
				style="padding: 50px 100px 50px 100px;">

				<div style="height: 50px;">
					<h1 style="text-align: center;">교통비가계부</h1>
				</div>

				<div style="height: 300px;">
					<label for="from">From</label>
					<input type="text" id="from" name="from">
					
					<label for="to">to</label>
					<input type="text" id="to" name="to">
				</div>


				<div style="height: 300px;">
					<a href='gotomain#mypage'><input type="button" value="마이페이지로"></a>
				</div>
			</article>
		</div>

		<!-- Footer -->
		<div id="footer">
			<ul class="copyright">
				<li>&copy; Untitled.</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>
	</div>

	<!-- Scripts -->
	<script src="my_js/jquery.min.js"></script>
	<script src="my_js/skel.min.js"></script>
	<script src="my_js/skel-viewport.min.js"></script>
	<script src="my_js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="my_js/main.js"></script>
	<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">



	<script>
	  $( function() {
	    var dateFormat = "mm/dd/yy",
	      from = $( "#from" )
	        .datepicker({
	        	
	        	defaultDate: "+1w",
	          changeMonth: true,
	        
	          changeYear: true,
	 		 nextText: '다음 달',
	 		 prevText: '이전 달'
	        })
	        .on( "change", function() {
	          to.datepicker( "option", "minDate", getDate( this ) );
	        }),
	      to = $( "#to" ).datepicker({
	    	 
	    	  defaultDate: "+1w",
	        changeMonth: true,
	        
	        changeYear: true,
			 nextText: '다음 달',
			 prevText: '이전 달'
	      })
	      .on( "change", function() {
	        from.datepicker( "option", "maxDate", getDate( this ) );
	      });
	 
	    function getDate( element ) {
	      var date;
	      try {
	        date = $.datepicker.parseDate( dateFormat, element.value );
	      } catch( error ) {
	        date = null;
	      }
	 
	      return date;
	    }
	  } );
	 
		/* $(function() {
		 $(".datepicker").datepicker({
		 dateFormat : "yy/mm/dd",
		 changeMonth: true,
		 changeYear: true,
		 nextText: '다음 달',
		 prevText: '이전 달',
		 dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		 dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		 monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		 });
		

		 $('.ui-datepicker select.ui-datepicker-year').css('width', '20%').css('height', '15px').css('font-size','20px');
		 }); */
	</script>


	<script>
		$("document").ready(function() {
			$("#animate").animate({
				left : 160
			/* top:-140 */
			});
		});
	</script>
</body>
</html>