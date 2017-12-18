<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: getting rid of the yellow comment-fields in the XL-sheet" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: getting rid of the yellow comment-fields in the XL-sheet</title>
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
<h3>getting rid of the yellow comment-fields in the XL-sheet</h3>

<p>This is not really a how-to, but just a quick tip.<br/>
When I started working with OpenClinica the yellow comment-thingies floating in the XL-sheet were informative.
But after a while they were more irritating than useful, but being the XL-nono I am, I could not get rid of them. 
And now at last someone has made my OpenClinica day and shown me.</p>
<p>Here's what you do:<br />
- put the cursor in a cell<br/>
- click menu "Data"<br />
- click "Validate ... "<br />
- choose "Input message"<br />
- uncheck the box<br />
- click "OK"
</p>
<p>Repeat these steps for every tab, CRF-Sections-Groups-Items. 
And that's all there is to it: no more floating yellow thingies.</p>

<h3>but now we're here ...</h3>
<p>Having gone this far, we might just as well do two more things: add your company's name and your own to the sheet.
Click on "File", "Properties", choose "Summary".</p>
<p>And as a final touch: go to tab "Items" and click on cell B2. In the menu click on "Windows" and then "Freeze Panes".</p>
		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
