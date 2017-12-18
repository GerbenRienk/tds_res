<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: javascript" /> 
<meta name="keywords" content="openclinica 3.x training  open source software clinical trials datamanagement 
non-profit academic edc tokens" /> 

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

<h1>tokens and view-source and changing items</h1>

<p>We now have already quite some tools in our box: we can write what has been entered and make expressions with it, but we have not written anything yet. Let's do that as our next step and we'll do that with tokens. Tokens were introduced in version 3.3 and <a href='https://docs.openclinica.com/3.1/study-setup/build-study/create-case-report-forms-crfs#content-title-5510' target='_blank'>here</a> you can find information about them. We will use the token for StudySubject. This will also give us an example of how we can mimick the situation of a "real" dataentry, because so far we only used the preview mode of a CRF.</p>
<p>Let's start with <a href='CRFs/CRFC.xls'>this CRF</a>. Download it an open it in Excel. It already has the jQuery part in it in the right_item_text of the first item:</p>

<pre><code>&lt;div id="StartDiv"&gt;&lt;/div&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;&lt;/script&gt;
&lt;script&gt;
&#36;.noConflict();
jQuery(document).ready(function($) {
var theID="&#36;{studySubject}";
console.log("the  StudySubjectID is: " + theID);
})
&lt;/script&gt;
</code></pre>

<p>First let's check out the CRF in real-life: create in your Study an event EvC and assign the CRF to it. Now add a Subject and schedule EvC for this Subject. Don't forget to turn on the console. Now start entering data and watch the console, where you will see the StudySubjectID.<br />
We want to have this page in notepad++ so we can experiment with it and write a script to copy the StudySubjectID into the first item of the CRF. But watch closely when we try the same trick we did before: right-click and save the page as <b>D:\tomcat\webapps\oc341\StaticCRF_C.html</b> and then open this newly created file in you browser. It is not even close! And you see the reason: "This CRF is currently unavailable for data entry. grvisser is currently entering data."</p>
<p>If we want to use this page in notepad++ we can do the following. Go to the subject-matrix and open the CRF again. Copy the url from the address-bar of your browser, something like <b>http://localhost:8081/oc341/InitialDataEntry?eventCRFId=9</b>. Now save or exit the CRF. Now type in your browser <b>view-source:</b> and then paste the original url. You now should be looking at the source. Select all by pressing ctrl-a and go to notepad++ and paste it all and save it as <b>D:\tomcat\webapps\oc341\StaticCRF_C.html</b>. If you now look at the file in your browser, you should see the DataEntry-screen.</p>

<p>Now switch to notepad++ and search for "theID", around line 1540. You see that what we wrote as <b>&#36;{studySubject}</b> has ended up as <b>TDS001</b>.</p>

<h1>let's start writing!</h1>
<p>Now we have everything in place we can start writing our script so that we can copy the StudySubjectID in the first CRF-item (for example when we want to check the format of the ID). To do that we fist make a reference to the CRF-item, similar to what we saw before: parent, parent and then an input. And once we have that reference we set the value of the input with the function/methods <b>.val()</b> </p>

<pre><code>
&#36;.noConflict();
jQuery(document).ready(function($) {
var theID="&#36;{studySubject}";
var theCRFItem=$("#StartDiv").parent().parent().find("input");
theCRFItem.val(theID);
console.log("the  StudySubjectID is: " + theID);
})
</code></pre>

<p>Update the file StaticCRF_C.html in notepad++, save it and refresh your browser: isn't that spectacular?</p>

<h1>stop! reality check!</h1>
<p>Now before we go any further, let's copy the two exra lines and put them in our actual Excel and upload the CRF as a new version. 
And then add a new Subject and enter data. The StudySubjectID will be there and you can leave that as it is. 
Choose a date and notice the difference between the two items. Now save the CRF and then re-open it and change the StudySubjectID and save the CRF. 
So .... we must change our script: only change it when the value is not correct, make the item "changed" and make the item readonly.</p>

<pre><code>&#36;.noConflict();
jQuery(document).ready(function($) {
var theID="&#36;{studySubject}";
var theCRFItem=&#36;("#StartDiv").parent().parent().find("input");
if (theID != theCRFItem.val()){
	theCRFItem.val(theID);
	theCRFItem.change();
	theCRFItem.prop("readonly", "true");
	}
})</code></pre>
<!-- a bit explaining the prop -->

<p>Now when you're happy, copy the code into the CRF and upload it is a new version and check if everything's working according to plan.</p>


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
