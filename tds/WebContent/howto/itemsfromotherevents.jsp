<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: items from other Events" /> 
<meta name="keywords" content="openclinica 3.4 training  open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>TrialDataSolutions: items from other Events</title>
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

<h3>items from other Events</h3>
			
<p>You may not be aware of this, but the OpenClinica programmers are rewriting the software. You can see this for example when you 
want to print a StudySubject-casebook: in the URL of your browser you see something like
<b>rest/clinicaldata/html/view/</b> followed by some OID's. REST is another way of requesting data. Just like SOAP it is a web-service.
Starting from version 3.4 we can make good use of it if we want to display the values of items that were collected in other Events. 
We emphasize <b>other</b>, because for items in the same Event we can use an InsertAction.<br />
Take a look at the following CRF, where we collect the Randomisation number of a StudySubject plus his or her length.
All this is done in Event Screening.</p>

<p><img src='/tds/img/ImagesHowTo/itemsfromotherevents/ifoe01.jpg' border='0'  class='photo'/><br />
fig. 1: example of a screening CRF</p>

<p>Now suppose we want to display the RandomisationNumber in the next Event plus we want to measure the weight, but we 
also would like the length. And again: this can not be done by InsertActions, as the CRF's are in different Events. <br />
Fig. 2 shows what we want:</p>

<p><img src='/tds/img/ImagesHowTo/itemsfromotherevents/ifoe02.jpg' border='0'  class='photo'/><br />
fig. 2: what we would like</p>

<h3>what?! how?</h3>
<p>What follows is an explanation how you can get results like that, but if you want to try this for yourself on your own OpenClinica:
go ahead with <a href='/tds/CRFExamples/ItemsFromOtherEvents.zip'>these CRFs</a>. Of course you must edit the javascript in the CRF
to use the OIDs of your particular sitation. <a href='/tds/howto/findingoids.jsp' target='_blank'>Here</a> is a page that explains 
how to find the OIDs.</p>
<p>What we did was adding some javascript to the RightItemText and in it, we requested the data from the Screening-Event for this 
particular StudySubject. Have look at the javascript for the first Item, where we display the RandomisationNumber in the RightItemText:</p>
<pre>

&lt;div id="ValueFromOtherEvent"&gt;&lt;/div&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;&lt;/script&gt;
&lt;script&gt;
$.noConflict();
jQuery(document).ready(function($) { 
	// let the urlStart end with the OID of your Study
	var urlStart = "rest/clinicaldata/xml/view/S_TDS01/";
	// use for urlTail the StudyEventOID
	var urlTail = "/SE_SCREENING/*";
	// put here the OID of the Item you want to display
	var itemOID = "I_TDSSC_RANDONR";
	// now we can compose the url for the REST-request
	var urlComplete = urlStart + "$&#123;studySubjectOID&#125;" + urlTail; 
	// make the request
	$.ajax({
		type: "GET",
		url: urlComplete,
		dataType: "xml",
		success: parseXML
		});
	// analyse the response
	function parseXML(xml){
		// set the default to: not available
		var OtherValue = "not available";
		// loop through the nodes called ItemData ...
		$(xml).find("ItemData").each(function(){
			// ... and look for the one with the OID that was set above ...
			if($(this).attr("ItemOID") == itemOID){
				// and store the value
				OtherValue = "Randomisationnumber as set in the Screening visit: " + $(this).attr("Value");
				}
			})
		// write the value in the div
		$("#ValueFromOtherEvent").html(OtherValue);
		}; 
	})
