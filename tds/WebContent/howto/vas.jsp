<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="TDS: rules for items in a repeating_item_group" /> 
<meta name="keywords" content="openclinica 3.1 training conditional display status open source software clinical trials datamanagement 
non-profit academic edc insert action repeating items default values visual analogue scale vas" /> 

<title>Trial Data Solutions: a Visual Analogue Scale</title>
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
<h3>two examples of visual analogue scale</h3>
<p>Some Studies use a Visual Analogue Scale to measure for example pain. A Subject is asked to mark a line that
ranges from 0 to 100 and the "score" is then put into the EDC.</p>

<p><img src='/tds/img/ImagesHowTo/vas/vas_example.jpg' border='0'  class='photo'/><br />
fig. 1: Example of a VAS</p>

<p>Wouldn't it be nice if we could have something like that in OpenClinica? Indeed.</p>

<p>We will explain on this page how you can do this, and you can download
the two examples plus the images we use by clicking <a href='/tds/CRFExamples/VAS.zip'>here</a>.<br />
In the first example we will use one image that is already included in the OpenClinia installation. In the second example we will use 
two images that must be copied to the images-dir of OpenClinica and for this you must have access to the OpenClinica-server. </p>

<h3>start simple</h3>
<p>To start simple, we will use for our scale just a block, which is called a <b>DIV</b> in HTML, in the right_item_text. We will give it 
a border and a color. For the pointer of the VAS we will use an already existing image, more or less a red vertical line.
The result will be this:</p>

<p><img src='/tds/img/ImagesHowTo/vas/vas00.jpg' border='0'  class='photo'/><br />
fig. 2: simple VAS</p>

<p>To get this we put the following script in the <b>RIGHT_ITEM_TEXT</b>:<br />
(no need to read: just paste it; all will be explained below)</p>
<pre>

&lt;table border='0' cellspacing='0' id='VAStable'&gt;&lt;tr&gt;&lt;td colspan='3'&gt;
&lt;div id="VAS" style="background-color:rgb(236,236,236);width:300px;border-color:rgb(153,153,153);border-width:2px;border-style:solid;"&gt;
&lt;img id="pointer" src="images/subnav_R_TechAdmin.gif" style="width:3px;height:20px;position:relative;left:0;"&gt;
&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td style="width:33%;text-align:left;"&gt;0&lt;/td&gt;&lt;td style="width:33%;text-align:center;"&gt;50&lt;/td&gt;&lt;td style="width:33%;text-align:right;"&gt;100&lt;/td&gt;&lt;/tr&gt;
&lt;/table&gt;

&lt;script src="includes/jmesa/jquery.min.js"&gt;// for OC versions before 3.1.4, use jquery-1.3.2.min.js !&lt;/script&gt;
&lt;script lang="Javascript"&gt;
$.noConflict();
jQuery(document).ready(function($){
 $("#VAS").click(function (e) {
  var os = $("#VAS").offset()
  var vas_offset = os.left;
  var pos_x = e.pageX - vas_offset;
  setPointer(pos_x);
  // calculate and set outcome field to VASScore
  var newVASScore = Math.round(pos_x/correctionFactor);
  fieldVASScore.val(newVASScore);
  fieldVASScore.change();
  });
 /* function to set the pointer */
 function setPointer(pos_pointer){
  //correction for the width of the pointer
  pos_pointer = pos_pointer - 2;
  if (pos_pointer &lt; 0) {pos_pointer = 0;};
  if (pos_pointer &gt; 297) {pos_pointer = 297;};
  $("#pointer").css("left", pos_pointer); 
  }
 // correct for the fact that the max of the VAS = 100
 // while the width is 300px
 var correctionFactor = 3;
 // read value of input
 var fieldVASScore = $("#VAStable").parent().parent().find("input");
 // set the pointer to the value of the input
 setPointer(correctionFactor*fieldVASScore.val());
});     
&lt;/script&gt;
</pre>

