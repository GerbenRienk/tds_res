<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: using the insert action to make defaults for repeating item" /> 
<meta name="keywords" content="openclinica 3.1 training conditional display status open source software clinical trials datamanagement 
non-profit academic edc insert action repeating items default values" /> 

<title>Trial Data Solutions: default values for repeating items</title>
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
<h3>default values for repeating items</h3>
<p>You may find yourself in a situation where you must design a CRF with repeating items. For example, a scan is made and 
different parts of the body should be scored. What you normally do is make a group for these scores and for the area you define a single-select
with values <b>Skull</b>, <b>Vertebral column</b> and <b>Ribs</b>. The user must choose these three areas in the first column and add a score 
in the second column.</p>
<p>
<img src='/tds/img/ImagesHowTo/defaultrepeatingitems/im01.jpg' border='0'  class='photo'/><br />
fig. 1: CRF for scan
</p>
<p>No problem there, but what if in your Study, always the same items must be scored? For example: for each scan you must have
a score for the three areas? You would want your CRF to open like this:</p>
<p>
<img src='/tds/img/ImagesHowTo/defaultrepeatingitems/im02.jpg' border='0'  class='photo'/><br />
fig. 2: same CRF with defaults
</p>
<p>This can be achieved by using the InsertAction. And to make things nice and neat, we will add a ShowAction as well.<br />
Start with setting the GROUP_REPEAT_NUMBER and the GROUP_REPEAT_MAX both to <b>3</b> and then 
setting the default status of the Group with the areas to <b>HIDE</b>. </p>
<p>
<img src='/tds/img/ImagesHowTo/defaultrepeatingitems/im03.jpg' border='0'  class='photo'/><br />
fig. 3: attributes of the group
</p>
<h3>time for a Rule-file</h3>
<p>Now we must write the rules. We will start with collecting the IDs of the items and of the group.
(See <a href='/tds/howto/findingoids.jsp' target='_blank'>Two ways of finding the OpenClinica-ID's (OID's) for a rule</a>.
Because this is version 3.1 we will only need the item OIDs plus the OID of the Group with the repeating items: OIDs for
Event and CRF-version are not needed. Write these OIDs in he header of your Rule-file. 
(Did I mention <a href='http://notepad-plus-plus.org/' target='_blank'>Notepad++</a>?)</p>
<p>
<img src='/tds/img/ImagesHowTo/defaultrepeatingitems/im04.jpg' border='0'  class='photo'/><br />
fig. 4: header with the OIDs
</p>
<p>Our target will be the item asking <b>Was scan done?</b>: if this question is answered with <b>1</b>, Done, 
then we want to display the group and set the defaults. This is done by the expression <b>I_TDSDE_SCANDONE eq 1</b>.</p>
<p>
<img src='/tds/img/ImagesHowTo/defaultrepeatingitems/im05.jpg' border='0'  class='photo'/><br />
fig. 5: target plus expression
</p>
<p>The ShowAction is straightforward: the DestinationProperty is the OID of the Group and the message must be 
something like <b>Please complete the details of the scan.</b></p>
<p>
<img src='/tds/img/ImagesHowTo/defaultrepeatingitems/im06.jpg' border='0'  class='photo'/><br />
fig. 6: the ShowAction
</p>
<p>The last thing to do is set the defaults. We will do this with an InsertAction, or rather with three InsertActions,
 because we want to set three rows of the RepeatingGroup. You can refer to these rows of the group by adding an ordinal to
 the OID of the group. The first row is <b>IG_TDSDE_LESIONS[1]</b> and the area-item in this row is referred to as 
 <b>IG_TDSDE_LESIONS[1].I_TDSDE_ANATOMIC_SEGMENT</b>. If we want to set this to the value <b>Skull</b>, then the
 DestinationProperty of our InsertAction will be <b>DestinationProperty OID="IG_TDSDE_LESIONS[1].I_TDSDE_ANATOMIC_SEGMENT" Value="Skull"</b>.
 And then likewise the second row can be set to <b>Vertebral column</b> and the third to <b>Ribs</b>
</p>
<p>
<img src='/tds/img/ImagesHowTo/defaultrepeatingitems/im07.jpg' border='0'  class='photo'/><br />
fig. 7: the InsertAction
</p>
<h3>and in real life ...</h3>
<p>How does all this present itself to the users? Well, very nicely, in fact. The CRF is opened with only the question if the scan was done.
Then after answering this and clicking the Save-button our message is displayed, plus the table with our defaults. </p>
<p>
<img src='/tds/img/ImagesHowTo/defaultrepeatingitems/im08.jpg' border='0'  class='photo'/><br />
fig. 8: the rule in action
</p>

<p>Click <a href='/tds/CRFExamples/InsertActionInRepeatingGroup.zip'>here</a> for the XML-file</p>

<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#rules'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed August 2013</p>

		</div>
	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
