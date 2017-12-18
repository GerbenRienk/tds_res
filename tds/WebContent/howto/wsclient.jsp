<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: setting up web-services" /> 
<meta name="keywords" content="openclinica 3.1 training conditional display status open source software clinical trials datamanagement 
non-profit academic edc web services client" /> 

<title>Trial Data Solutions: a web-service client for OpenClinica</title>
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
	<h3>a web-service-client</h3>
	
<p>So you've set-up your web-services, as described on the page <a href='wssetup.jsp'>get those services running</a> and you 
tested them with soapUI and it's all fine, but now you want to put them to use. <br />
To do this, you can use many tools and there's plenty of documentation on the internet, but here we will have a look at a very practical example.
It's written in MsAccess-VBA and that's certainly not the optimal solution for a production-environment, but it will do the job
and most people have basic skills in Access. We will use it to import StudySubjects from an external database into OpenClinica
and to schedule Events for them.</p>

<h3>preparation</h3>
<p>You can download the file <a href='/tds/CRFExamples/wsclient_20131119.zip' target='_blank'>here</a>.<br />
Of course we assume you have your web-services running and that you authorized user <b>root</b> to use the SOAP-services.<br />
First unzip the file and open the mdb-file. Then go to the tables-section and open <b>tblSOAPParameters</b>.</p>		
<p>
<img src='/tds/img/ImagesHowTo/wsclient/wscl01.jpg' border='0'  class='photo'/><br />
fig. 1: setting the URL of the web-service
</p>
<p>In it are some parameters and there's one you must change: <b>sysURL</b>: change that to match your situation, 
and <b>tempdir</b>: change that to the directory you use for temporary files.</p>

<h3>getting the Studies</h3>
<p>First we must find out which Studies we have running and to do this we open <b>frmGetStudies</b>. Fill in your username and password and click
the button <b>get studies</b>. After the Request is made to the web-services, the Response is returned and the result is written into 
<b>tblOCStudies</b>.</p>

<p>
<img src='/tds/img/ImagesHowTo/wsclient/wscl03.jpg' border='0'  class='photo'/><br />
fig. 2: the form for retrieving Studies plus the result
</p>

<h3>adding Subjects to a Study</h3>
<p>Let's say you set up your Study to manually set the StudyIDs, like in figure 3.</p>
<p>
<img src='/tds/img/ImagesHowTo/wsclient/wscl02.jpg' border='0'  class='photo'/><br />
fig. 3: settings of the Study
</p>

<p>Now open <b>tblNewSubjectToCreate</b> and fill in the fields, except the last field, <b>Response</b>.</p>
<p>
<img src='/tds/img/ImagesHowTo/wsclient/wscl04.jpg' border='0'  class='photo'/><br />
fig. 4: new Subjects
</p>
<p>The last step is to open the form <b>frmCeateStudySubjects</b>, fill in name and password and choose the Study. 
If a Study has one or more Sites, you can choose one of the Sites and the Subjects will be assigned to that Site. 
If you leave this blank, the Subjects will be assigned to the Study.  
Now click the button <b>create study subjects</b> and you're done.</p>
<p>
<img src='/tds/img/ImagesHowTo/wsclient/wscl06.jpg' border='0'  class='photo'/><br />
fig. 5: the form to create new Subjects
</p>
<p>For each record you see the result in field <b>Response</b>.</p>
<p>
<img src='/tds/img/ImagesHowTo/wsclient/wscl07.jpg' border='0'  class='photo'/><br />
fig. 6: the result
</p>

<h3>and scheduling Events, is that just as easy?</h3>
<p>Truth be told: yes, scheduling Events is just as easy as adding Subjects. 
We already know which Studies we can use and if we want to know which Events a Study has, we can use web-services as well.
To do this, open form <b>frmGetStudyMetaData</b>, again fill in username and password and choose the Study.
(Make sure that the Event that you want to schedule has a CRF, otherwise it's OID will not show up
in the list of available Events.) The table <b>tblStudyEventDef</b> will contain all the EventOIDs. </p>
<p>
<img src='/tds/img/ImagesHowTo/wsclient/wscl08.jpg' border='0'  class='photo'/><br />
fig. 7: form for the Study-metadata and the result in tblStudyEventDef
</p>

<p>Now open <b>tblNewEventsToCreate</b> and fill in all fields, except <b>Response</b>. (Does that sound familiar?)
Now open form <b>frmCreateEvents</b> and you guessed it: name, password, Study, click it.</p>
<p>
<img src='/tds/img/ImagesHowTo/wsclient/wscl09.jpg' border='0'  class='photo'/><br />
fig. 8: table and form 
</p>

<p>As a bonus you get the StudySubjectOID in the Response!</p>
<p>
<img src='/tds/img/ImagesHowTo/wsclient/wscl10.jpg' border='0'  class='photo'/><br />
fig. 9: the result, including the StudySubjectOID
</p>

<h3>are you serious?</h3>
<p>Of course we're serious. Just look at the result:</p>
<p>
<img src='/tds/img/ImagesHowTo/wsclient/wscl11.jpg' border='0'  class='photo'/><br />
fig. 10: the result, in real OpenClinica-life
</p>



<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#webservices'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed November 2013</p>

</div>
	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
