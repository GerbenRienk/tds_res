<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: how to create a new CRF" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc free gratis database medisch onderzoek ecrf how to create a new CRF" /> 

<title>Trial Data Solutions: how to create a new CRF</title>
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
			<h3>How to create a new CRF</h3>
			 
			<p>Login to OpenClinica as Study Director and click on "Tasks". Choose from the list that appears "CRF's", 
			under header "Administration" (fig. 1).</p>
			<p>
			<img src='/tds/img/ImagesHowTo/TaskMenuCRF.jpg' border='0'  class='photo'/><br />
			fig. 1: Task menu: CRF's
			</p>
			
			<p>In the screen that now appears, "Administer Case Report Forms (CRF's)" click on "Blank CRF Template" (fig. 2).</p>
			<p>
			<img src='/tds/img/ImagesHowTo/AdministerCRFsBlank.jpg' border='0'  class='photo'/><br />
			fig. 2: Blank CRF template
			</p>
			
			<p>Clicking this link starts a down-load of an Excel-sheet that can be used to define the elements of the CRF.<br/>
			Save this Excel-sheet on a your computer and edit it, using Microsoft XL and save it under a new name. <br />
			In this section we will not elaborate on how you choose your section, your items and your validations.
			But at this point it may be useful to know how OpenClinica handles names.<br />
			Every object in OpenClinica has a unique OpenClinica-ID or OID. 
			When you have edited the blank template to start a CRF for lets's say the intake of your study, rename your XL to 'Intake.xls'. 
			Furthermore, fill in this name in cell A2 of tab CRF (fig. 3).</p>
			<p>
			<img src='/tds/img/ImagesHowTo/CRFXLTabCRF.jpg' border='0'  class='photo'/><br />
			fig. 3: XL-template, tab 'CRF'
			</p>
			
			<p>
			Now you can upload the XL (instructions below) and the CRF will appear in you list. 
			The first four characters of the name of your XL-sheet will be used to construct the OID. 
			In this case the OID for intake.xls will for example be "F_INTA_5348" and is found under column "VERSION_OID". 
			The name you typed in cell A2 will appear the first column on the left, called "CRF Name".
			</p>
			<p>
			Make sure you've saved your XL-sheet and switch back to OpenClinica. In the screen called "Administer Case Report Forms", 
			click on "Create a new CRF" (fig. 4).</p>
			<p>
			<img src='/tds/img/ImagesHowTo/CreateNewCRF.jpg' border='0'  class='photo'/><br />
			fig. 4: Upload a new CRF, 1
			</p>
			<p>
			In the screen that opens, click on "Browse". Then browse to the XL-sheet and select it.<br />
			Then click on "Preview CRF Version"
			</p>
			<p>
			<img src='/tds/img/ImagesHowTo/UploadCRF.jpg' border='0'  class='photo'/><br />
			fig. 5: Upload a new CRF, 2
			</p>
			<p>If errors were found they will be displayed in orange on the top of the page that appears.
			If no errors were found you can add your new CRF to your list of available CRF's. </p>
			
		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
