<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: using a regular expression to create a time field" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: using a regular expression to create a time field for OpenClinica</title>
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
			<h3>using a regular expression to create a time field</h3>
			
			<p>Every now and then you may be in need of a time field. But, however flexible OpenClinica may be with dates and partial dates,
			there is no standard time-field-type. This can be solved by using a regular expression, that checks the format of a field.</p>
			
			<h3>the regular expression</h3>
			<p>We would like our time-field to accept input like 01:26 or 11:00 or 19:59 or 20:00 or 23:59 and to reject input like
			88:99 or 4:6<br />
			Let's first concentrate on the input until 20:00. The regular expression would be <b>[0-1]\d:[0-5]\d</b> 
			meaning more or less: start with 0 or 1 ([0-1]), followed by a digit (\d), then the colon (:) followed by the minutes
			as something in the range from 0 to 5 ([0-5]) followed by a digit (\d).
			<br />
			Then the time from 20:00 till 23:59. The regular expression would be quite similar: <b>2[0-3]:[0-5]\d</b> and that translates to: 
			start with a 2 (2), followed by anything in the range from 0 to 3 ([0-3]), then the semicolon and the minutes, as described before.<br />
			The last thing to do is combine these two with a pipe(|): <b>[0-1]\d:[0-5]\d|2[0-3]:[0-5]\d</b></p>
			
			<h3>testing the regular expression with regexpal</h3>
			<p>Testing a regular expression in OpenClinica is not an easy task: you have to put the regexp in your XL-sheet and upload it. 
			The syntax is validated, but not the result. In other words: your expression may be syntactically correct but accepts the wrong input or 
			rejects the right input. Checking this would require to add the CRF to a study event and then try different values. 
			Then modify the regexp, upload a new version etc, until the results are OK.<br />
			Fortunately there are tools to do this for you and one of these is 
			<a href='http://regexpal.com/' target='_blank'>http://regexpal.com/</a>. The interface consists of two Text-areas: one for your 
			regular expression and one for your input. As you can see in the screenshot below I copied the regular expression in the
			first field and the values I would like to test, taken from the above text, in the second field (fig. 1)</p>
			<p>
			<img src='/tds/img/ImagesHowTo/RegExPal.jpg' border='0' class='photo' /><br />
			Fig. 1: regexpal testing
			</p>
			<p>Every bit of the text-string that matches the regular expression is highlighted in yellow or blue and you see 
			immediately that this expression is the right one for your job.</p>
			
			<h3>putting the regular expression in your XL-sheet</h3>
			<p>Now you can use the regexp in your XL-sheet. Add an item in the usual way and use for RESPONSE_TYPE (col. N) "text",
			for DATA_TYPE (col. T) "ST" for string. Your regexp goes in VALIDATION (col. V), preceeded with "regexp:" and enclosed with slashes.
			And in col. W goes your VALIDATION_ERROR_MESSAGE.</p>
			<p>
			<img src='/tds/img/ImagesHowTo/RegExInXL.jpg' border='0' class='photo' /><br />
			Fig. 2: putting the regexpal in the XL-sheet
			</p>
			<p>And there you have it: your own time-field.</p>
			
<h3>that's good, but what about comparing times?</h3>
<p>Can you use this regular expression to compare times? For example you must record two time A and B and B must be later than A.
You want to create a rule for that, but when you try to upload it, you get the message<br />
<b>OCRERR_0001 : Logic Error, I_TDSDI_TIMETWO and I_TDSDI_TIMEONE cannot be used with the GREATER_THAN operator.</b> This is because our Items are of DATA_TYPE 
<b>ST</b>.<br />
We want to be able to use the <b>gt</b>-operator in our expression, so we change the DATA_TYPE to <b>REAL</b>. 
And furthermore we change our regular expression slightly: 
instead of the <b>:</b> we use <b>.</b> as the 
separator of hours and minutes. To use the <b>.</b> in a regular expression, it must have a <b>\</b> before it, because the dot is 
a special character for regular expressions.<br />
This brings us to <b>[0-1]\d\.[0-5]\d|2[0-3]\.[0-5]\d</b></p>
	<p>
	<img src='/tds/img/ImagesHowTo/usingregexpfortimefield/urft01.jpg' border='0' class='photo' /><br />
	Fig. 3: a different format, so we can compare
	</p>
<p>Now we're talking REALs, so we can use them in a comparison and our Rule will upload with
congratulations and all:</p>

	<p>
	<img src='/tds/img/ImagesHowTo/usingregexpfortimefield/urft02.jpg' border='0' class='photo' /><br />
	Fig. 4: a snippet of the Rule
	</p>

<h3>and calculations? can you do that?</h3>

<p><a href='timediff.jsp'>Here</a> you can find a new and updated page about how 
to calculate the number of minutes between two time fields, even if those time-fields are 
in a repeating-item-group.<br />
The information below is correct, but we advise you to go to the other page.</p>



