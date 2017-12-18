<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: an extra warning" /> 
<meta name="keywords" content="openclinica 3.1 training  open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: an extra warning or message in a CRF</title>
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
			<h3>warnings and messages</h3>
			
<p>On some occasions you may want to display to display extra text on your CRF, based on the input of the user. For example when
a lab value is out of the normal range, you want the user to be aware of this, without creating a Discrepancy.
Or when a user entered that co-medication was used, you may want to display a message
that the corresponding form must be entered.</p>

<p><img src='/tds/img/ImagesHowTo/warning/warn01.jpg' border='0'  class='photo'/><br />
fig. 1: example of a CRF with two extra warnings</p>

<p>This can be done with the help of some javascript. (Again!)<br />
You can download an example-CRF <a href='/tds/CRFExamples/CRFWithWarnings.xls' target='_blank'>here</a>.</p>


<h3>warning based on a numeric input</h3>
<p>Let's start with the range check of the first item. We get the warning by inserting the following text in the <b>RIGHT_ITEM_TEXT</b>.</p>
<pre>
&lt;div id="MessageDiv"&gt;&amp;nbsp;&lt;/div&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;// for OC versions before 3.1.4, use jquery-1.3.2.min.js !&lt;/script&gt;
&lt;script&gt;
$.noConflict();
jQuery(document).ready(function($) { 
var fieldToCheck = $("#MessageDiv").parent().parent().find("input");
 
function setMessage(){
  var valueToCheck = fieldToCheck.val();
  if (valueToCheck &amp;&amp; (valueToCheck &gt; 5 || valueToCheck &lt; 2)){
    $("#MessageDiv").html("Normal range is between 2 and 5!");
    }
  else {
    $("#MessageDiv").html("");
 };
};
fieldToCheck.keyup(function(){
  setMessage();
  });
setMessage();
})
&lt;/script&gt;
</pre>
<p>In the first line we define a block or <b>div</b> that will hold our message and we call it <b>MessageDiv</b>. 
We get to the CRF-item we want to check by going to the parent-of-the-parent of this div and then finding the <b>input</b> and we give this the name 
<b>fieldToCheck</b>. Every time something is entered in this CRF-item we want to call a function <b>setMessage</b> and this is done by 
using the keyup-method: <b>fieldToCheck.keyup(function(){setMessage();})</b></p>
<p>In the function <b>setMessage()</b> we first get the value of the CRF-item, <b>var valueToCheck = fieldToCheck.val();</b>
 and then we check if it exists at all and if so, if it is greater than 5 or less then 2. And if this is so, then we put a text in
 our div. </p>

<h3>can we do this with radio buttons?</h3>
<p>Radio buttons are slightly different, in that they come in pairs. In the example at the top of this page we see a group with the options
<b>yes</b> and <b>no</b>, with corresponding values (1 and 0, that are not visible). Again we must put some script in the <b>RIGHT_ITEM_TEXT</b>.</p>
<pre>
&lt;div id="ComedMessageDiv"&gt;&amp;nbsp;&lt;/div&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;// for OC versions before 3.1.4, use jquery-1.3.2.min.js !&lt;/script&gt;
&lt;script&gt;
$.noConflict();
jQuery(document).ready(function($) { 
var radiosToCheck = $("#ComedMessageDiv").parent().parent().find("input");
function setMessageCoMed(){
  
  for (var i = 0; i &lt; radiosToCheck.length; i++) {
              if (radiosToCheck[i].checked) {
                var valueToCheck = radiosToCheck[i].value;
              }
            }
  
  if (valueToCheck &amp;&amp; (valueToCheck == 1)){
    $("#ComedMessageDiv").html("Please complete the co-medication form in visit CoMed!");
    }
  else {
    $("#ComedMessageDiv").html("");
 };
};
radiosToCheck.change(function(){
  setMessageCoMed();
  });
setMessageCoMed();
})
&lt;/script&gt;
</pre>
<p>The big difference is the part where we want to get the value of a group of radio-buttons. For this we must loop through all
the buttons that are part of the group and we do this with <b>for (var i = 0; i &lt; radiosToCheck.length; i++)</b>.
And the one that is checked holds the value: <b>var valueToCheck = radiosToCheck[i].value;</b>.<br />
Notice that we now use the <b>change</b>-method: the function is called whenever the radio-group changes.</p>

<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#crfs'>here</a>.</p>
		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
