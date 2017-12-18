<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: counting characters" /> 
<meta name="keywords" content="openclinica 3.1 training  open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: counting the characters left</title>
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
			
<p>The following page was written for OpenClinica versions before 3.2: from that version on it is allowed to store up to 3999 characters in
both text fields and text-areas.</p>

<h3>counting characters</h3>			
<p>For both text-inputs and text-areas the maximum number of characters is 255. This limit has been "programmed" into OpenClinica: the limit 
is restricted to 4000 characters by postgres. If you want to store more than 255 characters, you must make a Discrepancy for it.</p>
<p>To make it a bit easier for our users, we can add a counter, that displays the number of characters left.</p>
<p>You can download an example-CRF <a href='/tds/CRFExamples/CharacterCounter.xls' target='_blank'>here</a>.</p>

<h3>javascript to the rescue</h3>
<p>We construct the counter with some javascript, using jQuery, which is already included in the code of our CRF. 
We put it all in the <b>RIGHT_ITEM_TEXT</b> of the item we want to count.</p>
			
<p><img src='/tds/img/ImagesHowTo/charcount/cc01.jpg' border='0'  class='photo'/><br />
fig. 1: CRF with javascript</p>

<h3>what does it look like?</h3>
<p>Here you see the CRF in action:</p>
<p><img src='/tds/img/ImagesHowTo/charcount/cc02.jpg' border='0'  class='photo'/><br />
fig. 2: CRF in action</p>
<p>We see to the right of the input another, disabled, input, showing the number of characters left.</p>

<h3>fine, but how does it work?</h3>
<p>Let's take a look at the script.</p>
<pre>

&lt;div id="ITC"&gt;&lt;/div&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;// for OC versions before 3.1.4, use jquery-1.3.2.min.js !&lt;/script&gt;
&lt;script lang="Javascript"&gt;
$.noConflict();
jQuery(document).ready(function($) { 
var fieldInputToCount = $("#ITC").parent().parent().find("input");

fieldInputToCount.keyup(function(){
 var textinput = fieldInputToCount.val();
 var charcount = 255 - textinput.length;
 $("#ITC").html('Characters left: ' + charcount);
      });
   }
)
&lt;/script&gt;

</pre>
<p>First of all the <b>div id="ITC</b>": this is used to localize the input of which we want to count the characters plus it 
is used to display the message how many characters are left.
We will refer to this input as <b>fieldInputToCount</b> and this is done with <b>$("#ITC").parent().parent().find("input")</b>,
 which takes the element called ITC and then goes to the parent and again to the parent (grandmother?) and then looks for 
 the element of type input.<br />
 Then we define a function that is triggered by every keystroke done in this element by <b>fieldInputToCount.keyup</b>.
 We take the value of our element and call this value <b>textinput</b> and of this we can take the length and subtract
 that from 255, our maximum. This is then the number of characters left and we store it in a variable called 
 <b>charcount</b>. The thing left to do is display the number of characters left and for that we use 
 <b>$("#ITC").html('Characters left: ' + charcount);</b>. </p>
 
 <p>If you want to apply this technique to a text-area, you can use the same script, except that you must use
 <b>$("#TATC").parent().parent().find("textarea")</b>.</p>


<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#crfs'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed December 2013</p>
		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
