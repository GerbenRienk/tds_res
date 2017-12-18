<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: data from other event" /> 
<meta name="keywords" content="openclinica 3.x training  open source software clinical trials datamanagement 
non-profit academic edc rest javascript ajax" /> 

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

<h1>data from other events</h1>


<p>Now that we know how to read an xml-file, we can use that to extract information from data that was entered into OpenClinica. To do this, we must have some working material. First of all download <a href='CRFs/RandoOutcome.xls' target='_blank'>this RandoOutcome CRF</a>, upload it to your OpenClinica. Create an event <b>Rand</b> and assign this CRF to it. Now download <a href='CRFs/CRFF.xls' target='_blank'>this CRF</a>, upload it. Create another event named <b>EvF</b> and assign CRF F to it.</p>
<p>When all this is in place, go to your SubjectMatrix and add a new Subject with StudySubjectID "T001". Enter data for the RandoOutcome CRF, for example Arm B. Enter data in two more CRFs. The data of a Subject can be seen in xml-format by using REST (Representational State Transfer). What?! <br />This may sound new to you, but you've probably used it already when printing a Subject's case-book. Open the Subject-page for T001 and open the node "Subject Casebook". For "Casebook Format" choose "CDISC ODM XML". Uncheck "Notes &amp; Discrepancies" and "Audit Trail". Click on "Get Link" and also on "Open". </p>
<p>The result is a massive page with url <b>http://localhost:8081/oc341/rest/clinicaldata/xml/view/S_TS34/SS_T001/*/*</b> and this means: find Study with StudyOID <b>S_TS34</b> and of that Study look at Subject with StudySubjectOID <b>SS_T001</b> and then give me the data of all Events and in these Events, of all CRFs. And if you look at the output, it will take some scrolling, but at the end you will find the actual clinical data of your Subject. Or search for "ClinicalData". You will see the entry you just made: <b>&lt;ItemData ItemOID="I_TDSWO_RANDOOUTCOME" Value="2"/&gt;</b></p>

<h1>can we start writing now?</h1>
<p>Enough preparing: we want to write something. And as before, let's build this step-by-step. We start with our CRF F and open it in preview and save it as StaticCRF_F.html. Now we can make our life easy by copying the first bit of our previous workshop CRF, the part where we read an xml-file but we change the <b>url</b> to the url of our rest-call and we make an empty function "parseXML(xml)":</p>
<pre><code>&#36;.ajax({
	type: "GET",
	url: "http://localhost:8081/oc341/rest/clinicaldata/xml/view/S_TS34/SS_T001/*/*",
	dataType: "xml",
	success: parseXML
	});
function parseXML(xml){}</code></pre>

<p>This seems to work OK, so now we can loop through items of our xml-file and the elements we're interested in are of course <b>ItemData</b>. Of such an element we would like to know the attributes "ItemOID" and "Value":</p>
<pre><code>function parseXML(xml){
	&#36;(xml).find("ItemData").each(function(){
		console.log(&#36;(this).attr("ItemOID") + " " + &#36;(this).attr("Value"));
		});
}</code></pre>

<p>We must have some patience here, because it takes time to get the data from OpenClinica. 
Now let's focus on the url that we use in the ajax-call. We can skip the first part, because we're already in 
<b>http://localhost:8081/oc341/</b>. Then we have a part to start with and then the StudySubjectOID and we finish 
with the StudyOID and two wildcards for all Events and all CRFs. 
Let's break the url in these three parts and then give the ajax-call the combined url:</p>

<pre><code>var urlStart = "rest/clinicaldata/xml/view/S_TS34/";
var studySubjectOID = "SS_T001";
var urlEnd = "/*/*";
var urlComplete = urlStart + studySubjectOID + urlEnd;
&#36;.ajax({
	type: "GET",
	url: urlComplete,
	dataType: "xml",
	success: parseXML
});</code></pre>

<p>Of course we're not interested in all these ItemData, but only in the one that is called "I_TDSWO_RANDOOUTCOME" so we modify the script to compare the ItemNames with "I_TDSWO_RANDOOUTCOME" and if it matches, then take the value of this item and store it in a variable "randOutcome" with <b></b></p>
<pre><code>		&#36;(xml).find("ItemData").each(function(){
	if(&#36;(this).attr("ItemOID") == "I_TDSWO_RANDOOUTCOME")
		randOutcome = &#36;(this).attr("Value"));
	});</code></pre>
	
<h1>what else do we need? </h1>
<p>Closer now, but not yet there: we must make a reference to the CRF-item and wait: it is a group of radio-buttons, 
so we must loop through them  if we want to write our randomisation outcome. Let's do that first. 
The reference we can make with <b>var crfItem = &#36;("#ValueFromOtherEvent").parent().parent().find("input");</b>. 
Once we have the reference we loop through the radio-buttons and if we find the one that has the same value as the value "randOutcome", 
then we set this radio to "checked". (And for the others we set the attribute "disabled" to "true".)</p>

<pre><code>for (var i = 0; i &lt; crfItem.length; i++) {
	if (&#36;(crfItem[i]).val() == randOutcome) {
		&#36;(crfItem[i]).prop("checked", true);
	}
	else{
		&#36;(crfItem[i]).prop("disabled", true);
	}
}</code></pre>

<h1>can we now at last stick it in the CRF?</h1>
<p>We're very, very close now, but the StudySubjectOID is still hard-coded in the script. But this may remind you of part C of the workshop, 
where we used the StudySubjectID. So we replace <b>var studySubjectOID = "SS_T001";</b> with <b>var studySubjectOID = "&#36;{studySubjectOID}"</b>. 
Go ahead, do that and upload the CRF and test it. It is working but something's missing: what is?</p>

<p>You will probably have noticed that the SimpleConditionalDisplay is not working. The reason is that the radio is set to "checked", but there is no click-event. If we close and re-open the CRF it is OK, but not when we open the CRF for the first time.</p>
<p>The solution is to add one last line that fires the click-event:</p>
<pre><code>&lt;div id="ValueFromOtherEvent"&gt;&lt;/div&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;&lt;/script&gt;
&lt;script&gt;
&#36;.noConflict();
jQuery(document).ready(function(&#36;) { 
	var urlStart = "rest/clinicaldata/xml/view/S_TS34/";
	var studySubjectOID = "&#36;{studySubjectOID}";
	var urlEnd = "/*/*";
	var urlComplete = urlStart + studySubjectOID + urlEnd;
	var randOutcome;
	var crfItem = &#36;("#ValueFromOtherEvent").parent().parent().find("input");
	&#36;.ajax({
		type: "GET",
		url: urlComplete,
		dataType: "xml",
		success: parseXML
	});
	function parseXML(xml){
		&#36;(xml).find("ItemData").each(function(){
			if(&#36;(this).attr("ItemOID") == "I_TDSWO_RANDOOUTCOME"){
				randOutcome = &#36;(this).attr("Value");
			}
		});
		//write the value to the crf-item
		for (var i = 0; i &lt; crfItem.length; i++) {
			if (&#36;(crfItem[i]).val() == randOutcome) {
				&#36;(crfItem[i]).prop("checked", true);
				&#36;(crfItem[i]).click();
			}
			else{
				&#36;(crfItem[i]).prop("disabled", true);
			}
		}
	}

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
