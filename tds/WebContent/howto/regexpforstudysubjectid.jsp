<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: checking the StudySubjectID with a regular expression" /> 
<meta name="keywords" content="openclinica 3.x training  open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: a regular expression for the StudySubjectID</title>
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
<script src="/tds/js/highlight.pack.js" type="text/javascript"></script>
<script>hljs.initHighlightingOnLoad();</script>
</head>

<body>

<%@ include file="/includes/headermenu.jsp" %>
<hr />

<div id="wrap" class="group">
	
	<div class="main">		
		
		<div class="entry group">

<h3>a regular expression for the StudySujectID</h3>
			
<p>Many OpenClinica users have asked for some way to check the StudySubjectID and so far, oc3141 Dec 2013, this is not possible.
However what you can do is take the StudySubjectID from the header of the CRF, put it into a normal CRF-item and do some checking
there. It is not the solution to end all your ID-problems, but it's definitely better than nothing!</p>

<p><img src='/tds/img/ImagesHowTo/regexpforssid/rs01.png' border='0'  class='photo'/><br />
fig. 1: example of a CRF with StudySubjectID duplicated</p>

<p>One way to do this would be to ask dataentry to re-type the ID, but then you run the risk
of entry-errors. It makes more sense to get the ID from the upper-right corner of the CRF.
You must use a tiny bit of javascript. <br />
If you're in a hurry you can download an example-CRF <a href='/tds/CRFExamples/RegexpForStudySubjectID.zip' target='_blank'>here</a>.</p>




<h3>the javascript to get the ID</h3>
<p>Here's the script to do the work and we can insert it in the <b>RIGHT_ITEM_TEXT</b> of the item to hold the ID.</p>

<pre><code>&lt;script src="includes/jmesa/jquery.min.js"&gt;// for OC versions before 3.1.4, use jquery-1.3.2.min.js !&lt;/script&gt;
&lt;div id="StudySubjectID"&gt;&lt;/div&gt;
&lt;script&gt;
$.noConflict();
jQuery(document).ready(function($) { 
var fieldStudySubjectID = $("#StudySubjectID").parent().parent().find("input");
fieldStudySubjectID.attr("readonly", true);
function getSSID(){
 var SSID = $("#centralContainer").find("table:first").find("tbody:first").children("tr:nth-child(1)").children("td:nth-child(2)").children("h1").text();
 SSID = $.trim(SSID);
 if (fieldStudySubjectID.val() != SSID){
  fieldStudySubjectID.val(SSID);
  fieldStudySubjectID.change();
 }
};
getSSID();
})
&lt;/script&gt;</code></pre>

<p>In the first line we define a block or <b>div</b> and call it <b>StudySubjectID</b>. 
We get to the CRF-item we want to copy the ID into  by going to the parent-of-the-parent of this div and then finding the <b>input</b> 
and we give this the name <b>fieldStudySubjectID</b>. The actual StudySubjectID can be found by starting at the DOM-object 
<b>centralContainer</b> and going the path from table to h1.<br />
If this value is different from the value that is entered in the CRF-item, then we replace this.<br />
To prevent the user from changing the copied ID, we set it read-only
and then we're finished with the javascript-part. 
</p>

<p>This function, <b>getSSID()</b>, is called when the CRF is loaded. </p>

<h3>and the checking?</h3>
<p>The actual checking you do by applying a regular expression to the CRF-item.
For example if you want your ID to have the format TDS followed by three digits, you add a validation to the item
like <br />
<b>regexp: /TDS\d{3}/</b><br />
A great site for experimenting with regular expressions is 
<a href='http://regexpal.com/' target='_blank'>http://regexpal.com/</a>.
</p>
<p>What is probably the most difficult part is writing the instructions for your data-entry,
because in your ValidationMessage you must instruct them to change the StudySubjectID
<i>outside the CRF!</i>. This new ID will not be checked until they've opened the CRF and saved it.</p>

<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#crfs'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed December 2013</p>

		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
