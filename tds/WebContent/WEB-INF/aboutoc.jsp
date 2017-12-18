<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="introduction to OpenClinica, its background and many advantages" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc ecrf Nederland Netherlands Holland" /> 

<title>Trial Data Solutions: about OpenClinica</title>
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
			<h3>About OpenClinica</h3>
			<div class="entry-body">
			<p>This page is about OpenClinica. If you're already familiar with the product and you're 
			interested in what Trial Data Solutions can do for you, go to the <a href='/tds/'>main page</a>.<br />
			If you have a specific question or problem, <a href='mailto:info@trialdatasoulions.com'>contact</a> us or have a look at the <a href='/tds/howto/'>how-to-pages</a>.</p>

			<p class='question'>what does it do?</p>
			<p>OpenClinica is (opensource) software designed for datamanagement of clinical trials. It runs via the internet, 
			so you can conduct a trial in several sites all over the world, provided they are connected to the internet.<br /> 
			You can define a study, sites, investigators and dataentry-persons. Then you design your CRF's plus checks. 
			As a last step you define your subjects and you're ready to go.   </p>
			
			<p class='question'>how much does it cost?</p>
			<p>
			Being open source it is <b>free</b>: you can download your copy from 
			<a href='http://www.openclinica.com' target='_blank'>http://www.openclinica.com</a>. 
			All you have to do is create an account there and follow the instructions.	
			</p>
			
			<p class='question'>how difficult is it to set up CRF's?</p>
			<p>Electronic Data Collection has never been so <b>easy</b>. If you know what items you want on your CRF's
			and you know what kind of responses you want, all you have to do is type them in an XL-sheet and upload the sheet. 
			OpenClinica generates the screen.</p>

			<p class='question'>what about validations, discrepancies and queries?</p>
			<p>OpenClinica has a versatile system for checks and notes.
			You can specify both uni-variate and multi-variate checks. Any discrepancies can be routed to other user-functions,
			to be resolved. Plus notes can be added to any data-point. </p>

			<p class='question'>how do I get my data to do an analysis?</p>
			<p>At any given moment during your trial you can get the complete dataset, or a subset. This subset can be a specific 
			group of study participants, or a set of responses, or a specific time frame, or a combination: anything you want. 
			Once you have defined this set you can choose the format: tab-delimited <b>text</b>, <b>SPSS</b> or <b>CDISC</b>, 
			which is handy if you use <b>SAS</b> and want to run 'PROC CDISC'. And the nice thing is: you decide what and when. 
			You don't need to a DatabaseAdministrator to prepare the data and send them to you.</p>
			
			<p class='question'>can I import data from for example my lab-system?</p>
			<p>OpenClinica can import any data in XML-format, as specified by the CDISC, the so-called ODM-format.</p>
			</div>
		</div>

	</div> <!-- /.main -->
	
	<hr />

<%@ include file="/includes/news.jsp" %>

	<div class="secondary"> <!-- /.photo -->
		<div class="mod">
		<img src='/tds/img/DoctorsGroup.jpg' border='0' width='100%' />
		</div>
	</div> <!-- /.secondary -->
	
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
