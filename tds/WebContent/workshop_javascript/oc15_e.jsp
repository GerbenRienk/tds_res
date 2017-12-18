<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: javascript" /> 
<meta name="keywords" content="openclinica 3.x training  open source software clinical trials datamanagement 
non-profit academic edc external long lists" /> 

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

<h1>long lists</h1>

<p>Let's do some acknowledging first: everything of this part and in fact many other things of this workshop were invented by Sander de Ridder! And also: groundbreaking work was done by Robert Meester.</p>
<p>An example of a long list is the CTC list of Adverse Events. For this workshop we created a short version of it, but that still has an impressive amunt of hundreds of item. You can download the list <a href='extrafiles/ctc.xml' target='_blank'>here</a> and please store it in a folder which is part of your OpenClinica-installation and use as a foldername "extrafiles": for example <b>D:\tomcat\webapps\oc341\extrafiles\ctc.xml</b>. If you open the file in your browser you can see the contents: there are AETerms and they are grouped by SystemOrganClass. We will focus on just two aspects: the term and the code.<br />Download <a href='CRFs/CRFE.xls' target='_blank'>here</a> the CRF we will use to populate a select with all these codes. Then we will write script to assign the selection of one AE-term to the OpenClinica-item. When you've uploaded the CRF, open it in preview mode and save it as, you guessed it, StstaicCRF_E.html and open that in notepad++</p>

<p>In jQuery we can attempt to read an xml-file and when we are succesfull we can do something with. This way of working is called ajax: Asynchronous JavaScript and XML. The syntax to read the xml-file is:</p>
<pre><code>	&#36;.ajax({
		type: "GET",
		url: "extrafiles/ctc.xml",
		dataType: "xml",
		success: parseXML
		});
</code></pre>
<p>This is just for getting the xml-file, but now we must define a function for analysing it. Look again at the xml-file in your browser. We are interesed in the AETerms and of each AETerm we want to use the MedDRACode12 and the AETermName. Let's start our function parseXML with looping through these AETerms:</p>
<pre><code>	function parseXML(xml){
		&#36;(xml).find("AETerm").each(function(){
			});
		console.log("parse finished")
		}
</code></pre>

<p>As you can see we just loop through the terms and then when it is finished, we display a message in the console. Let's add a counter to that, so we can see how many terms there are:</p>
<pre><code>	function parseXML(xml){
		var i=0;
		&#36;(xml).find("AETerm").each(function(){
			i++;
			});
		console.log("parse finished: " + i + " terms")
		}</code></pre>
		
<p>We're getting really close now: we can loop through the terms. The way to for example refer to the attribute "MedDRACode12" of the terms is <b>&#36;(this).attr("MedDRACode12")</b> and this may seem a bit confusing: what is this <b>&#36;(this)</b>? That is the current object of our loop, so the AETerm at hand. And we make store the code of the term with <b>termCode = &#36;(this).attr("MedDRACode12")</b> and likewise the name of the term with <b>termText = &#36;(this).attr("AETermName")</b>. <br />
Now we can expand our select <b>ctcSelect</b> with extra entries by using <b>&#36;("#ctcSelect").append(&#36;("&lt;option /&gt;").val([new_code]).text([new_text]))</b> and this results in:</p>
		
<pre><code>	function parseXML(xml){
		var termCode;
		var termText;
		&#36;(xml).find("AETerm").each(function(){
			termCode = &#36;(this).attr("MedDRACode12");
			termText = &#36;(this).attr("AETermName");
			&#36;("#ctcSelect").append(&#36;("&lt;option /&gt;").val(termCode).text(termText));
			});
		}
</code></pre>

<h1>quick, write that down!</h1>
<p>One more step to take: we must store this selected value in the CRF-item and for this we need a reference to that item. We choose as a starting point our select so we add <b>var crfItem = &#36;("#ctcSelect").parent().parent().find("input");</b>. We want to update this CRF-item everytime the select changes, so:</p>
<pre><code>	&#36;("#ctcSelect").change(function(){
		crfItem.val(&#36;("#ctcSelect").val());
		});
</code></pre>

<p>Yes, that's what we want! And set the status to "changed" and yes, also make the item read-only. And please: when the CRF is loaded then give the select the value of the CRF-item.</p>
<pre><code>&lt;select ID="ctcSelect"&gt;
&lt;option value=""&gt;--please select--&lt;/option&gt;
&lt;/select&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;&lt;/script&gt;
&lt;script&gt;
&#36;.noConflict();
jQuery(document).ready(function(&#36;) { 
	var crfItem = &#36;("#ctcSelect").parent().parent().find("input");
	//read xml-file
	&#36;.ajax({
		type: "GET",
		url: "extrafiles/ctc.xml",
		dataType: "xml",
		success: parseXML
		});
	//construct the select
	function parseXML(xml){
		var termCode;
		var termText;
		&#36;(xml).find("AETerm").each(function(){
			termCode = &#36;(this).attr("MedDRACode12");
			termText = termCode + " - " + &#36;(this).attr("AETermName");
			&#36;("#ctcSelect").append(&#36;("&lt;option /&gt;").val(termCode).text(termText));
			});
		}
	//when the select changes, write the vaue to the CRF
	&#36;("#ctcSelect").change(function(){
		crfItem.val(&#36;("#ctcSelect").val());
		crfItem.change();
		crfItem.prop("readonly", true);
		});
	//when the CRF is loaded, set the select the correct value
	&#36;("#ctcSelect").val(crfItem.val());
	})
&lt;/script&gt;
</code></pre>




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
