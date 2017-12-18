<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: showing instructions about an item in a CRF by using Tip" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: different version of a CRF for different Sites</title>
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

<h3>different CRF-versions for different sites</h3>
			
<p>Most of the time when working with OpenClinica we use CRF-versions when we change something about a CRF. And throughout the Study
we generally use the same CRF-version. But it can be handy in some situations to have different versions of a CRF for different Sites.
For example when two Sites in a Study use completely different Study-numbers: Site A uses one letter and three digits, like <b>Z546</b> 
and Site B uses one letter and five digits: <b>B34572</b>.
We will use a regular expression to check the input.</p>
<p>If you're not sure you know how to setup Sites, have a look at <a href='/tds/howto/assigningusers.jsp'>Assigning users to sites, why and how</a>.</p>

<h3>start with the CRF</h3>
<p>First we design the CRF for Site A. We start with the CRF-tab of the XL sheet:</p>
			
<p>
<img src='/tds/img/ImagesHowTo/versionpersite/vps01.jpg' class='photo'/><br />   
fig. 1: version information, including the site
</p>
<p>In the Items-tab we put one item for date informed consent and one for Study-number:</p>		
<p>
<img src='/tds/img/ImagesHowTo/versionpersite/vps02.jpg' class='photo'/><br />   
fig. 2: Items-section, with regular expression for Site A
</p>
<p>The regular expression can be tested on for example 
<a href='http://regexpal.com' target='_blank'>http://regexpal.com</a> and means: take one letter from A to Z and then three digits.</p>
<p>We upload the CRF as a new one.</p>

<h3>and now Site B</h3>
<p>For Site B we first of all change the Version and the Version-description in the XL.</p>
<p>
<img src='/tds/img/ImagesHowTo/versionpersite/vps03.jpg' class='photo'/><br />   
fig. 3: version information for site B
</p>
<p>And then we change the regular expression plus the Validation_Error_Message.</p>
<p>
<img src='/tds/img/ImagesHowTo/versionpersite/vps04.jpg' class='photo'/><br />   
fig. 4: regular expression for Site B
</p>
<p>We now upload the CRF as a new version of the first one:</p>
<p>
<img src='/tds/img/ImagesHowTo/versionpersite/vps05.jpg' class='photo'/><br />   
fig. 5: upload as a new version <br />
<img src='/tds/img/ImagesHowTo/versionpersite/vps05b.jpg' class='photo'/></p>

<h3>adding the CRF to an Event</h3>
<p>We're almost there! First we add the CRF to the Event Screening and assign the CRF to this new Event:</p>
<p>
<img src='/tds/img/ImagesHowTo/versionpersite/vps06.jpg' class='photo'/><br />   
fig. 6: creating Event Screening<br />
<img src='/tds/img/ImagesHowTo/versionpersite/vps07.jpg' class='photo'/><br />   
fig. 7: adding the CRF to the new Event
</p>
<p>Click <b>Continue</b> twice and then <b>Confirm and Finish</b>. You are now back in the Build-Study-screen.
Click on the magnifier-icon of Task 6: Sites.</p>
<p>
<img src='/tds/img/ImagesHowTo/versionpersite/vps08.jpg' class='photo'/><br />   
fig. 8: Sites A and B
</p>

<h3>version Site A for Site A</h3>
<p>When you click the pencil-icon of Site A, you will come to the screen <b>Update Site Details: Site A</b>.
Scroll down to the part with the Visits, called <b>Update Site Event Definitions</b>. 
Open the node of Visit Screening and set the <b>Default Version</b> to <b>Site A: v.1</b> and set the
<b>Available Versions</b> also to <b>Site A: v.1</b>. Click <b>Submit Site</b></p>

<p>
<img src='/tds/img/ImagesHowTo/versionpersite/vps09.jpg' class='photo'/><br />   
fig. 9: Site A settings
</p>
<p>Do the same for Site B, but then with the other version, of course.</p>

<h3>the result</h3>
<p>If you now change to Site B and try to enter a Study-number with the format of Site A, you will see something like this:</p>
<p>
<img src='/tds/img/ImagesHowTo/versionpersite/vps10.jpg' class='photo'/><br />   
fig. 10: Site A format in Site B
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
