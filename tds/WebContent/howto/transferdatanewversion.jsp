<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: using import to transfer data to a new CRF version" /> 
<meta name="keywords" content="openclinica 3.1 training conditional display status open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: transferring data from one CRF version to an other</title>
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
			
<h3>heads up: which version are we talking about?</h3>
<p>Heads up: all the info below is relevant for OpenClinica-installations up to version 3.11. 
In version 3.12 the function to migrate CRF-versions was introduced, as documented on <br />
<a target='_blank' href='https://docs.openclinica.com/3.1/openclinica-user-guide/submit-data-module-overview/crf-version-migration#BATCH'>
https://docs.openclinica.com/3.1/openclinica-user-guide/submit-data-module-overview/crf-version-migration#BATCH</a>. </p>

<h3>transfer existing data to a a new version of a CRF</h3>		
			<p>How familiar is the following scenario for you? You've designed CRFs for a study and all involved are happy.
			And then you go into production and after three months they come to you and tell you  they want to add an extra item to 
			one of the CRFs. 
			You explain: that's OK, but it will be a new version of the CRF. But that's not what they want: 
			this new item must also be entered for all Subjects who already have data. And you don't want to enter all the existing data
			into this new version: you just want to add the new item.
			<br />
			
			The above scenario probably happens in almost every Study, so we'll discuss a simple way to deal with it.
			This only applies if you do not want to migrate the CRFs manually, because since version 3.1.3 you can transfer existing data
			to a higher version of the CRF using the normal interface. If you want to migrate them in one batch, this is how to do it.</p>
			
			<h3>a word of warning</h3>
			<p>Even though we know what we're doing and we never ever make mistakes, it still is a good idea to practice 
			the following procedure in a test-environment. And after practicing, why not make a nice backup of your database? 
			And after that you can safely work in the production-environment.</p>
			<h3>the CRF</h3>
			<p>First have a look at the existing CRF, version 1: great if you like it plain. </p>
			<p>
			<img src='/tds/img/ImagesHowTo/transferdata/td01.jpg' border='0'  class='photo'/><br />
			fig. 1: CRF with two items
			</p>
			<p>But "they" want an extra item "Comments". First let's have a look at the damage. We go to the SubjectMatrix and choose the Event
			that the CRF is assigned to: Baseline. In the screen that appears we see a column with all the CRF completed so far. (OK, it's only
			three, but this is a demo.)</p>

			<p>
			<img src='/tds/img/ImagesHowTo/transferdata/td02.jpg' border='0'  class='photo'/><br />
			fig. 2: All subjects, with or without data for this CRF
			</p>


			<h3>exporting the data</h3>
			<p>The first thing to do is export the existing data by creating a Dataset. Click on "Tasks"-"Extract Data-Create Dataset".
			In the screen with some initial information, click on the button "Proceed to Create A Dataset". In the left column, under tab "Info",
			 click on the Event "Baseline". The tree of CRFs opens, but in our case this is one CRF, "TDS: Baseline demo".</p>

			<p>
			<img src='/tds/img/ImagesHowTo/transferdata/td03.jpg' border='0'  class='photo'/><br />
			fig. 3: Creating the dataset
			</p>

<p>In the next screen, check "Select All Items" and then click the button "Save and Define Scope". This limits the results of the dataset 
to Subjects who have been enrolled in the period specified here. 
For our timeframe we want everything, so just click "Continue". Give your dataset a sensible name and description. Choose for 
Item Status "Data from All Available CRFs". Click "Continue" and then "Confirm and Save".
</p> 

			<p>
			<img src='/tds/img/ImagesHowTo/transferdata/td04.jpg' border='0'  class='photo'/><br />
			fig. 4: Naming the dataset
			</p>

			<p>Now we are ready to run our export, all we have to do is choose the format. For this purpose we choose
			"CDISC ODM XML 1.3 Clinical Data with OpenClinica extensions". Click "Run Now" and then on "Back to Dataset". 
			Download your Dataset to your client and open the zip. Save the XML file with an appropriate name, such as 
			"data_baseline_version_1.xml".</p>
			<h3>adding the new CRF version</h3>
			<p>So now you're ready to add the extra item and after you've done that, you document. In the CRF-tab of your spreadsheet
			you write a new version, plus what's so new about this version.</p>

			<p>
			<img src='/tds/img/ImagesHowTo/transferdata/td05.jpg' border='0'  class='photo'/><br />
			fig. 5: Documenting
			</p>

