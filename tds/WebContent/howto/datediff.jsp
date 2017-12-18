<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: calculating the number of days between two dates" /> 
<meta name="keywords" content="openclinica 3.1 training  open source software clinical trials datamanagement 
non-profit academic edc datefield calculation" /> 

<title>TrialDataSolutions: calculating the number of days between two dates</title>
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
<script src="/tds/js/highlight.pack.js" type="text/javascript"></script>
<script>hljs.initHighlightingOnLoad();</script>
</head>

<body>

<%@ include file="/includes/headermenu.jsp" %>
<hr />

<div id="wrap" class="group">
	
	<div class="main">		
		
		<div class="entry group">

<h1>the number of days between two dates</h1>
			
<p>When it comes to calculations OpenClinica offers basic functionality: you can do some calculations with integers and/or reals, but that's it.
But in your trial, you may want to display for example the number of days between two dates.</p>

<p>(Before we embark on our journey: if you're looking for this thing, but then with timefields: 
<a href='/tds/howto/timediff.jsp'>look here</a>!)</p>

<p><img src='/tds/img/ImagesHowTo/datediff/dd02.png' border='0'  class='photo'/><br />
fig. 1: example </p>

<h1>how difficult can that be?</h1>
<p>You may think "can't we just subtract date2 of date1?". No, unfortunately you can not do any calculations with dates and we will explain why not. 
But do not fear: you will see how to do it. 
If you can't wait to see it in action, click <a href='/tds/CRFExamples/DifferenceInDays.zip'>here</a> for the XL-file. <br />
It looks like this:
</p>

<p><img src='/tds/img/ImagesHowTo/datediff/dd01.png' border='0'  class='photo'/><br />
fig. 2: the XL </p>


<h1>first the script</h1>
<pre><code>&lt;div ID="Diff"&gt;&lt;/div&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;// for OC versions before 3.1.4, use jquery-1.3.2.min.js !&lt;/script&gt;
&lt;script&gt;
$.noConflict();
jQuery(document).ready(function($) { 
var fieldDate1 = $("#Date1").parent().parent().find("input");
var fieldDate2 = $("#Date2").parent().parent().find("input");
var fieldDiff = $("#Diff").parent().parent().find("input");

function OCDateToJDate(OCDate){
 //this function takes a date item in OpenClinica-notation 
 //and returns a date object
 //The names of the months are compared with the array in the Calendar utility
 //located in /includes/new_cal/lang
 var dateParts = OCDate.split("-");
 var JDate = new Date(1900,1,1);
 JDate.setFullYear(dateParts[2]);
 JDate.setMonth(Calendar._SMN.indexOf(dateParts[1]));
 JDate.setDate(dateParts[0]);
 return JDate;
 }

function DiffInDays(OCDate1, OCDate2){
 //calculate how many milliseconds are in a day
 var msecPerDay = 1000 * 60 * 60 * 24;
 //calculate millisecs for both dates
 var milliSec1=OCDateToJDate(OCDate1).getTime();
 var milliSec2=OCDateToJDate(OCDate2).getTime();
 //take the difference
 var interval =milliSec2 - milliSec1;
 //calculate the days
 var days = Math.round(interval / msecPerDay );
 if (isNaN(days)){
  return 0;
  }
 else{
  return days;
 }
}

function calcDiff(){
 //calculate the difference
 var calculatedDifference = DiffInDays(fieldDate1.val(), fieldDate2.val());
 //only write the difference if it's not already there
 if (fieldDiff.val() != calculatedDifference){
  fieldDiff.val(calculatedDifference);
  fieldDiff.change();
 }
};
fieldDate1.blur(function(){
 calcDiff();
 });
fieldDate2.blur(function(){
 calcDiff();
 });
fieldDiff.blur(function(){
 calcDiff();
 })
fieldDiff.focus(function(){
 calcDiff();
 })
$("#srl").focus(function(){
 calcDiff();
 });
$("#srh").focus(function(){
 calcDiff();
 });
})
&lt;/script&gt;</code></pre>

<h1>and then how it works</h1>
<p>Central in this bit of javascript is the function <b>OCDateToJDate</b> which takes an OpenClinica-date and converts it into a javascript
Date-object. This is done by splitting the date into three parts at the dash: <b>dateParts = OCDate.split("-");</b>.
The year and the days can be used immediately, but the month is given as three letters. And these can differ, depending on your i18n-settings.
For example if you're using OpenClinica with Dutch i18n-files (and you can: I'm serious), the name of the month would not be <b>Oct</b>
 but <b>okt</b>, like this:</p>

<p><img src='/tds/img/ImagesHowTo/datediff/dd03.png' border='0'  class='photo'/><br />
fig. 3: Dutch interface </p>

<p>(You can read more about i18n <a href='/tds/howto/propertiesfiles.jsp'>here</a>.)<br />
To get the correct number of the month, we look at an array called <b>Calendar._SMN</b>, which is included in our page,
because we have a calendar-utility. This is defined in <b>OpenClinica/includes/new_cal/lang/calendar-xx.js</b>, where
 xx stands for the language code.</p>
<p>The rest of the script speaks more or less for itself, except maybe the part where the calculation is made. 
This will happen when Date1 or Date2 loses focus, or when one of the two Save-buttons, or the item
with the difference gets the focus. This may seem a bit overdone, but comes from the fact that when we use the calendar-utility,
the item does not get the focus! Normally the blur-event would suffice, but in this case there will be no focus and hence no blur.
Unless of course the date is typed-in manually. That's why <b>fieldDiff.focus</b> is added and you may want to add (even more) 
extra information
in the RIGHT_ITEM_TEXT like <b>click to calculate the difference</b>. </p>
<p>You may look at the script and wonder where the <b>var JDate = new Date(1900,1,1);</b> comes from: can't we just take 
<b>var JDate = new Date();</b>? Well, we can not, because on some days this may mess up our calculation. Suppose that today is 31-Mar-2016.
This is stored in JDate. If we now try to use this to set JDate to 02-Sep-1962 then this is done in three steps: 
first the year, then the month and then the day. So ideally JDate would be:<br />
31-Mar-2016<br />
31-Mar-1962<br />
31-Sep-1962<br />
02-Sep-1962<br />
But in the month-step this goes wrong, because 31-Sep will be changed automatically to 01-Oct and JDate will end up as 02-Oct-1962.
This will not happen when we choose 01-Jan-1900 as starting date. Or any other date, as long as the month has 31 days.
</p>





<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#crfs'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed March 2016</p>
		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
