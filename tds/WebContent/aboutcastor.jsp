<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="introduction to Castor EDC, its background and many advantages" /> 
<meta name="keywords" content="Castor training open source software clinical trials datamanagement 
non-profit academic edc ecrf Nederland Netherlands Holland" /> 

<title>Trial Data Solutions: about Castor</title>
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
			<h3>About Castor</h3>
			<div class="entry-body">
<p>This page is about Castor. If you're already familiar with the product and you're 
interested in what Trial Data Solutions can do for you, go to the <a href='/tds/'>main page</a>.<br />
If you have a specific question or problem, <a href='mailto:info@trialdatasolutions.com'>contact</a>
 us.
<!-- 
or have a look at the <a href='/tds/castorhowto/'>how-to-pages</a> --></p>

<p>If you are not sure whether it is best to choose OpenClinica or Castor: <a href='mailto:info@trialdatasolutions.com'>contact</a> us so we can discuss
your situation and find what's best suited for you. (And don't worry: we have no financial interests in either one of them.)</p>

<p class='question'>what does it do?</p>
<p>Castor is Software as a Service designed for data-management of clinical trials. It runs on servers maintained by Castor via the internet, 
so you can conduct a trial in several sites all over the world, provided they are connected to the internet.<br /> 
You can define a study, centers, users and roles for them. Then you design your structure, called phases and finally you 
build your forms, which come in three flavours: steps, reports and surveys. These surveys can be completed by the participants of your study.</p>

<p class='question'>how difficult is it to build forms?</p>

<p>If you know what items you want on your forms 
and you know what kind of responses you want and which options to choose from, Castor is pretty straightforward. 
All items will be displayed as one long list.
</p>

<p class='question'>what about validations, discrepancies and queries?</p>
<p>Castor has a system for validations and notes and the result can range from a <b>message</b>, via a <b>warning</b> to an <b>error</b>
 or to an <b>exclusion</b>, which stops all entry. You can specify both uni-variate and multi-variate checks.  
Plus notes can be added to any data-point.  <br />
You don't have time to learn all that? Let <a href='mailto:info@trialdatasolutions.com'>us</a> do it for you.</p>

<p class='question'>so it's easy to get data in, but how do I get my data out again to do an analysis?</p>
<p>At any given moment during your trial you can get the complete dataset, or a subset.  
Once you have defined this set you can choose the format:  <b>CSV</b>, <b>xlsx</b> or <b>SPSS</b>. <br />
The SPSS-data comes with a syntax-script that applies labels to all Variables and Values.<br />
</p>

<p class='question'>can I import data from for example my lab-system?</p>
<p>Castor can import data in CSV- and xlsx-format.
Contact <a href='mailto:info@trialdatasolutions.com'>us</a> if you want advice on interfacing with Castor, 
or if you want us to set this up for your trial. 
</p>

<p class='question'>that sounds good, but: how much does it cost?</p>
<p> To calculate the costs of your study, use their 
<a href='https://castoredc.com/pricing/' target='_blank'>online pricing tool</a>. 
</p>

			</div>
		</div>

	</div> <!-- /.main -->
	
	<hr />

<%@ include file="/includes/news.jsp" %>

	<div class="secondary"> <!-- /.photo -->
		<div class="mod">
		<img src='/tds/img/PillsStethoscope.jpg' border='0' width='100%' />
		</div>
	</div> <!-- /.secondary -->
	
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
