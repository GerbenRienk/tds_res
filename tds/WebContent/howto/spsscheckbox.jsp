<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="in this page is explained how you can export data 
from OpenClinica and import it into SPSS" /> 
<meta name="keywords" content="openclinica 3.1 training  status open source software clinical trials datamanagement 
non-profit academic edc spss dataextract" /> 

<title>Trial Data Solutions: OpenClinica checkboxes and multi-selects in SPSS</title>
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
			<h1>before we start</h1>
			
<p>For the readers who are interested in getting OpenClinica-data into SPSS: we
have a whole page about that! You can find it <a href='/tds/howto/spss.jsp'>here</a>.</p> 

<h1>checkboxes and multiselects in SPSS</h1>
<p>Yet another fine feature of OpenClinica is that you can use check-boxes in your CRF. For example: you can ask which
days of the week the participant did not take the medication.</p> 

<p><img src='/tds/img/ImagesHowTo/spsscheckbox/sc01.png' border='0'  class='photo'/><br />
fig. 1: check-box in a CRF</p>

<p>You will probably be aware of the fact that the answers to a check-box item are stored in the database
as a comma-separated list of values. Therefore both OpenClinica and SPSS will treat 
the check-box-item as a variable of type ST, character-string or Alpha-numeric.</p>
<p><img src='/tds/img/ImagesHowTo/spsscheckbox/sc02.png' border='0'  class='photo'/><br />
fig. 2: the items in SPSS</p>

<p>And when we look at the data in SPSS, we see that the days of the week that were checked are part of this comma-separated list.</p>
<p><img src='/tds/img/ImagesHowTo/spsscheckbox/sc03.png' border='0'  class='photo'/><br />
fig. 3: the data in SPSS</p>

<h1>analyse this</h1>
<p>But for our analysis we might be interested in the total score for Thursday. That means we want to scrutinize each answer and
if it contains a <b>4</b>, then we want to mark this answer as <b>including Thursday</b>. To do this we first define in SPSS a new
variable, called <b>NUMERIC DOW_E1_C1_4</b>: we choose this name, because the variable name of the check-box-item is <b>DOW_E1_C1</b> 
and the value for Thursday is 4.<br /> As a next step we set this new variable to zero with <b>COMPUTE DOW_E1_C1_4=0</b>.<br />
Then we use the <b>CHAR.INDEX</b>-command: this gives us the start-position of one or more characters in a string. If this is 
greater than 0, we know that <b>4</b> is in our answer. So the command we use is:<br />
<b>IF (CHAR.INDEX(DOW_E1_C1, '4')&gt;0) DOW_E1_C1_4=1.</b></p>
<p>We're almost there: all we need to add are the variable and value labels for our new variable: <br />
<b>VARIABLE LABELS<br />
DOW_E1_C1_4 "On which days did you not take the medication?  - Tick all that apply: Thursday" <br />
VALUE LABELS<br />
DOW_E1_C1_4<br />
0 "No"<br />
1 "Yes"</b></p>

<p>And once we know how to do this for one day, we know it for all, so our SPPS-syntax will look something like this:<br /> 
<b>
NUMERIC DOW_E1_C1_1 DOW_E1_C1_2 DOW_E1_C1_3 DOW_E1_C1_4 DOW_E1_C1_5 DOW_E1_C1_6 DOW_E1_C1_7 (F1).<br /> 
<br /> 
COMPUTE DOW_E1_C1_1=0.<br /> 
COMPUTE DOW_E1_C1_2=0.<br /> 
COMPUTE DOW_E1_C1_3=0.<br /> 
COMPUTE DOW_E1_C1_4=0.<br /> 
COMPUTE DOW_E1_C1_5=0.<br /> 
COMPUTE DOW_E1_C1_6=0.<br /> 
COMPUTE DOW_E1_C1_7=0.<br /> 
EXECUTE.<br /> 
<br /> 
IF (CHAR.INDEX(DOW_E1_C1, '1')&gt;0) DOW_E1_C1_1=1.<br /> 
IF (CHAR.INDEX(DOW_E1_C1, '2')&gt;0) DOW_E1_C1_2=1.<br /> 
IF (CHAR.INDEX(DOW_E1_C1, '3')&gt;0) DOW_E1_C1_3=1.<br /> 
IF (CHAR.INDEX(DOW_E1_C1, '4')&gt;0) DOW_E1_C1_4=1.<br /> 
IF (CHAR.INDEX(DOW_E1_C1, '5')&gt;0) DOW_E1_C1_5=1.<br /> 
IF (CHAR.INDEX(DOW_E1_C1, '6')&gt;0) DOW_E1_C1_6=1.<br /> 
IF (CHAR.INDEX(DOW_E1_C1, '7')&gt;0) DOW_E1_C1_7=1.<br /> 
EXECUTE.<br /> 