<p>This needs some explaining. First we make a table with two rows: one for the box and one for 
the 0-50-100 markers and we call it <b>VAStable</b>. <br  />
Then we define our box or vas-scale and call it <b>VAS</b>; we make it 300px wide
and give it a background-color and a border.<br  />
Then in the third line we put an image in the box. This image is already included in OpenClinica, so we can use it without 
any problem. We call it <b>pointer</b> and set the width and height for it.<br />
Now we include some jquery: to start with we identify the actual CRF-item that holds the score by taking the
parent-of-the-parent-of-the-element-called-VAStable and from there find the first input with <br />
<b>var fieldVASScore = $("#VAStable").parent().parent().find("input");</b>.<br />
We read whatever the value is and set the pointer on the right position by calling the function <b>setPointer()</b>.
This function places the left-corner of the image a number of pixels to the right of the parent: in our case the div.
But we made our div 300px and the scale goes from 0 to 100, so we must make a correction and multiply the score
in the CRF-item with 3. This is why we first include<br />
<b>var correctionFactor = 3;</b><br />
and then call the function with <br />
<b>setPointer(correctionFactor*fieldVASScore.val());</b><br />
In the function a second correction is made for the width of the pointer.</p>

<p>The clicking is handled by <br />
<b>$("#VAS").click(function (e)</b><br />
and what that does is it takes the coordinates of the click in the div and subtracts that from the coordinates of 
the left corner of the div and puts the pointer there, using the function <b>setPointer()</b> again. 
Then the actual score is calculated and written to the input and the "status" of the input is set to changed: <br />
<b>var newVASScore = Math.round(pos_x/correctionFactor);<br />
fieldVASScore.val(newVASScore);<br />
fieldVASScore.change(); </b></p>

<h3>a bit more sophisticated</h3>

<p>The above solution certainly works, but we want to go the extra mile, so we make a nice background for
our scale plus a nice image for the pointer and create this:</p>

<p><img src='/tds/img/ImagesHowTo/vas/vas01.jpg' border='0'  class='photo'/><br />
fig. 3: colorful VAS</p>

<p>And this time the script is: <br />
(spot the seven differences)</p>
<pre>
&lt;div id="VAS" style="background-image:url('images/vas_100.jpg');width:300px;border-color:rgb(153,153,153);border-width:2px;border-style:solid;"&gt;
&lt;img id="pointer" src="images/vas_pointer.jpg" style="width:3px;height:28px;position:relative;left:0;"&gt;
&lt;/div&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;// for OC versions before 3.1.4, use jquery-1.3.2.min.js !&lt;/script&gt;
&lt;script lang="Javascript"&gt;
$.noConflict();
jQuery(document).ready(function($){
 $("#VAS").click(function (e) {
  var os = $("#VAS").offset()
  var vas_offset = os.left;
  var pos_x = e.pageX - vas_offset;
  setPointer(pos_x);
  // calculate and set outcome field to VASScore
  var newVASScore = Math.round(pos_x/correctionFactor);
  fieldVASScore.val(newVASScore);
  fieldVASScore.change();
  });
 /* function to set the pointer */
 function setPointer(pos_pointer){
  //correction for the width of the pointer
  pos_pointer = pos_pointer - 2;
  if (pos_pointer &lt; 0) {pos_pointer = 0;};
  if (pos_pointer &gt; 297) {pos_pointer = 297;};
  $("#pointer").css("left", pos_pointer); 
  }
 // correct for the fact that the max of the VAS = 100
 // while the width is 300px
 var correctionFactor = 3;
 // read value of input
 var fieldVASScore = $("#VAS").parent().parent().find("input");
 // set the pointer to the value of the input
 setPointer(correctionFactor*fieldVASScore.val());
});     
&lt;/script&gt;

</pre>
<h3>differences</h3>
<p>This time the situation is different, because we do not need the values of the VAS: they are in the image <b>vas_100.jpg</b>.
We make this image the background of the div. And to do that we must put this image plus <b>vas_pointer.jpg</b> 
in the images folder.<br />
We do not have the table to use as a reference to get to the CRF-item to hold the score, so we use the VAS to do that:<br />
<b>var fieldVASScore = $("#VAS").parent().parent().find("input");</b>.</p>

<h3>do try this at home</h3>
<p>Click <a href='/tds/CRFExamples/VAS.zip'>here</a> for the zip with examples and images.</p>

<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#crfs'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed August 2013</p>

		</div>
	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