&lt;/script&gt;
</pre>
<p>You can almost read this from the top to the bottom. All you need to know is how we compose the URL for our request for the data.
The syntax for this is: <b>rest/clinicaldata/xml/view/StudyOID/StudySubjectOID/StudyEventOID/*</b><br />
Of this <b>rest/clinicaldata/xml/view/</b> is standard. The <b>StudyOID</b>, the <b>StudySubjectOID</b> and the <b>StudyEventOID</b>
we must supply. The <b>*</b> at the end means 'data from all CRFs'.</p>

<p>In our example we start with the variable <b>var urlStart = "rest/clinicaldata/xml/view/S_TDS01/";</b> where the last bit is the OID of your Study.
Then we define the OID of the StudyEvent:
<b>var urlTail = "/SE_SCREENING/*";</b><br />
Of course we must know the OID of the item that holds our RandomisationNumber and we store that for later use:
<b>var itemOID = "I_TDSSC_RANDONR";</b><br />
Now we are ready to compose our url with the aid of the token for the StudySubjectOID:<br />
<b>var urlComplete = urlStart + "$&#123;studySubjectOID&#125;" + urlTail;</b>. This will fill in the StudySubjectOID
during the opening of the CRF.<br />
Then we request the clinicaldata with <b>$.ajax</b> and if we get something, we call <b>function parseXML(xml)</b>.<br />
If you want to know what that REST-request gets you, type it in your browser and you will see something like fig.3.
</p>

<p><img src='/tds/img/ImagesHowTo/itemsfromotherevents/ifoe03.jpg' border='0'  class='photo'/><br />
fig. 3: the result of the REST-request</p>

<p>Now it is only a small step to lay our hands on <b>RN010</b>: we loop through the nodes called <b>ItemData</b> with
<b>$(xml).find("ItemData").each(function()</b> and
check if the OID is the one we set at the start of the script: <b>if($(this).attr("ItemOID") == itemOID)</b> and
if that is so, we can use it to display it in the RightItemText.</p>

<h3>and what about the length?</h3>
<p>Displaying a value of an item from another Event seems trivial and not very useful. This is different for 
Item <b>Length</b>, because there the value entered at Event screening is copied! How? <br />
Well, if you look at the other javascript you see that most of it is exactly the same as the one above 
</p>

<pre>
&lt;div id="LengthFromScreening"&gt;(As recorded in Event Screening.)&lt;/div&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;&lt;/script&gt;
&lt;script&gt;
$.noConflict();
jQuery(document).ready(function($) {
	// define the field to write the value in
	var fieldLength = $("#LengthFromScreening").parent().parent().find("input");
	fieldLength.attr("readonly", true);
	// let the urlStart end with the OID of your Study
	var urlStart = "rest/clinicaldata/xml/view/S_TDS01/";
	// use for urlTail the StudyEventOID
	var urlTail = "/SE_SCREENING/*";
	// put here the OID of the Item you want to display
	var itemOID = "I_TDSSC_LENGTH";
	// now we can compose the url for the REST-request
	var urlComplete = urlStart + "$&#123;studySubjectOID&#125;" + urlTail; 
	// make the request
	$.ajax({
		type: "GET",
		url: urlComplete,
		dataType: "xml",
		success: parseXML
		});
	// analyse the response
	function parseXML(xml){
		// loop through the nodes called ItemData ...
		$(xml).find("ItemData").each(function(){
		// ... and look for the one with the OID that was set above ...
		if($(this).attr("ItemOID") == itemOID){
			// and store the value
			OtherValue = $(this).attr("Value");
			}
		 })
		// write the value, if it is not there already
		if (fieldLength.val() != OtherValue){
			fieldLength.val(OtherValue);
			fieldLength.change();
			}; 
	}
	})
&lt;/script&gt;
</pre>

<p>We make a reference to the input field where we want to write the length of Event Screening by
taking the parent of the parent of the div that is called 'LengthFromScreening'and then finding the input:
<b>var fieldLength = $("#LengthFromScreening").parent().parent().find("input");</b>.<br />
We get our value in the same way as above, and when we have it, we first check if the value is already in place, with 
<b>if (fieldLength.val() != OtherValue)</b> and if not, we set the value with <b>fieldLength.val(OtherValue);</b>. 
Note that we also set the status of the item to 'changed', <b>fieldLength.change();</b>
so OpenClinica knows it should store tha data of this CRF.</p>


<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#crfs'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed October 2014</p>
		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
