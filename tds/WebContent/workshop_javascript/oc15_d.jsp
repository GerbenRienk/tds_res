<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: javascript" /> 
<meta name="keywords" content="openclinica 3.x training  open source software clinical trials datamanagement 
non-profit academic edc calculating with dates buttons" /> 

<title>TrialDataSolutions: workshop javascript</title>
<link rel="stylesheet" type="text/css" media="screen, projection" href="/tds/css/screen.css" />
<script src="/tds/js/jquery-1.2.6.min.js" type="text/javascript"></script>

<script src="/tds/js/ga.js" type="text/javascript"></script>
<script src="/tds/js/highlight.pack.js" type="text/javascript"></script>
<script>hljs.initHighlightingOnLoad();</script>
</head>

<body>

<%@ include file="/includes/headermenu.jsp" %>

<div id="wrap" class="group">
	<div class="main">		
		<div class="entry group">


<h1>working with dates plus a nice button</h1>

<p>Working with dates can be quite a challenge. The reason being that dates in javascript are special beasts. Download <a href='CRFs/CRFD.xls'>this CRF</a> and upload it to your instance. And then, as before, open the CRF in preview and save the screen as <b>D:\tomcat\webapps\oc341\StaticCRF_D.html</b>. Open it in notepad++ and find "OCDateToJDate", around line 1560. You see there a function to convert an OpenClinica-date into a java-date. This way we make calculations with dates. We will look into the function shortly, but first we will create a button, so we can execute some actions.<br /> Look for <b>&lt;div ID="Diff"&gt;&lt;div&gt;</b> and next to it write code to display an input of type button. We want it to look like a real OpenClinica-button, so we give it the already existing class 'class="button"': That makes the first part of our script look like this:</p>

<pre><code>&lt;div ID="Diff"&gt;&lt;/div&gt;
&lt;input type="button" id="actionButton" value="let's rock" class="button"&gt; 
&lt;script src="includes/jmesa/jquery.min.js"&gt;&lt;/script&gt;
</code></pre>

<p>Next thing to do is write a function to do some calulations. </p>
<pre><code>	function calculateIt(){
		console.log('this will be my calculation');
		}
</code></pre>
<p>And we add some code to do execute the calculation-function when the button is clicked:</p>
<pre><code>	function calculateIt(){
		console.log('this will be my calculation');
		}
	&#36;("#actionButton").click(function(){calculateIt();})
	calculateIt();
</code></pre>
<!-- click it a few times to see what happens -->
<p>Now we have everyhing we need to dive into dates. Lets see what the function OCDateToJDatedoes. First it "splits" the date, with the "-" as separator. That gives us three parts, numbered 0, 1 and 2. We can view the result in the console with:</p>
<pre><code>	function calculateIt(){
		varExample = fieldDate1.val().split("-");
		console.log(varExample[0]);
		console.log(varExample[1]);
		console.log(varExample[2]);
		}</code></pre>

<p>So the result of this splitting and combining is a date, with which we can subtract:</p>
<pre><code>	function calculateIt(){
		var dtD1 = OCDateToJDate(fieldDate1.val());
		var dtD2 = OCDateToJDate(fieldDate2.val());
		console.log('date1: ' + dtD1);
		console.log('date2: ' + dtD2);
		console.log('difference: ' + (dtD2 - dtD1));
		}</code></pre>

<p>Now we see that some calculation is made, but what exactly is it? If we enter two dates with one day difference, 
the console shows "86400000" and that may look familiar. It's the number of milliseconds in a day: 1000*60*60*24. 
So if we divide the difference in milliseconds by 86400000 we get the difference in days. 
Now when we want to write this difference to the CRF we can use the same construction: 
only write if there's a difference and set the item's status to "changed" and please make it readonly:</p>

<pre><code>function calculateIt(){
	var dtD1 = OCDateToJDate(fieldDate1.val());
	var dtD2 = OCDateToJDate(fieldDate2.val());
	var diff = (dtD2 -dtD1)/86400000;
	if (fieldDiff.val() !== diff){
		fieldDiff.val(diff);
		fieldDiff.change();
		fieldDiff.prop("readonly", true);
		}
	}</code></pre>

<p>Now look very carefully, because something strange is happening: the text on our button changes! How can this be? It is because with <b>var fieldDiff = &#36;("#Diff").parent().parent().find("input");</b> we refer not to just one element, but to a collection of elements. But we're only interested in the first occurrence of the input and this we can indicate by changing the line into <b>var fieldDiff = &#36;("#Diff").parent().parent().find("input").first();</b></p>

<h1>but when? and how?</h1>
<p>This looks good, but it has a flaw: the calculation-function is only executed when our button is clicked. And if the user forgets to click it, no result is written to the CRF. You might suggest to add an onkey-event for the dates. If we try that, we see that it works, but there will probably be no onkey-events, because the date-picker is used most of the time. We can define an event on the difference-field, for example when that field gets the focus, the calculation will be executed. This is slightly better, but not a 100% guarantee that the calculation will be triggered. </p>
<p>A better approach would be the clicking of one of the two save-buttons. Switch back to the SubjectMatrix and open a CRF for dataentry. Now right-click on the high save-button and choose "inspect element". We see that the id of this button is <b>srh</b> and that there is already something to happen when the button is clicked. Our option B is therefore to take the event just before the click-event and that is the moment this button gets the focus. And we do this for the low save-button <b>srl</b> as well:</p>

<pre><code>&#36;("#srh").focus(function(){
 calculateIt();
 });
&#36;("#srl").focus(function(){
 calculateIt();
 });
</code></pre>

<p>And if you want to make it really, really smooth ...</p>
<pre><code>&#36;("#mainForm").keydown(function(event) {
  if (event.which == 13) {
  	calculateIt();
  }
});</code></pre>




<p align='right'><a href='/tds/workshop_javascript/index.jsp'>Start-page of the workshop.</a></p>
<p class='pagereviewdate'>this page was last reviewed July 2015</p>
    </div> <!-- /.entry group -->
  </div> <!-- /.main -->
  
<%@ include file="/includes/footerhowto.jsp" %>
  <hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
