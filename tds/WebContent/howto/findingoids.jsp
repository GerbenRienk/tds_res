<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="two ways of finding the OpenClinica-ID's (OID's) for a rule" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: two ways of finding the OpenClinica-ID's (OID's) for a rule</title>
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
			
<h3>Two ways of finding the OpenClinica-ID's (OID's) for a rule</h3>
<p>
When you want to construct a rule for a CRF, you're going to need four ingredients:</p>
<ol>
<li>the OID of an event</li>
<li>the OID of a CRF(-version) in that event</li>
<li>the OID of an item-group in that CRF</li>
<li>the OID of an item in that group</li>
</ol>
<p>You can access this information via two completely different routes:<br />
1: using the <a href='#ocapp'>OpenClinica-application</a><br />
2: using the <a href='#metadata'>StudyMetaData-file</a><br />

If this is one of the first times you are using the OID's, choose the first option.
If you are familiar with XML-files and you can find your way around in your study, choose the second option.
 
</p>


<a name='ocapp'> </a>
<h3>Using the OpenClinica-application</h3>
<p>	
This is the easy way to find OID's. It uses the OpenClinica-interface. <br />
Login to OpenClinica and click on the Study-name which is in the top of your screen. 

</p>

<p>
<img src='/tds/img/ImagesHowTo/SimpleRule/fo00.jpg' border='0'  class='photo'/><br />
fig. 1: Click on the Study Name
</p>
<p>In the screen that opens you see all the information about your Study. 
Scroll down to the bit with the Study-Events
For this example we'll use EndOfStudy. Click on the magnifier-icon of this event. (fig. 2)</p>
<p>
<img src='/tds/img/ImagesHowTo/SimpleRule/fo01.jpg' border='0'  class='photo'/><br />
fig. 2: List Event Definitions
</p>

<p>Now a screen opens, displaying information about the event and about the CRF's in that event. 
Here you can find your first ingredient: the OpenClinica ID (OID) of the StudyEvent, in this case
<b>SE_EOS</b> (fig. 3). Write this down for later use. Then click on the magnifier-icon 
on the right of the CRF you want to use for your rule.</p>
<p>
<img src='/tds/img/ImagesHowTo/SimpleRule/02ViewEventDefinition.jpg' border='0'  class='photo'/><br />
fig. 3: OID of an Event Definitions
</p>
			
<p>In the screen that opens you see the CRF-details, including the OID of the CRF: 
<b>F_TDSASIMPLERU</b> (fig. 4). Again: write this down, because this is your second ingredient. 
Now click on the strange icon on the right to view the meta-data of the CRF. 
</p>
<p>
<img src='/tds/img/ImagesHowTo/SimpleRule/03ViewCRFMetaData.jpg' border='0'  class='photo'/><br />
fig. 4: OID of CRF version
</p>

<p>
This next screen gives you both the OID of the item and of the group this item belongs to: 
ingredients 3 and 4 (fig. 5)
</p>
<p>
<img src='/tds/img/ImagesHowTo/SimpleRule/04ItemGroupID.jpg' border='0'  class='photo'/><br />
fig. 5: OID's of both item and group
</p>
<p>
As described above you can now define the target for your rule:<br />
<b>&lt;Target Context="OC_RULES_V1"&gt;SE_EOS.F_TDSASIMPLERU.IG_TDSAS_UNGROUPED.I_TDSAS_ABNORMALFINDINGSXTHORAX1&lt;/Target&gt;</b>
</p>
			

			<a name='metadata'> </a>
			<h3>Using the StudyMetaData-file</h3>
			
<p>Here's an alternative way to get the OID's.		
Login to OpenClinica as Study Director or Data Manager and click on "Tasks". Choose from the list that appears "Study setup",
 "View study". 
</p>
<p>
<img src='/tds/img/ImagesHowTo/TaskMenuViewStudy.jpg' border='0'  class='photo'/><br />
fig. 6: Task menu: View Study
</p>
<p>In the first line screen that appears (Download all of the OIDs needed for Data Import and Rules in the ODM XML File format by clicking here.)
you find the link to the StudyMetaData-file</p>
<p>
<img src='/tds/img/ImagesHowTo/StudyMetaData/DownloadStudyMetaData.jpg' border='0'  class='photo'/><br />
fig. 7: View Study, StudyMetaData-file
</p>
<p>Clicking on this link will start the download of an XML file. You can open it, preferably in an XML-editor (fig. 8). </p>

<p>
<img src='/tds/img/ImagesHowTo/StudyMetaData/OIDsinXML.jpg' border='0'  class='photo'/><br />
fig. 8: StudyMetaData-file: OID's
</p>

<p>If you have looked at a StudyMetaData-file before, you will notice that this is just a simple
version of it. For this example I threw out a few hundreds of lines and left only the relevant ones.</p>
<p>We are looking for four OID's and they come in pairs: <br />
- in the StudyEventDef is a reference to the form<br />
- in the ItemGroupDef is a reference to the items<br />

In the red circles you'll find all the information you need to build your rule: 
</p>
<table>
<tr><td>Study event OID	</td><td>: SE_EOS</td></tr>
<tr><td>CRF OID	</td><td>: F_TDSASIMPLERU</td></tr>
<tr><td>Group OID </td><td>: IG_TDSAS_UNGROUPED</td></tr>
<tr><td>Item OID </td><td>: I_TDSAS_ABNORMALFINDINGSXTHORAX</td></tr>
<tr><td> </td><td>&nbsp;&nbsp;I_TDSAS_ABNORMALFINDINGSXTHORAXSPEC</td></tr>
</table>

<p>			
Thus the target for your rule 
would be :<br />
<b>&lt;Target Context="OC_RULES_V1"&gt;SE_EOS.F_TDSASIMPLERU.IG_TDSAS_UNGROUPED.I_TDSAS_ABNORMALFINDINGSXTHORAX&lt;/Target&gt;</b>
</p>
<p>You can now start writing your rules.</p>


<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#rules'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed November 2014</p>
		</div>
	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
