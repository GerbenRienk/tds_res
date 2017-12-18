<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: assigning a CRF to a study" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc free gratis database medisch onderzoek ecrf assigning a CRF to a study" /> 

<title>Trial Data Solutions: assigning a CRF to a study</title>
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
			<h3>Assigning a CRF to a study</h3>
			 
			<p>Once you have one or more CRF's, you want to assign them to a study. There is
			however a level in between and that is the Event. This is also called
			EventDefinition or StudyEventDefinition (SED) and is (more or less) a study
			visit. If you want to use a CRF in a study, you must first define the
			EventDefinitions / visits in that study.<br />
			If you haven't done this, click on "Tasks"- "Study setup"-"Build study". 
			</p>
			<p>
			<img src='/tds/img/ImagesHowTo/TaskMenuBuildStudy.jpg' border='0'  class='photo'/><br />
			fig. 1: Task menu: Build Study
			</p>
			<p>In the screen that now opens, go to step 3 "Create Event Definitions", 
			click on the + sign and follow the instructions. (For more detailed instructions,
			see <a href='createeventdefinition.jsp'>create an Event Definition</a>.)
			After you have added your Event / visit, you'll get a list of available
			CRF's and you can link any number of them to this Event / visit (see instructions below).</p>
			
			<h3>I already have Events, now what?</h3>
			<p>
			If you already have one or more EventDefinitions in your study, go again to
			the "Build study" page and now, click on the magnifier-icon in step 3
			"Create Event Definitions". (fig. 2)</p>
			<p>
			<img src='/tds/img/ImagesHowTo/ViewEventDefinitions.jpg' border='0'  class='photo'/><br />
			fig. 2: Build Study: Event Definitions
			</p>

			<p>
			In the screen that opens you get a list of EventDefinitions
			titled "Manage All Event Definitions in Study X".			
			Click on the pencil-icon ("Edit") on the right of the EventDefinition /
			visit you want to assign the CRF to. (fig. 3)</p>
			<p>
			<img src='/tds/img/ImagesHowTo/ManageEventDefinitions.jpg' border='0'  class='photo'/><br />
			fig. 3: Manage Event Definitions
			</p>

			<p> 
			This opens the edit-form of the Event, with two parts: the upper for editing details about the Event itself and the
			lower part with the CRF's associated with this event. Click on the link "Add a New CRF".
			(fig. 3)</p>
			<p>
			<img src='/tds/img/ImagesHowTo/AddANewCRF.jpg' border='0'  class='photo'/><br />
			fig. 4: Add a new CRF
			</p>
			
			<p>
			A list appears with all available CRF's. Check the box on the right and click on the button "Add". (fig. 5)</p>
			<p>
			<img src='/tds/img/ImagesHowTo/AddANewCRFToEvent.jpg' border='0'  class='photo'/><br />
			fig. 5: add CRF to Event
			</p>
			
			<p>
			Now there's one last thing to do: edit the properties of the CRF for this 
			particular Event. (fig. 6) If you're in a hurry, just untick "Required" and click button "Confirm" and you're done.</p>
			<p>
			<img src='/tds/img/ImagesHowTo/CRFPropertiesForEvent.jpg' border='0'  class='photo'/><br />
			fig. 6: CRF properties
			</p>
			
			<h3>A list of all CRF's used in your study</h3>
			<p>To view a list of all the CRF's that are used in your study you must follow almost the same steps as described above:
			"Tasks"-"Study Setup"-"Build Study"-"Create Event Definitions" and then the magnifier-icon. 
			You now have the "Manage All Event Definitions in Study X" screen (fig. 3). You will see no CRF's 
			in this list, unless you click on "Show More". Now two more columns are displayed: one with CRF's and one with their default version. (fig. 7) </p>
			<p>
			<img src='/tds/img/ImagesHowTo/EventsShowMore.jpg' border='0'  class='photo'/><br />
			fig. 7: list of CRF's for a study
			</p>
			
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
