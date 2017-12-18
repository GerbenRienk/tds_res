<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: a  CRF with an image" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: a CRF with an image for OpenClinica</title>
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
			<h3>A CRF with an image</h3>
			
			<p>Sometimes a picture tells you more than a thousand words etc. so in those cases you would like to have an image
			in your CRF. And lo-and-behold: this is an option in OpenClinica. The one restriction is that the only place you can put it is 
			to the right of your question. <br />
			Take for example a trial about wrist fractures. You want to know the M&ouml;ller AO-classification and although this is commonly used,
			it still is handy to have the three fractures right there where you need them.</p>
			
			
			<p>Let's take the easy part first: the XL-sheet. In the CRF-XL-sheet you type the location of the image in column RIGHT_ITEM_TEXT (E). 
			You can give any url you want for the source (src) of the image.
			(fig. 1)</p>
			
			<p>
			<img src='/tds/img/ImagesHowTo/CRFWithImage.jpg' class='photo'/><br />
			fig. 1: XL of CRF with image
			</p>
			
			<p>You can upload this XL-file in the normal way and assign it to one or more of your events and it looks just great (fig. 2).</p>
			<p>
			<img src='/tds/img/ImagesHowTo/CRFWithImage2.jpg' class='photo'/><br />
			fig. 2: CRF with the image
			</p>
			
			<h3>Where do I put my images?</h3>
			<p>The next question to be answered is: where to put the images? There are several solutions.<br />
			One is to use a location on a server completely different from the one you're running OpenClinica on. 
			In that case all you have to do is put the full URL in the src-attribute of the img-tag. So the above location would be
			<b>src='http://www.trialdatasolutions.com/tds/img/ImagesHowTo/AOClassification.png'</b>.<br />
			Another way is to put the image in the directory used by OpenClinica: <b>/usr/local/tomcat/webapps/OpenClinica/images</b>
			 (for a description how to, see below).
			The disadvantage is that you have to keep an administration of these files so you can easily put a new copy of them in the 
			OpenClinica-directory after an upgrade.<br />
			It is therefore better to have a directory "crfimg" that can be used by Tomcat. </p>
			
			<h3>Creating an image directory, browsable by Tomcat</h3>
			<p>Login to your server as root or root-access-account. Go to the webapps-directory of Tomcat:
			<b>cd /usr/local/tomcat/webapps</b>. You know you're in the right directory if you see a file <b>OpenClinica.war</b> and
			a directory <b>OpenClinica</b>. Now create the directory as user tomcat: <b>sudo -u tomcat mkdir crfimg</b>. 
			Check tomcat is user of the newly created dir by typing <b>ls -al</b>; <br />a line with 
			<b>drwxr-xr-x  2 tomcat tomcat     4096 Apr 26 22:05 crfimg	</b> should be in the list.</p>
			The directory is ready for use but you must sudo as tomcat, every time you copy a file to this location:<br />
			<b>sudo -u tomcat cp [filetocopy] /usr/local/tomcat/webapps/crfimg</b>
		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