VALUE LABELS<br /> 
DOW_E1_C1_1 DOW_E1_C1_2 DOW_E1_C1_3 DOW_E1_C1_4 DOW_E1_C1_5 DOW_E1_C1_6 DOW_E1_C1_7<br />  
0 "No"<br /> 
1 "Yes"<br /> 
/<br /> 
.<br /> 
EXECUTE.<br /> 
<br /> 
VARIABLE LABELS<br /> 
DOW_E1_C1_1 "On which days did you not take the medication?  - Tick all that apply: Monday" /<br />  
DOW_E1_C1_2 "On which days did you not take the medication?  - Tick all that apply: Tuesday" / <br /> 
DOW_E1_C1_3 "On which days did you not take the medication?  - Tick all that apply: Wednesday" / <br /> 
DOW_E1_C1_4 "On which days did you not take the medication?  - Tick all that apply: Thursday" / <br /> 
DOW_E1_C1_5 "On which days did you not take the medication?  - Tick all that apply: Friday" / <br /> 
DOW_E1_C1_6 "On which days did you not take the medication?  - Tick all that apply: Saturday" / <br /> 
DOW_E1_C1_7 "On which days did you not take the medication?  - Tick all that apply: Sunday" / <br /> 
.<br /> 
EXECUTE.<br /> 
</b>
</p>

<h1>and this always works?</h1>
<p>Unfortunately this construction can only be applied for check-box-items with unique options, so if your <b>1</b> is an option and 
<b>11</b> is also an option, then we have a problem. The reason is of course that when <b>11</b> is in the answer and we check for 
<b>1</b> this syntax will put have a positive result. The solution for this is to check for each option <b>
between comma's</b>. "But then <b>1</b> will never score" you might think and you are right. We correct this by adding an 
extra comma to the start and to the end of our answer. Now we can check for <b>,1,</b> if we look for <b>1</b>
and <b>,11,</b> will not give a false positive.</p>
<p>The command to use is <b>CONCAT</b> and the syntax is:<br />
<b>IF (CHAR.INDEX(Concat(',', LTrim(RTrim(DOW_E1_C1)), ','), ',1,')&gt;0) DOW_E1_C1_1=1.</b></p>

<p><img src='/tds/img/ImagesHowTo/spsscheckbox/sc04.png' border='0'  class='photo'/><br />
fig. 4: after running the syntax</p>

<h1>great, let's start typing</h1>
<p>Yes, now we can start typing the SPSS-syntax. But wouldn't it be nice if we had a utility to generate the code?
Exactly. We wrote one in MsAccess/VBA and you can find it 
<a href='/tds/CRFExamples/SPSS_CheckBoxUtil_20140421.zip'>here</a>.</p>
<p>It opens with a form and the form has four tabs: one to generate the SPSS-syntax and three to collect
the necessary information about the check-box-item. This can be done in three different ways:<br />
1 - by using REST, which is available in OpenClinica starting from version 3.2<br />
2 - by using web-services: you should have these installed; take a look at <a href='/tds/howto/wsclient.jsp'>
this page</a><br />
3 - by using an ODM-file, either from OpenClinca directly or from the extract of a dataset</p>
<p>If you are running OpenClinica 3.2, then <b>REST</b> is by far the easiest method. 
Open tblSOAPParameters and scroll down to item <b>sysURLREST</b> and change that to match your 
OpenClinica-installation. Then go to tab <b>metadata from rest</b> and fill in your username and password
and the OID of your Study. You can find this by clicking in OpenClinica on the link of your Study-name
in the upper-left corner of the screen and in figure 5 the Study OID is <b>S_FFF</b>.
Next click on <b>get metadata</b>.
</p>

<p><img src='/tds/img/ImagesHowTo/spsscheckbox/sc05.png' border='0'  class='photo'/><br />
fig. 5: the Study OID</p>

<p><img src='/tds/img/ImagesHowTo/spsscheckbox/sc06.png' border='0'  class='photo'/><br />
fig. 6: getting metadata using REST</p>

<p>Alternatively, you can use web-services. Open tblSOAPParameters and go to record <b>sysURL</b>
and change that to match your situation. Use tab <b>metadata from web-service</b> and fill in username
and password and click <b>get studies</b>. After the list of available studies has been refrehed,
choose your study and click <b>get metadata</b></p>

<p><img src='/tds/img/ImagesHowTo/spsscheckbox/sc07.png' border='0'  class='photo'/><br />
fig. 7: getting metadata using web-services</p>

<p>The third method is by either downloading the ODM file with the metadata or extracting any dataset
in ODM-format. Look again at figure 5: there's the link <b>Download the study metadata here</b>: use it 
and save the file somewhere on your PC. Browse to it and yes, click <b>get metadata</b>.</p>

<p><img src='/tds/img/ImagesHowTo/spsscheckbox/sc08.png' border='0'  class='photo'/><br />
fig. 8: getting metadata from file</p>

<p>Now go to the first tab, <b>generate spps-syntax</b> and choose the check-box-item. 
You must also fill in the extension and you can find that in your SPSS-file. Click
on <b>generate SPSS-syntax</b> and you're done.</p>

<p><img src='/tds/img/ImagesHowTo/spsscheckbox/sc09.png' border='0'  class='photo'/><br />
fig. 9: generating the syntax</p>




<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#other'>here</a>.</p>
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
