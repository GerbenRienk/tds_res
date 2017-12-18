<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: : how to create a new Event Definition" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc free gratis database medisch onderzoek ecrf Event Definition" /> 

<title>Trial Data Solutions: how to create a new Event Definition for OpenClinica</title>
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
			<h3>How to create a new Event Definition</h3>
			 
<p>An "Event" or "Study Event" or "Event Definition" (or sometimes "StudyEventDefinition") is more or less a visit in your study. Setting up an Event / visit
is very easy and straightforward. In the process you can make several changes regarding the nature of the event, 
but almost all of them can be changed in a later stage.<br />
To add a new event to a study you must be logged in to OpenCLinica as studydirector. Click on "Tasks"-
"Study Setup"-"Build Study" (fig. 1).</p>
<p>
<img src='/tds/img/ImagesHowTo/TaskMenuBuildStudy.jpg' border='0'  class='photo'/><br />
fig. 1: Task menu: Build Study
</p>

<p>In the list with tasks, go to the third row "3 Create Event Definitions" and click on the plus-icon (fig. 2).</p>
<p>
<img src='/tds/img/ImagesHowTo/NewEvent/AddNewEvent.jpg' border='0'  class='photo'/><br />
fig. 2: Create Event Definition
</p>

<p>A screen opens with five fields that define your new Event / visit (fig. 3).</p>
<p>
<img src='/tds/img/ImagesHowTo/NewEvent/DefineStudyEvent.jpg' border='0'  class='photo'/><br />
fig. 3: Study Event Definition
</p>



<h3>Naming your event</h3>
<p>Every Event gets a unique OpenClinica-ID or OID. You can change the name of an Event at any time, but after
creation, you can not change the OID of an Event. For example: you want to create two visits for your study
but you are not certain how to name them, so you decide for the time being to call them <b>Visit1</b> and <b>Visit2</b>. 
The OID's will be <b>SE_VISIT1</b> and <b>SE_VISIT2</b> (fig. 4). 
Later on you may decide to call them <b>Week 12</b> and <b>Week 24</b>, but the OID's will not change accordingly.<br />
Furthermore you can add a description to your Event and as always: put as much information here as you possibly can!<br />
If we skip to the last field of this screen we see <b>Category</b>. You can use this field as an extra label of your Event.
In the screen "Manage All Event Definitions in Study X" you can sort on this field.
</p>
<p>
<img src='/tds/img/ImagesHowTo/NewEvent/EventNamesAndOIDs.jpg' border='0'  class='photo'/><br />
fig. 4: Event names and OID's
</p>

<h3>Scheduling and repeating</h3>
<p>OpenClinica has three Types of Events / visits: <b>scheduled</b>, <b>unscheduled</b> and <b>common</b>. 
For a detailed description see the text above the Edit screen: "A Scheduled event is one that is expected to occur for each subject as part of the ordinary progress of the study. 
An Unscheduled event is not expected to occur, but may occur as circumstance dictates.
Scheduled and unscheduled events typically occur at some particular time.
A Common event collects data forms, but is not expected to be associated with a particular time."<br />
In most trials you'll work with scheduled events: Baseline visit, Day 1, Day 6, Day 15, EndOfStudy. And if you know the 
date of the Baseline visit, you can calculate the dates of the other visits. You would define all these visits as 
<b>non-repeating</b>, because your study-protocol says so.<br />
But suppose you want to record some details of Subjects who show up on any other day than the scheduled Visit-days. 
Then you would create an Unscheduled visit with those details. 
And because Subjects can come more than just once, you would define this Event as <b>Repeating</b>. If more than one Event exists
for a Subject you'll see it in the SubjectMatrix as <img src='/tds/img/ImagesHowTo/NewEvent/DoubleCRF.jpg' border='0' />
<br />
Then the <b>Common Event</b>: you can use this as a way to collect CRF's with all other data, than the data collected 
in your study visits.
</p>
<p>This may all seem a bit confusing, but remember: everything about an Event can be changed at any time, except the OID.
You can even change an Event from repeating to non-repeating. Even when there are subjects in your study
with more than one occurrence of the Event, you still can change the Event from repeating to non-repeating.</p>
<p>More how-to-pages can be found <a href='/tds/howto/index.jsp#events'>here</a>.</p>
		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
