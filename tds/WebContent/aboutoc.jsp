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
If you have a specific question or problem, <a href='mailto:info@trialdatasolutions.com'>contact</a> us or have a look at the <a href='/tds/howto/'>how-to-pages</a>.</p>

<p>If you are not sure whether it is best to choose OpenClinica or Castor: <a href='mailto:info@trialdatasolutions.com'>contact</a> us so we can discuss
your situation and find what's best suited for you. (And don't worry: we have no financial interests in either one of them.)</p>

<p class='question'>what does it do?</p>
<p>OpenClinica is (opensource) software designed for datamanagement of clinical trials. It runs via the internet, 
so you can conduct a trial in several sites all over the world, provided they are connected to the internet.<br /> 
You can define a study, sites, investigators, monitors and dataentry-persons. Then you design your CRF's plus checks. 
As a last step you define your Events, or Visits, and you're ready to go.<br />
If you want double-data-entry: that is just a matter of ticking a checkbox.<br />
OpenClinica comes with an intuitive interface for managing Source Data Verification<br /> 
Having an Investigator put an electronic signature on the data of a Subject is built in and yes, that's the kind of signature 
you need for 21 CFR Part 11.</p>

<p class='question'>that sounds good, but: how much does it cost?</p>
<p>
Being open source it is <b>free</b>: you can download your copy from 
<a href='http://www.openclinica.com' target='_blank'>http://www.openclinica.com</a>. 
All you have to do is create an account there and follow the instructions.	
</p>

<p class='question'>
<iframe align="right" height="200" width="300"  src="http://www.youtube.com/embed/Mz67XBwDZes" frameborder="0" ></iframe>
how difficult is it to set up CRF's?</p>

<p>Electronic Data Collection has never been so <b>easy</b>. 
Of course you start with creating a Study, but hey, you can do that in less than 7 minutes, as is shown in our 
<a href='http://www.youtube.com/watch?v=E9616zgcna8' target='_blank'>video</a>.
If you know what items you want on your CRF's
and you know what kind of responses you want, all you have to do is type them in an XL-sheet and upload the sheet. 
OpenClinica generates the screen. See our instructional 
<a href='http://www.youtube.com/watch?v=Mz67XBwDZes' target='_blank'>video</a> 
about how to design a CRF from scratch in 10 minutes. <br />
Even though it is easy to design CRFs, they can be really sophisticated: make items appear or hide based on other items,
insert values, make calculations, upload files(!).<br />
You don't have time to learn it? Let <a href='mailto:info@trialdatasolutions.com'>us</a> do it for you.
</p>

<p class='question'>what about validations, discrepancies and queries?</p>
<p>OpenClinica has a versatile system for checks and notes.
You can specify both uni-variate and multi-variate checks. The discrepancies can be routed. 
Plus notes can be added to any data-point. Checks can also be run on imported data. Monitors
can issue queries when they feel something needs looking into. The handy interface for managing Discrepancies 
allows you to filter on all sorts of criteria, but also on <b>Days Open</b> and/or <b>Days Since Updated</b>, 
which is exactly what any Monitor would want. </p>

<p class='question'>so it's easy to get data in, but how do I get my data out again to do an analysis?</p>
<p>At any given moment during your trial you can get the complete dataset, or a subset. 
This subset can be any set of responses, or a specific time frame, or a combination: anything you want. 
Once you have defined this set you can choose the format: tab-delimited <b>text</b>, <b>SPSS</b>, <b>SAS</b> or <b>CDISC</b>. <br />
Both the SPSS-data and the SAS-data come with a syntax-script that applies labels to all Variables and Values.<br />
You can choose as extract format <b>CDISC ODM XML 1.3 Full with OpenClinica extensions</b> which means that your extract
includes all Study-details, Event-structure, all Audit-details: everything. <br />
And the good thing is: you decide what and when, using the normal interface, so via your browser. Once you have defined your set, 
you can re-run it. And not only that: a copy is kept of every dataset created. 
And you can schedule it to be run each day or week or however often you want it. And as a bonus, you can add
an e-mail-address to send a notification to: how user-friendly is that?</p>

<p class='question'>can I import data from for example my lab-system?</p>
<p>OpenClinica can import any data in XML-format, as specified by the CDISC, the so-called ODM-format. It is also possible to
use web-services to import data.
Contact <a href='mailto:info@trialdatasolutions.com'>us</a> if you want advice on interfacing with OpenClinica, 
or if you want us to set this up for your trial. 
</p>
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
