<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="TDS: rules for items in a repeating_item_group" /> 
<meta name="keywords" content="openclinica 3.1 training conditional display status open source software clinical trials datamanagement 
non-profit academic edc insert action repeating items " /> 

<title>Trial Data Solutions: rule to show a group with repeating items</title>
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
<h3>a rule to show a group</h3>
<p>In this short page we will discuss a very common situation. Consider the following CRF in which medication is recorded.
First of all the so-called <b>indicator question</b> is asked <b>Was any medication used in the previous 12 months?</b> </p>
<p>
<img src='/tds/img/ImagesHowTo/rigrule/im01.jpg' border='0'  class='photo'/><br />
fig. 1: CRF for medication history
</p>

<p>To minimize dataentry-errors we would like to hide the repeating-items group and only show it, after the first question
has been answered with <b>Yes</b>. This is done by creating a Rule-file with a ShowAction.<br />
Let's take this step by step and the first thing to do is create and upload the CRF.
Click <a href='/tds/CRFExamples/rigrule.zip'>here</a> for the CRF plus the XML-file. <br />
As you can see in the tab <b>Groups</b> we defined the
Group_Display_Status as <b>HIDE</b>.</p>

<p>
<img src='/tds/img/ImagesHowTo/rigrule/im02.jpg' border='0'  class='photo'/><br />
fig. 2: the group is no shown by default
</p>

<p>When we open this CRF for dataentry, only the indicator question is shown.</p>

<h3>composing the rule-file</h3>

<p>What we need to do next is create a Rule file that will show the Group Medication when the answer to the indicator question
is Yes. And to do this we need the OIDs of all the objects concerned. Take a look at 
<a href="http://www.trialdatasolutions.com/tds/howto/findingoids.jsp" target="_blank">this page</a> for instructions on how to get them.
For reference it is nice to have these OIDs in the header of our Rule file, so after some searching this should look like this:</p>
<p>
<img src='/tds/img/ImagesHowTo/rigrule/im03.jpg' border='0'  class='photo'/><br />
fig. 3: the OIDs
</p>

<p>Now we are ready to write our expression and that will be <b>I_TDSSH_MEDUSED eq 1</b>, because Yes was coded as 1.</p>
<p>
<img src='/tds/img/ImagesHowTo/rigrule/im04.jpg' border='0'  class='photo'/><br />
fig. 4: the expression
</p>

<h3>some action please</h3>
<p>So now we have the expression right: if the answer to "was any medication used in the previous 12 months" is "Yes", then we 
want a <b>ShowAction</b>. The syntax is easy to understand, except for one term: <b>DestinationProperty</b>.</p>

<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#rules'>here</a>.</p>
		</div>
	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
