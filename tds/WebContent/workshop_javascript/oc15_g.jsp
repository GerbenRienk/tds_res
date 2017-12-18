<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: javascript" /> 
<meta name="keywords" content="openclinica 3.x training  open source software clinical trials datamanagement 
non-profit academic edc clickable map" /> 

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

<h1>a clickable image</h1>

<p>Let's take a bit of a side road and try to make a CRF with an image that is clickable. First we need to create a folder in our OpenClinica folder structure where we can store our files. If you have not created one already do so now and take as name "extrafiles": for example <b>D:\tomcat\webapps\oc341\extrafiles</b>. Then download to that location the image file <a href='extrafiles/brain.jpg' target='_blank'>brain.jpg</a> plus the so-called image-map, that was wrapped in a javascript-command: <a href='extrafiles/brain.js' target='_blank'>brain.js</a></p>
<p>Now download <a href='CRFs/CRFG.xls' target='_blank'>this CRF</a> and as you've done before: upload it and preview it. Hover above one of the coloured areas and see what happens. Now click one of the coloured areas and watch the console. This is all because we defined the image-map. You can see what happens in the image-map when you right-click on one of the areas and then choose "inspect element". You now see that the area is a polygon made up of lots of coordinates. This area has a name and a title. Now how exactly do we get to see the name in the console? Because we defined a function with jQuery that is applicable to all elements of type "area". When you click one, write the name and the title in the console:</p>
<pre><code>&#36;.noConflict();
jQuery(document).ready(function(&#36;) { 
&#36;('area').click(function() { 
	var areaName = &#36;(this).attr('name');
	console.log('you clicked: ' + areaName + ', ' +&#36;(this).attr('title')); 
	});
})</code></pre>

<p>Now let's make a reference to te checkbox group:</p>
<pre><code>	var ckbGroupColour = &#36;("#brainImage").parent().parent().find("input");</code></pre>

<p>As we have seen with the radio-buttons, we can loop through the checkboxes. Let's do that when we click on an area</p>
<pre><code>	&#36;('area').click(function() { 
		var areaName = &#36;(this).attr('name');
		console.log('you clicked: ' + areaName + ', ' +&#36;(this).attr('title')); 
		for (var i = 0; i &lt; ckbGroupColour.length; i++) {
			console.log(ckbGroupColour[i].value);
			}
	});</code></pre>

<p>Now it's relatively a small step to change the status of checked from true to false or from false to true:</p>
<pre><code>for (var i = 0; i &lt; ckbGroupColour.length; i++) {
	if(ckbGroupColour[i].value == areaName){
		ckbGroupColour[i].checked = !ckbGroupColour[i].checked;
		}
	}
</code></pre>


<p>And our complete code then is: </p>
<pre><code>&lt;img src="extrafiles/brain.jpg" width="700" height="450" border="0" usemap="#brainmap" id="brainImage"/&gt;
&lt;script src="extrafiles/brain.js"&gt;&lt;/script&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;&lt;/script&gt;
&lt;script&gt;
&#36;.noConflict();
jQuery(document).ready(function(&#36;) { 
	var ckbGroupColour = &#36;("#brainImage").parent().parent().find("input");
	&#36;('area').click(function() { 
		var areaName = &#36;(this).attr('name');
		for (var i = 0; i &lt; ckbGroupColour.length; i++) {
			if(ckbGroupColour[i].value == areaName){
				ckbGroupColour[i].checked = !ckbGroupColour[i].checked;
				}
			}
	});
})
&lt;/script&gt;</code></pre>

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
