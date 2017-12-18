<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: displaying items in two columns" /> 
<meta name="keywords" content="openclinica 3.1 training  open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: displaying items in two columns</title>
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
			<h3>columns in your CRF</h3>
			
<p>Not many users will be very happy when they try the <b>column</b>-option in a CRF. It looks straight forward enough:
define items as you are used to and assign them to column 1 or 2. This is for example the case with eye-tests, where all the results
are done for Left and for Right.<br />
You would expect that all the items for one eye are vertically aligned, but this is only the case when the <b>ResponseTypes</b> are all the same,
 for example all <b>text</b>.<br />
 In most cases your CRF will look something like this:</p>

<p><img src='/tds/img/ImagesHowTo/twocolumns/tc05.jpg' border='0'  class='photo'/><br />
fig. 1: CRF with chaos</p>
 
<p>On this page we discuss how you can make your CRF tidier by applying some java-script. </p>
<p>You can download the example-CRF <a href='/tds/CRFExamples/TwoColumnLayout.xls' target='_blank'>here</a>.</p>



<h3>what is happening exactly?</h3>
<p>It is a bit hard to explain in detail what is happening, but it boils down to:<br />
for every CRF-item a <b>table</b> is made, containing  question_number, left_item_text, units, discrepancy_note_flag and  the right_item_text.
If we put two CRF-items next to each other, then the item in column 2 also gets a <b>table</b> and then both tables are fit into yet another 
table.<br />
I've probably lost you already, so take a look at the next figure, in which you can see the the table-per-CRF-item in red 
and the table holding the red tables in blue.</p>
			
<p><img src='/tds/img/ImagesHowTo/twocolumns/tc04.jpg' border='0'  class='photo'/><br />
fig. 2: colored tables</p>

<p>What you also see is that the two red tables of item 3a and 3b, with the single-selects, take up 100% of the big box in
which the whole CRF is contained. The two red tables of item 1a and 1b take up less than 50% each and hence their blue table is less
than 100% of the CRF-box. And this applies even more so to items 2a and 2b.</p>

<h3>can we do the jquery-thing again?</h3>
<p>We can get to the tables and style them in such a way that the blue tables takes 100% of the box and the red tables
take each 50%. We put the function doing this in the Instructions part of the Section.</p>

			
<p><img src='/tds/img/ImagesHowTo/twocolumns/tc02.jpg' border='0'  class='photo'/><br />
fig. 3: function in the instructions of the section</p>

<p>We can call this function by adding a class in the right_item_text.</p>
			
<p><img src='/tds/img/ImagesHowTo/twocolumns/tc03.jpg' border='0'  class='photo'/><br />
fig. 4: calling the function in the items</p>


<h3>skip the explanation: what does it look like?</h3>
<p>Here you see the CRF in action:</p>
<p><img src='/tds/img/ImagesHowTo/twocolumns/tc01.jpg' border='0'  class='photo'/><br />
fig. 5: CRF in action</p>

<h3>fine, now tell us how it works</h3>
<p>The script looks awful.</p>
<pre>
&lt;script src="includes/jmesa/jquery.min.js"&gt;// for OC versions before 3.1.4, use jquery-1.3.2.min.js !&lt;/script&gt;
&lt;script lang="Javascript"&gt;
    $.noConflict();
    jQuery(document).ready(function($) { 
        function styleColumns(pClassSelector) {
            $(pClassSelector).parent().parent().parent().parent().parent().css({'width':'50%'});
            $(pClassSelector).parent().parent().parent().parent().parent().parent().parent().parent().css({'width':'100%'});
        }
        styleColumns('.twocolumns');
    });
&lt;/script&gt;
</pre>
<p>Every time the class <b>twocolumns</b> is encountered, the function <b>styleColumns</b> is called. 
This goes to the parent of the parent etc. of the element with that class and applies the style to it that the width should be 
50%.<br />
Think red table.<br />
And then the same path again with some more parents and this time the width is set to 100%.<br />
Think blue table.</p>
<p>It may seem odd that you do this for both the item in the first and the second column: in both cases the blue table is set
to 100%. This can be done more elegantly, by having two function etc. but this is already what we wanted in the first 
place and confusing enough.</p>

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
