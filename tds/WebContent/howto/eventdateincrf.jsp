<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: copying the Event-date in the CRF" /> 
<meta name="keywords" content="openclinica 3.1 training  open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: the Event date in your CRF</title>
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

<h3>the Event-date in your CRF</h3>
			
<p>Many OpenClinica-users would like to use the Event-date in Validations. But this date can not be used in Rules, because only 
CRF-items can be used. An example would be that you want the Event-date to be after the Study-start-date or after the Inclusion-date
or between 12 and 16 days after the previous Event. A work-around for this is copying the Event-date from the header
of the CRF to a CRF-item.</p>

<p><img src='/tds/img/ImagesHowTo/eventdateincrf/ec01.png' border='0'  class='photo'/><br />
fig. 1: example of what we want</p>

<p>As you can see are both the Event-name and Event-date are displayed in the box <b>CRF Header Info</b> and we can 
copy it from there using javascript. <br />
You can download the example-CRF <a href='/tds/CRFExamples/VisitDateFromHeader.zip' >here</a>.</p>




<h3>the script </h3>

<p>To get the Event-date-copy you create an item <b>VDATE</b> and insert the script in the <b>RIGHT_ITEM_TEXT</b>:</p>
<p><img src='/tds/img/ImagesHowTo/eventdateincrf/ec02.png' border='0'  class='photo'/><br />
fig. 2: the script</p>


<p>This is the script:</p>
<pre>
&lt;div id="event"&gt;&lt;/div&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;&lt;/script&gt;
&lt;script&gt;
    $.noConflict();
    jQuery(document).ready(function($) { 
        var fieldEvent = $("#event").parent().parent().find("input");
        fieldEvent.attr("readonly", true);
        var event = $(".tablebox_center").find("tbody:first").children("tr:nth-child(1)").children("td:nth-child(2)").text();
        event = $.trim(event);
        var posBracket = event.indexOf("(");
        event = event.substring(posBracket + 1, posBracket + 12);
        if(fieldEvent.val()!=event){
            fieldEvent.val(event);
            fieldEvent.change();
        }
    });
&lt;/script&gt;
</pre>
<p>In the first line we define a block or <b>div</b> and call it <b>event</b>. 
We get to the CRF-item we want to copy the ID into, by going to the parent-of-the-parent of this div and then finding the <b>input</b> 
and we give this the name <b>fieldEvent</b>. To prevent the user from changing the date, we set it read-only.<br />
The Event-date can be found by starting at  
<b>tablebox_center</b> and going the path from tbody to the second <b>td</b> of the first <b>tr</b>.<br />
As you can see in the screen-shot, first the Event-name is displayed and then the Event-date between brackets. Therefore 
we look for the first position of a left-bracket and from there take 11 characters. We compare this value with the the content
of the CRF-item and if that's different, we replace the CRF-item with the value from the header.
</p>
<p>Now we can write our Validations using the CRF-item <b>VDATE</b>. Do not forget to instruct your users that
if a change is required they must exit the CRF and then change the <b>Event-date</b>!</p>


<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#crfs'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed January 2014</p>

		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
