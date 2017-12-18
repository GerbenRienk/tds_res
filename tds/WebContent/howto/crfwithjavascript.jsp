<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: using java-script to change the stylesheet" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc free gratis database medisch onderzoek ecrf java-script to change the stylesheet" /> 

<title>Trial Data Solutions: changing the stylesheet with javascript</title>
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

<p>Although the information on this page is still valid and the technique can still be used,
on <a href='layoutchanges.jsp'>this page</a> you find another method, which is easier.</p>

			<h3>Using Java-script to change the stylesheet</h3>
			
			<p>
			Although OpenClinica is very flexible in what you can do with it, it is not so flexible in how you can display it.
			In fact there is not so much you can do with the layout: everything is determined by the stylesheets. <br />
			Of course there's nothing wrong with changing the stylesheet. For example, if you want to have a bit more space 
			for the "LEFT_ITEM_TEXT" and have it aligned to the left, you can edit the stylesheet <b>styles.css</b>.
			But some of us have to run their studies in an environment with lots of other studies and then changing a stylesheet is not
			an option.
			</p>
			<p>But you can put a bit of java-scripting in your CRF and modify the stylesheet this way.<br />
			Let's take a look at the script first</p>
			<pre>
&lt;script  type="text/javascript" language="JavaScript"&gt; 
var cssRules;
for (var S = 0; S &lt; document.styleSheets.length; S++){
	if (document.styleSheets[S]['rules']){
		cssRules = 'rules';
	}
	if (document.styleSheets[S]['cssRules']){
		cssRules = 'cssRules';
	}
	for (var R = 0; R &lt; document.styleSheets[S][cssRules].length; R++){
		if (document.styleSheets[S][cssRules][R].selectorText == ".aka_text_block"){
			document.styleSheets[S][cssRules][R].style["width"] = "20em";
			document.styleSheets[S][cssRules][R].style["textAlign"] = "left";
		}
	}
}
&lt;/script&gt;

			</pre>
			<p>What this script does is that it loops through the stylesheets of the document. In these stylesheets it loops
			through the classes, but in order to do this, it must first find out how the browser refers to these, as <b>rules</b> 
			or as <b>cssRules</b>. Now the script loops until it finds <b>aka_text_block</b> and then it changes the properties 
			<b>width</b> and <b>textAlign</b>.</p>
			<p>Now we must put the script in our XL-sheet. A convenient place is the cell "INSTRUCTIONS" of the section part. 
			If your CRF has more than one 
			section, you must put the script in every section!</p>
			<p>
			<img src='/tds/img/ImagesHowTo/JavaScriptStyleSheet/scriptinexcel.jpg' border='0'  class='photo'/><br />
			fig. 1: putting the java-script in your XL-sheet
			</p>
			<p>The result is shown in fig. 2</p>
			<p>
			<img src='/tds/img/ImagesHowTo/JavaScriptStyleSheet/resultincrf.jpg' border='0'  class='photo'/><br />
			fig. 2: the result of the java-script in your CRF
			</p>

		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
