<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: how to create a new version of a CRF" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc free gratis database medisch onderzoek ecrf create a new version of a CRF" /> 

<title>Trial Data Solutions: how to create a new CRF for OpenClinica</title>
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
			<h3>How to create a new version of a CRF</h3>
			
			<p>Login to OpenClinica as Study Director and click on "Tasks". Choose from the list that appears "CRF's", 
			under header "Administration" (fig. 1).</p>
			<p>
			<img src='/tds/img/ImagesHowTo/TaskMenuCRF.jpg' class='photo' /><br />
			fig. 1: Task menu: CRF's
			</p>
			
			<p>In the screen that now appears, "Administer Case Report Forms (CRF's)" find the CRF you want to revise and click
			on the white arrow in the "Download" column (fig. 2). Clicking this link starts a down-load of the Excel-sheet.</p>
			<p>
			<img src='/tds/img/ImagesHowTo/TaskMenuCRFDownload.jpg' class='photo' /><br />
			fig. 2: Download CRF
			</p>
			
			
			<p>
			Save this Excel-sheet on a your computer. Open it in Excel and start with the first Tab "CRF" and fill in a new version number in cell B2<br />
			Now do your other editing and save the file.</p>
			<p>
			Switch back to OpenClinica "Administer Case Report Forms (CRF's)" and in the right column, titled "Actions" click on the icon 
			labeled "Create New Version" (fig. 3)
			</p>
			<p>
			<img src='/tds/img/ImagesHowTo/TaskMenuCRFCreateNewVersion.jpg' class='photo' /><br />
			fig. 3: Create a new version-a
			</p>

			<p>You get a screen very similar to that of creating a new CRF, but this one is titled "Create
			a CRF Version for X" (fig. 4). Click the button labeled Browse and browse to the location on your PC where
			you saved the XL-sheet. Click on "Preview CRF Version" to have the CRF validated. </p>
			<p>
			<img src='/tds/img/ImagesHowTo/CreateNewVersionOfCRF.jpg' class='photo' /><br />
			fig. 4: Create a new version-b
			</p>
			
			<h3>Consequences of having a new version</h3>
			<p>If no errors where found, the CRF will be included in your list of available CRF's. 
			If the previous version of this particular CRF was never used you can overwrite it: 
			you keep the version in cell B2 the same. On validating you will see a message asking 
			you if it's OK to overwrite and you can decide what to do with that. <br />
			In all other circumstances you now have two or more versions of a CRF. This means that you have to define
			for each Event that uses this CRF, which version is the default version!</p>
			<p>This may seem trivial, but that's not so when you have more studies using the same CRF. 
			If you decide you want to have a new version for one study, this applies to all: maybe a bit more than you want.
			Therefore it is a good thing to decide, when you design a new study and decide you can use some of the existing CRF's
			whether you want to use these CRF's, or make a copy of them and you the copies in your new study.</p>
			
			<p>Another not so trivial consequence of having a new version of your CRF is that you must rewrite
			all rules associated with the CRF, because the OID of it has changed! This can be quite a task, as you can not download
			a "version" of a rule, edit it and upload it again. You will have to keep your own administration of the rules.</p>
		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
