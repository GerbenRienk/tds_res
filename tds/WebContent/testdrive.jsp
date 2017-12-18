<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="If you want to experiment with OpenClinica, before you decide to use it 
as datamanegement software for your clinical trial" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc" /> 
<title>Trial Data Solutions: try OpenClinica</title>
<link rel="stylesheet" type="text/css" media="screen, projection" href="css/screen.css" />
<script src="js/jquery-1.2.6.min.js" type="text/javascript"></script>
<script type="text/javascript">
	// Toggle advanced options
	$(document).ready(function(){
		$("#loc-adv a").click(function(){
			$("#map").slideToggle("slow");
			return false;
		});
	});

	// Add .last class to certain lists
	$(document).ready(function(){
		$("ul.lst li:last, ul.press li:last").addClass("last");
		});
</script>
<script src="/tds/js/ga.js" type="text/javascript"></script>
</head>

<body>
<%@ include file="/includes/headermenu.jsp" %>
<hr />

<div id="wrap" class="group">
	
	<div class="main">		
		
		<div class="entry group">
			<h3>Try it yourself</h3>
				
			<div class="entry-body">
<p>Of course no screenshot can ever compete with a real testdrive: being an OpenClinica-user and entering data will not give you the look and feel, no: it's the real thing.<br />
When you click on the link "start OpenClinica" a new browser window will open with the login.<br />
Fill in for User Name <b>"testuser"</b><br />
and for Password <b>"trialdatasolutions"</b><br />
and click the button labeled "Login".
</p>
<p><a href='/OpenClinica' target='_blank'>start OpenClinica</a></p>
<p>
That's it: you're in. Look around and click and type away.<br />
(Detailed instructions on what you can do will follow shortly on this site.)
</p>
				<p><br /><br /><br /><br /><br /><br /><br /><br /><br /></p>
			</div>
		</div>

	</div> <!-- /.main -->
	
	<hr />

<%@ include file="/includes/news.jsp" %>

	<div class="secondary"> <!-- /.photo -->
		<div class="mod">
		<img src='/tds/img/StethoscopeGlassesNotebook.jpg' border='0' width='100%' />
		</div>
	</div> <!-- /.secondary -->

<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