<p>Add the new version and go to the "Build Study" screen. Set the default version of the CRF for Event "Baseline" to "v.2"
Click "Confirm" and "Confirm and Finish". Now go back to the CRF list and scroll or filter until you can see our CRF with the two versions.  </p>

			<p>
			<img src='/tds/img/ImagesHowTo/transferdata/td06.jpg' border='0'  class='photo'/><br />
			fig. 6: Two versions
			</p>
<p>We want to delete the CRF version v.1 with data, so we must choose the blue X-icon. Click the blue "Remove"-icon of V.1.
A warning will appear that you are about to remove the version, plus all associated data. But this is what we want, so we click "Remove CRF Version".
Click OK for the extra warning.</p>

<h3>preparing the import-file</h3>
<p>Now it's time to go back to the import-file. As I've said before, <a href='http://notepad-plus-plus.org/' target='_blank'>Notepad ++</a> is my favorite tool. Find the first occurence of &lt;ClinicalData&gt;.
And yes, that is correct, above it are 20.000 + lines of definitions: impressive.</p>
			<p>
			<img src='/tds/img/ImagesHowTo/transferdata/td07.jpg' border='0'  class='photo'/><br />
			fig. 7: Start of Clinical data
			</p>

<p>But you do not need that, so you delete everything from this position of ClinicalData, up to the second line of your file, where it says
"&lt;Study OID=xxx&gt;". Remove it all. And your file is almost ready, you only have to write the closing tag for Study: "&lt;/Study&gt;". 
Your file will look
something like this: </p>
			<p>
			<img src='/tds/img/ImagesHowTo/transferdata/td08.jpg' border='0'  class='photo'/><br />
			fig. 8: Start of Clinical data
			</p>
<p>And then the moment has come to "change" the CRFversion. If you do not know what the OID of the new version is, 
go to the View Study screen; click on the Event "Baseline". Next click on the magnifier-icon of the CRF "TDS: Baseline demo".
And here you see your version-comments and you know 100% that you must replace "F_TDSBASELINED_V1" with "F_TDSBASELINED_V2". 
Do it using Ctrl-H with the "Replace All" button. Save your file.</p>

			<p>
			<img src='/tds/img/ImagesHowTo/transferdata/td10.jpg' border='0'  class='photo'/><br />
			fig. 9: The two versions plus OIDs
			</p>

<h3>importing the data</h3>
<p>Now you can import your data. Click "Tasks"-"Submit Data-Import Data". Browse to the location of your file. Click "Continue".
Review the results of the import action in the left column under "Alerts and Messages". Click on "Continue".</p>
			<p>
			<img src='/tds/img/ImagesHowTo/transferdata/td09.jpg' border='0'  class='photo'/><br />
			fig. 10: Report of import
			</p>

<h3>and how does it look?</h3>
<p>Let's have a quick look at how this looks:</p>

			<p>
			<img src='/tds/img/ImagesHowTo/transferdata/td11.jpg' border='0'  class='photo'/><br />
			fig. 11: After the import
			</p>
<p>We see the CRF version 1 and we are still able to view the data. But version 2 is also there, and this we can edit. 
But hold on: the CRF is marked as complete, as a result of the import. 
This means we have to give a reason for change and whatever reason we give, we can not save the CRF! (OpenClinica tries to add a Discrepancy Note 
to a DataItem, but the DataItem does not exist.) The trick to remove the "Marked as Complete" status is to "Remove" the CRF.
That's the blue cross-icon, no the red one. Immediately after we've done that, we restore it and now the status is set to "Data Entry Started"
and we can edit whatever we like.</p>

<h3>and my Discrepancies and Audit log?</h3>
<p>The Discrepancies are something to handle with great care, because all open ones will be closed, due to the fact that the CRF is 
auto-removed. So you will want to download the open ones by using a filter in the Discrepancies-screen and using the download option.
Then after the procedure you must manually recreate the Discrepancies and also the Notes: these will not be imported, even if they are in 
your ODM-file. The reason for this is that N<span class="amp">&amp;</span>Ds are not part of ODM, but of the OpenClinica-extensions and only 
ODM data will be imported.<br />
In your audit trail you will see the removal of the old version, then updates as a result of the import, <b>Item data value updated</b>.
Then when you remove the CRF we see that as <b>Item data status changed</b> to <b>auto-removed</b> and then back again to 
<b>available</b> when we Restore it. 
When we've inserted our data into the new item and marked the CRF as complete, this is recorded in the audit-trail 
as <b>Event CRF marked complete</b>.


</p>

<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#crfs'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed Feb 2018</p>
		</div>
	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