<p>Calculations is quite another story. Say you're taking two blood-samples and the time between those should be less than 2 hours
and 30 minutes. The trick with the point as separator won't bring us very far.<br />
(This example is not random: if you only need to check the time difference in hours, you can use the REAL-format. As soon as you have minutes
you can not anymore.)<br />
But we can create a workaround to solve this. For each time field we add another item where we can store the "minutes since midnight" value.
Hang on to your seats, because we will need some java-scripting for that.
</p>
<p>We start with the CRF with four items: two time fields and two auxiliary fields.</p>
	<p>
	<img src='/tds/img/ImagesHowTo/usingregexpfortimefield/urft03.jpg' border='0' class='photo' /><br />
	Fig. 5: definition of the 4 fields
	</p>
<p>What's happening here? Well, we have two time-fields which are of type ST, <b>TimeOne</b> and <b>TimeTwo</b>. We will use these in
a calculation with a script, so we name them <b>TimeField1</b> and <b>TimeField2</b>. We're going to calculate the minutes since midnight
and the results will be put in <b>TimeOneMinutes</b> and <b>TimeTwoMinutes</b>, which we will also give an id, <b>Minutes1</b>
and <b>Minutes2</b>, using the tag in the Right_Item_Text.</p>

<p>The script to calculate the minutes since midnight will be put in the Instructions part of the Section.</p>
	<p>
	<img src='/tds/img/ImagesHowTo/usingregexpfortimefield/urft04.jpg' border='0' class='photo' /><br />
	Fig. 6: the script
	</p>
<p>Now before we have a look at the script, let's have a look at the result:</p>
	<p>
	<img src='/tds/img/ImagesHowTo/usingregexpfortimefield/urft05.jpg' border='0' class='photo' /><br />
	Fig. 7: the script in action
	</p>
<p>What we see here are the two time fields, 01:40 and 03:50 and the minutes since midnight for both:
100 and 230. With these fields we can make a Rule that raises a Discrepancy if the difference in minutes is more than 
150 minutes (2 hours and 30 minutes).</p>
<p>If you're in a hurry to implement this technique, you can download the CRF <a href='/tds/CRFExamples/TimeFields.zip'>here</a>: 
the last part explains a bit more about the script.</p>

<h3>a closer look at the script</h3>
<p>Here is the script:</p>
<pre>
&lt;script src="includes/jmesa/jquery.min.js"&gt;// for OC versions before 3.1.4, use jquery-1.3.2.min.js !&lt;/script&gt;
&lt;script lang="Javascript"&gt;
$.noConflict();
jQuery(document).ready(function($){
	//find out who's who
	var fieldTimeField1 = $("#TimeField1").parent().parent().find("input");
	var fieldMinutes1 = $("#Minutes1").parent().parent().find("input");
	var fieldTimeField2 = $("#TimeField2").parent().parent().find("input");
	var fieldMinutes2 = $("#Minutes2").parent().parent().find("input");

	function calculateMinutes(fieldTimeField, fieldMinutes){
		// retrieve values
		var TimeAsText = fieldTimeField.val();
		var currMinutes = fieldMinutes.val();
		// check whether both fields are filled
		if(TimeAsText!=""){
			// split and determine hours and minutes
			var splitString = TimeAsText.split(":");
			var hours = splitString[0];
			var minutes = splitString[1];
			var calcMinutes = (60*hours)+(1*minutes);
			if (calcMinutes != fieldMinutes.val()){
				fieldMinutes.val(calcMinutes);
				fieldMinutes.change();
			}
		}
	}
	// fire when anything is entered 
	fieldTimeField1.keyup(function(){
		calculateMinutes(fieldTimeField1, fieldMinutes1);
	});
	fieldTimeField2.keyup(function(){
		calculateMinutes(fieldTimeField2, fieldMinutes2);
	});
});
&lt;/script&gt;
</pre>

<p>Although it's lengthy, it's easy to follow. First fieldTimeField1 and fieldMinutes1 are identified. 
Then the same is done for fieldTimeField2 and fieldMinutes2. <br />
When anything is typed in one of the fields , <b>fieldTimeField1.keyup(function()</b> and <b>fieldTimeField2.keyup(function()</b>, the 
calculations are made by calling function <b>calculateMinutes()</b>. </p>

<p>The calculation is done in <b>function calculateMinutes(fieldTimeField, fieldMinutes)</b>: fieldTimeField is used to calculate with
and the result is written to fieldMinutes. To do this the fieldTimeField is split at the <b>:</b> in an hours-part and a minutes-part 
and these are added: <b>calcMinutes = (60*hours)+(1*minutes)</b>.</p>

<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#crfs'>here</a>.</p>

<p class='pagereviewdate'>this page was last reviewed April 2014</p>

</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
