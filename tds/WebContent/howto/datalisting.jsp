<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: listing and printing all data items" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc data listing MsAccess" /> 

<title>Trial Data Solutions: datalisting</title>
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
			<h3>listing data, meta-data and audit-trail</h3>
			
<p>On this page we discuss a utility with which you can print all items that were entered. It's built in MsAccess, so you have to have MsOffice 
installed to use it. We use the word <b>utility</b> on purpose, because it is not an official report and certainly not an analysis of any kind.
It is nothing more than a list of data, as shown in fig. 1</p>
			
<p>
<img src='/tds/img/ImagesHowTo/datalisting/dt01.jpg' class='photo'/><br />   
fig. 1: this is what you get on paper
</p>
<p>What we see is the data-items, ordered per Subject, per Event, per Form, including some information about the Subject and the status of both 
Event and Form. As you can see the so-called Decoded Value is displayed, so if you set up a ResponseOptions-list for an Item, either 
in combination with radio, single-select or multi-select, the full text is displayed. Everything is displayed in one enormous list,
even if you defined column-numbers, or if your items are in a repeating group.</p>

<h3>isn't that a standard report in OpenClinica?</h3>
<p>Yes, that is a standard report in OpenClinica, starting from version 3.2. You get it by clicking in the SubjectMatrix on the 
magnifier-icon in the right-most column. This opens the ViewSubject-form, that lists all Events with all CRF's. 
And at bottom of this form you see a link called <b>Subject Casebook</b> and if you click that, you get the option
to print all available data of a Subject</p>
<p>
<img src='/tds/img/ImagesHowTo/datalisting/dt05.jpg' class='photo'/><br />   
fig. 2: how to get the standard OC-reort
</p>
			
<h3>where do we start?</h3>
<p>If you want to use the MsAccess-utility, you start with downloading the <a 
href='/tds/CRFExamples/DataListing_oc312_20180324.zip' target='_blank'>
datalisting</a>-file, unzipping it and opening the accdb-file.</p>
<p>(The version above is for OC 3.2 and up. If you are looking for the old version of this utility, suitable for pre
 OC3.2, you can find it <a href='/tds/CRFExamples/DataListing_20120727.zip' target='_blank'>
here</a>.)</p>
<p>A menu-form opens, as shown in fig. 3. (If it does not open automatically, click on tab <b>Forms</b> and then double-click
<b>frmGetClinicalData</b>.</p>
<p>
<img src='/tds/img/ImagesHowTo/datalisting/dt02.jpg' class='photo'/><br />   
fig. 3: the menu
</p>

<h3>follow the buttons</h3>
<p>From here it's just a matter of clicking buttons: start at the top and work down to the bottom. Seriously.<br />
Of course you must have an ODM-file to work with, so take one of your extract-datasets and export it in 
<b>CDISC ODM XML 1.3 Full with OpenClinica extensions</b>. Download the file and unzip it.</p>
<p>
1. Click the button <b>browse</b> or type in the location of your xml-file.<br />
2. Now click the button <b>get metadata</b>. In the bottom of your screen you will see what activity is running. 
The scripts goes through the xml-file and reads all the definitions: Events, Forms, ItemGroups, Items, CodeLists and
MultiSelectLists.<br />
3. Clicking <b>get clinicaldata</b> will read all clinical-data in your xml and put that in tblClinicalData.</p>

<p>And that was it: you can now print a report. You can choose one Subject, using the select, or you can leave the box 
<b>Only for this subject</b> blank and get the data for all Subjects: just click on the button <b>open report</b>.</p>
<p>As an extra help: there will be a <b>D</b> to the right of the items that have a Discrepancy.</p>

<h3>and what about that last button?</h3>
<p>The last button is an extra: if you want the ClinicalData in csv-format, type in location and 
name of a file to export to. If you click the button <b>use friendly names</b>, you do not get the OID's, but
StudySubjectID's, EventNames, CRFNames and ItemNames.</p>
<p>
<img src='/tds/img/ImagesHowTo/datalisting/dt03.jpg' class='photo'/><br />   
fig. 4: output to csv for one Subject
</p>
<p>If the file has been created you can double-click it and it will open in Excel.</p>
<p>
<img src='/tds/img/ImagesHowTo/datalisting/dt04.jpg' class='photo'/><br />   
fig. 5: Subject F3012 in Excel
</p>
<h3>hold on, there's two more tabs</h3>
<p>Yes, there are two more tabs in the utility: one that gives a list of the CRF's per Event and 
 a sort of annotated CRF. And again: it is a <b>sort of</b> annotated CRF.</p>
<p>
<img src='/tds/img/ImagesHowTo/datalisting/dt06.jpg' class='photo'/><br />   
fig. 6: CRF characteristics
</p>

<h3>RBM or just clever monitoring</h3>
<p>The last tab, <b>audit data</b> gives you information about who did what. That sounds like a detective, 
but in fact you can use it in your monitoring process. For example, you are doing partial SourceDataVerification
and based on that you see that one of the dataentry-persons makes more errors than the rest. In that 
case it makes sense to have a list of all the data that person has touched. That sounds like 
RiskBasedMonitoring or if not that, it is at least clever monitoring.</p>
<p>In fig. 7 you see a selection of all the data that Joe Satriani created or modified between 
2014-04-05 and 2014-06-13, plus the output.</p>
<p>
<img src='/tds/img/ImagesHowTo/datalisting/dt07.jpg' class='photo'/><br />   
fig. 7: what did Joe do?
</p>
<p>For this page we had lots of input, including code, from Krister Kristianson and Lindsay Stevens: many thanks!</p>
<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#other'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed March 2018</p>


		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
