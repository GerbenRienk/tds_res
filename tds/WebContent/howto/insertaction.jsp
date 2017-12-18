<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: using the insert action in combination with show / hide" /> 
<meta name="keywords" content="openclinica 3.1 training conditional display status open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: using the insert action (OC 3.1)</title>
<link rel="stylesheet" type="text/css" media="screen, projection" href="/tds/css/screen.css" />
<script src="/tds/js/jquery-1.2.6.min.js" type="text/javascript"></script>
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
			<h3>using the InsertAction</h3>
			
			<p>Another completely new feature of version 3.1 is the InsertAction. 
			We can use this to insert a value into a CRF-item, under certain conditions. 
			Now we already have something similar in the calculated field. For example we can insert the BMI in a field when we know the 
			length and weight of a Subject. But the limitations are that the calculation is always executed and that you can only 
			use items of the same CRF. </p>
			
			<p>
			<img src='/tds/img/ImagesHowTo/insertaction/img01.jpg' border='0'  class='photo'/><br />
			fig. 1: CRF with three items
			</p>
		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
