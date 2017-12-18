<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: a CRF with a file" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc free gratis database medisch onderzoek ecrf CRF with a file attached" /> 

<title>Trial Data Solutions: a CRF with a file for OpenClinica</title>
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
			<h3>A CRF with a file</h3>
			
			<p>One of the neat things of OpenClinica is the option to "attach" a file to a CRF. This can be useful if
			in your study X-rays are used. Another example could be pdf's of letters of specialists, etc.</p>
			
			<p>Setting up this facility is very straight-forward: in your CRF-XLS file you add an item for the file. 
			Give ITEM_NAME etc. as appropriate. For both RESPONSE_TYPE (N) and RESPONSE_LABEL (O) fill in "file"; for DATA_TYPE (T) also "FILE"
			(fig. 1)</p>
			
			<p>
			<img src='/tds/img/ImagesHowTo/CRFWithFile.jpg' class='photo'/><br />
			fig. 1: XL of CRF with file
			</p>
			
			<p>You can upload this XL-file in the normal way and assign it to one or more of your events.
			When data-entry opens it, a button "Click to upload file" is displayed and the user can browse in 
			the normal way to the file, confirm the upload and that's it (fig. 2).</p>
			<p>
			<img src='/tds/img/ImagesHowTo/CRFWithFile2.jpg' class='photo'/><br />
			fig. 2: empty CRF with file
			</p>
			
			<p>Once the file is uploaded, the CRF changes: now two buttons appear: "Replace" and "Remove" (fig. 3). 
			Clicking on the file will open it in the application, associated with this type of file.</p>
			
			<p>
			<img src='/tds/img/ImagesHowTo/CRFWithFile3.jpg' class='photo'/><br />
			fig. 3: complete CRF with file
			</p>
			
			<h3>Where are these files stored?</h3>
			<p>All the "normal" data of your study are stored in your Postgres or Oracle database, but not so 
			the uploaded files. They are renamed uniquely and stored in the directory that also contains XL-s, XML-files, etc.
			 This directory is (for Linux) <b>/usr/local/tomcat/openclinica.data/attached_files</b>. If you browse to that 
			 directory, you'll see subdirectories with the names of your studies, i.e. the Unique Protocol ID. 
			 The consequence of this is that <b>you must not change the Unique Protocol ID</b> after you have uploaded one or more files,
			 because then OpenClinica can not retrieve them anymore! <br />
			 And this is one more reason for including this directory in your backup-procedures.</p>
		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
