<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: setting up web-services" /> 
<meta name="keywords" content="openclinica 3.1 training conditional display status open source software clinical trials datamanagement 
non-profit academic edc web services client" /> 

<title>TrialDataSolutions: a capacity test for OpenClinica using web-services</title>
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
	<h3>capacity testing</h3>
	
<p>So you've set-up a Study in OpenClinica and your sponsor is happy with the CRFs and everything, but now you are asked:
will OpenClinica perform once we have a hundred Subjects in this Study? And what if we have one thousand? Or maybe 
ten thousand? Or more?<br />
In this how-to-page we describe how you can demonstrate (exactly) how OpenClinica will behave, because we will
show step by step how you can duplicate the data for one Subject.</p>

<h3>preparing OpenClinica</h3>
<p>To do this we use an MsAccess-utility which you can download <a href='/tds/CRFExamples/TDS_CapacityTest_20130427.zip' target='_blank'>here</a>.<br />
The utility uses web-services to extract information from the OpenClinica instance and put data into it.
So what we need is a copy of the OpenClinica-instance with the Study and corresponding web-services for this instance.<br />
Furthermore we assume you have authorized a user to use the SOAP-services.<br />
Information on how to do this can be found <a href='/tds/howto/wssetup.jsp'>here</a>. <br />
In our example the OpenClinica-instance is called <b>mosaic</b>, the corresponding web-services are <b>mosaicws</b> and the
authorised user is <b>grvisser</b>.<br />
There is one last thing we need to check and that is the <b>Study Parameter Configuration</b> which must
have the following settings, to match the web-services-requests we will make. 
</p>


<p><img src='/tds/img/ImagesHowTo/capacity/capacity04.jpg' border='0'  class='photo'/><br />
fig. 1: setting the Study Parameter Configuration</p>


<p>Once your two OpenClinica-applications are in place and running you can unzip the file with the 
MsAccess-utility and open the mdb-file. 
Then go to the tables-section and open <b>tblSOAPParameters</b>. In it are some parameters and there are two you must change: 
<b>sysURL</b>: change that to match your situation, 
and <b>tempdir</b>: change that to the directory you use for temporary files.</p>

<p><img src='/tds/img/ImagesHowTo/capacity/capacity01.jpg' border='0'  class='photo'/><br />
fig. 2: setting the URL of the web-service</p>

<h3>the sample data</h3>
<p>To do our capacity test we must enter data for one Subject. In this example we used Suject 
<b>CC00001</b> and as you can see all three Events are marked complete and the third Event,
<b>EV3</b>, has two occurrences.</p>

<p><img src='/tds/img/ImagesHowTo/capacity/capacity02.jpg' border='0'  class='photo'/><br />
fig. 3: our one and only Subject</p>

<p>And when we click <b>Home</b>, we see a summary of these meager results.</p>
<p><img src='/tds/img/ImagesHowTo/capacity/capacity03.jpg' border='0'  class='photo'/><br />
fig. 4: the summary of our starting position</p>

<p>We get the data we will duplicate by creating a dataset of all items of the Study,
and extracting the dataset in format <b>CDISC ODM XML 1.3 Clinical Data with OpenClinica extensions</b>.
Download the zip-file and extract the XML-file. For this example we renamed the file to
<b>CT.xml</b></p>


<p><img src='/tds/img/ImagesHowTo/capacity/capacity05.jpg' border='0'  class='photo'/><br />
fig. 5: the dataset</p>

<h3>the hard work</h3>
<p>So we now have OpenClinica with the Study with the Subject and the data in XML and web-services to do 
the duplicating. Let's set the utility to work for us.<br />
First we open <b>frmCreateCopiesOfSubjectPlusData</b>, if that is not already the case. Then we fill in the details:<br />
OCName and OCpassword are the name and password of the OpenClinica-user who is authorised to use SOAP.<br />
The ODM-file is the XML file of the dataset and you can type in the location, or browse to it with the browse-button.<br />
When the location is given, you can click <b>get Subjects</b> and then the single-select will be populated with all Subjects.
We choose <b>CC00001</b>.<br />
The last bit of information we must supply is the number of copies we want and in the screenshot we made this 20.000, 
which is not recommended if you are not familiar with the utility and/or do not know what exactly you want to test. Start
with a small number if you're experimenting, just to get the feel of it.

</p>

<p><img src='/tds/img/ImagesHowTo/capacity/capacity06.jpg' border='0'  class='photo'/><br />
fig. 6: the utility</p>

<p>We start, no surprise, by clicking <b>fill table NewSubjectsToCreate</b> and after some time, 
depending on the number of copies you chose, the table <b>tblNewSubjectsToCreate</b> will have 20.000 records, 
ready to be created in OpenClinica. Click <b>create Subjects in OC</b> and go for the coffee-machine, because this
can take some time. <br />
After the script has been running for a while, MsAccess no longer updates the screen, but we can see if the script
is still running by switching to OpenClinica and looking at the Home-screen.<br />
This part of the process can be restarted as often as is needed.</p>
<p>Once all these Subjects have been created, we must schedule Events for them and this is done 
by clicking <b>fill table NewEventsToCreate</b>. In our case this is quite substantial, because we have four Events
for twenty thousand Subjects, which totals 80.000 Events. These are scheduled by clicking <b>schedule Events in OC</b>
and this requires another walk to the coffee machine.<br />
This part of the process can also be restarted, but in case of Events that were defined as Repeating, it results in
more recurrences than you wish for. Furthermore, the utility needs at least one successful creation of
an Event for each Subject, to retrieve the StudySubjectOID. This is stored in tblStudySubjectOIDs and is used for the import 
of the ClinicalData. </p>
<p>And when all these Events for all these Subjects have been created, we can start importing the data by,
you guessed it, clicking <b>import copy of ClinicalData</b>. This took for my example of 20.000 Subjects 
several hours and some interruptions and restarts. After each successful import, the corresponding record 
in table <b>tblNewSubjectsToCreate</b> is deleted, so the number displayed to the right of button
<b>fill table NewSubjectsToCreate</b> is (slowly) decreasing. Skip the coffee machine and go home and see in the morning 
how many Subjects still need data-import. And finally your Home-screen will look something like this:</p>

<p><img src='/tds/img/ImagesHowTo/capacity/capacity07.jpg' border='0'  class='photo'/><br />
fig. 7: the end result</p>

<p>It may seem strange that the number of Completed Events is 60.004 and not 80.004, because we imported
the data and then the status of the CRFs is set to Complete. But in EV2 there were 2 CRFs and apparently 
the status of the Event is then set to DataEntryStarted (OC.3.1.2). <br />
(And the 268 Events with status Scheduled are a leftover from an erroneous import.)</p>


<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#webservices'>here</a>.</p>

</div>
	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
