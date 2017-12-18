<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="our five pages that our visitors viewed the most" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc ecrf Nederland Netherlands Holland" /> 

<title>our most popular how-to-pages on OpenClinica</title>
<link rel="stylesheet" type="text/css" media="screen, projection" href="/tds/css/screen.css" />
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
			<h3>our top five</h3>
<div class="entry-body">
<p>To make life as easy as possible for you, here are the five pages of our site (plus a bonus-page) that were viewed the most in the last two weeks. 
In this list only the <a href='/tds/howto/'>how-to-pages</a> are included.</p>

<ol>

<li><a href='vas.jsp'>a visual analogue scale or VAS</a></li>
<li><a href='showhidemulti.jsp'>showing or hiding items on a CRF using a rule (OC 3.1)</a></li>

<li><a href='layoutchanges.jsp'>changing the layout of a CRF</a></li>

<li><a href='deselectradio.jsp'>deselecting a radio-button</a></li>
<li><a href='datediff.jsp'>the number of days between two dates</a></li>

<li><a href='itemsfromotherevents.jsp'>using items from other Events</a></li>

<!--
<li><a href='usingregexpfortimefield.jsp'>3 methods to create a time field</a></li>

<li><a href='showhideitems.jsp'>showing or hiding items on a CRF, based on the input of another item (OC 3.1)</a> (SimpleConditionalDisplay)</li>

<li><a href='defaultrepeatingitems.jsp'>setting defaults for repeating items using the insertaction (OC 3.1)</a></li>



<li><a href='icd.jsp'>a link to the ICD10 site in a CRF</a></li>
<li><a href='wssetup.jsp'>get those services running</a></li>
<li><a href='createverysimplerule.jsp'>a simple rule with two items</a></li>
<li><a href='twocolumns.jsp'>aligning two columns</a></li>

<li><a href='schemaspy.jsp'>SchemaSpy: a graphical representation of the database</a></li>
<li><a href='transferdatanewversion.jsp'>transfer existing data to a a new version of a CRF</a></li>
<li><a href='sendingmails.jsp'>using a rule to send a mail</a></li>
<li><a href='postmessage.jsp'>getExternalValue, postMessage and controlled vocabularies</a></li>
<li><a href='postgresutils.jsp'>some Postgres-commands that can come in handy</a></li>
<li><a href='wsclient.jsp'>using web-services to add subjects and schedule events</a></li>

<p>That makes six pages, we know, but sometimes we just can't choose.</p>
 -->

</ol>

<p>If this is not exactly, or not at all what you're looking for, then <a href='mailto:GerbenRienk@TrialDataSolutions.com'>mail us</a>
 and maybe we can create a nice page to help you and others.


<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
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
