<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: making a script to run a rule, so it can be scheduled" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc free gratis database medisch onderzoek ecrf using a rule to send a mail scheduling" /> 

<title>Trial Data Solutions: script to run a rule</title>
<link rel="stylesheet" type="text/css" media="screen, projection" href="/tds/css/screen.css" />
<link rel="stylesheet" type="text/css" media="screen, projection" href="/tds/css/highlight_styles/default.css" />
<script src="/tds/js/jquery-1.2.6.min.js" type="text/javascript"></script>
<script src="/tds/js/highlight.pack.js" type="text/javascript"></script>
<script>hljs.initHighlightingOnLoad();</script>
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
			
<h3>a script for scheduling a rule</h3>
<p>In some situations you may want to execute a Rule not when the user hits the Save-button, 
but for example every night, or at the start of each working day. Suppose you have a trial where the StudySubjects should
have a follow-up visit 6 months after the date of signing their Informed Consent.  
</p>
<p><img src='/tds/img/ImagesHowTo/scripttorunarule/sr01.jpg' border='0'  class='photo'/><br />
fig. 1: the CRF</p>
<p>And based on the example of fig. 1, we would like to get an e-mail on December 1, to remind us that we must
contact the StudySubject for a new Visit.</p>

<h3>first the rule</h3>
<p>The message will be send by a Rule and we will need the OIDs of the CRF, the Item Group and the Item. 
How to do this is explained <a href='/tds/howto/findingoids.jsp'>here</a> in detail.<br />
Once we have them, we put them in the header of our Rule-file and we write the EMailAction</p>
<p><img src='/tds/img/ImagesHowTo/scripttorunarule/sr02.jpg' border='0'  class='photo'/><br />
fig. 2: the EMailAction</p>

<p>Note the <b>Run</b>-tag, which states that the Action should only be executed on Batch:
<b>&lt;Run AdministrativeDataEntry="false" InitialDataEntry="false" DoubleDataEntry="false" ImportDataEntry="false"  Batch="true" /&gt;</b><br />
Now we must create our expression which should look something like this:</p>
<p><img src='/tds/img/ImagesHowTo/scripttorunarule/sr03.jpg' border='0'  class='photo'/><br />
fig. 3: the Expression</p>
<p>Now we can upload the Rule and receive the congratulations etc and our Rule is ready to be run, but
the only way to do that is by going to the list of rules and click on the Run-icon. And do that every day.</p>
<p><img src='/tds/img/ImagesHowTo/scripttorunarule/sr04.jpg' border='0'  class='photo'/><br />
fig. 4: running the Rule manually</p>

<h3>surely there's an easier way</h3>
<p>And yes, there is an easier way to do this than by logging in to OpenClinica, going to the list of Rules,
browsing to our Reminder-mail-Rule, clicking on the Run-icon and finally confirming that we want to execute the Action. 
How? First click on the Run-icon and then look at the address-bar. In our case it says<br />
<b>http://www.tds-training.com/oc34/RunRuleSet?ruleSetId=6&amp;ruleId=5</b><br /> and when we look at the source of 
the page, we discover that clicking the button <b>Submit</b> is equal to requesting<br />
<b>http://www.tds-training.com/oc34/RunRuleSet?ruleSetId=6&amp;dryRun=no</b><br />
This means that we can make life easier by creating a book-mark in our browser for the second URL and by clicking on it
we run the Rule. A step forward indeed, but it would be nicer to have this executed as a scheduled task.</p>
<p><img src='/tds/img/ImagesHowTo/scripttorunarule/sr05.jpg' border='0'  class='photo'/><br />
fig. 5: the URL to run the Rule manually</p>

<h3>a script to do all this</h3>
<p>There is nothing wrong with the method described above, that is to make a book-mark of the link and to start each
 working day with clicking on the link, but it would be much nicer to have a script do that. We can do that by using
 a text-editor like <a href='http://notepad-plus-plus.org/' target='blank'>Notepad++</a> and saving the following text
 as a <b>vbs</b>-file. The only thing that must be changed is the URL of your server plus the name of your OpenClinica-
 instance: <br /><b>strURLStart = "http://www.tds-training.com/oc34/"</b> </p>
 <pre><code class="vbscript">
 
Option explicit
Dim objIEDebugWindow
Dim objHTTP
Dim strURLStart
Dim strURL 
Dim strReq 

If WScript.Arguments.Count &lt;&gt; 3 then
  WScript.Echo "Missing parameters. This script needs: "_
  &amp; VbNewLine &amp; "username, password and CRFID or RuleSetID"_
  &amp; VbNewLine &amp; "to run correctly."
Else
  Set objHTTP = CreateObject("MSXML2.XMLHTTP")
  'change this to match your situation
  strURLStart = "http://www.tds-training.com/oc34/"
  'j_spring_security_check
  strURL = strURLStart &amp; "j_spring_security_check?j_username=" &amp; WScript.Arguments(0) 
  strURL = strURL &amp; "&amp;j_password=" &amp; WScript.Arguments(1)
  objHTTP.Open "POST", strURL, False
  objHTTP.send
  'uncomment the next line if you want to check if the authorization went OK
  'debug (objHTTP.responseText)

  'choose one of the following: 
  'this first line will run all Rules for a CRF, 
  'strURL = strURLStart &amp; "RunRule?crfId=" &amp; WScript.Arguments(2) &amp; "&amp;action=true"
  'this second line will run one RuleSet
  strURL = strURLStart &amp; "RunRuleSet?ruleSetId=" &amp; WScript.Arguments(2) &amp; "&amp;dryRun=no"

  objHTTP.Open "GET", strURL, False
  objHTTP.send

  'uncomment the next line if you want to check if the execution of the rule(s) went OK
  'debug (objHTTP.responseText)
  WScript.Echo "finished"
End if

'the following procedure is used to check the responses of the HTTP requests
'it opens a browser window and displays whatever is given as parameter myText
Sub Debug( myText )
  'open a browser window if it is not already open
  If Not IsObject( objIEDebugWindow ) Then
    Set objIEDebugWindow = CreateObject( "InternetExplorer.Application" )
    objIEDebugWindow.Navigate "about:blank"
    objIEDebugWindow.Visible = True
    objIEDebugWindow.ToolBar = False
    objIEDebugWindow.Width = 200
    objIEDebugWindow.Height = 300
    objIEDebugWindow.Left = 10
    objIEDebugWindow.Top = 10
    Do While objIEDebugWindow.Busy
      WScript.Sleep 100
    Loop
    objIEDebugWindow.Document.Title = "IE Debug Window"
    objIEDebugWindow.Document.Body.InnerHTML = "&lt;b&gt;" &amp; Now &amp; "&lt;/b&gt;&lt;/br&gt;"
  End If
  'add the text from the parameter to what's already there
  objIEDebugWindow.Document.Body.InnerHTML = _
  objIEDebugWindow.Document.Body.InnerHTML _
  &amp; myText &amp; "&lt;br&gt;" &amp; vbCrLf
End Sub
 </code></pre>

<h3>now what exactly happens here?</h3>
<p>The script is not so hard to understand. First it counts the number of parameters, because it needs three: 
the OC-username, the OC-password and the RuleSetID. You may wonder where to get that last bit from, but that was
in the URL, when we ran the Rule manually: <b>RunRuleSet?ruleSetId=6</b>.<br />
We start with making a trusted connection, using <b>j_spring_security_check</b>: 
we <b>POST</b> our name and password.<br />
Now we can execute the Rule-set, by making a <b>GET</b> for the URL with <b>RunRuleSet</b>
in combination with the right ID and that is all.</p>
<p>To test this script we save it and then we open a command prompt and change to the folder with the script.
We then start it with the three parameters. After completion a message-box appears, saying "finished".</p>
<p>There is also the option to "debug" whatever responses OpenClinica gives by using the procedure <b>Debug</b>.</p>

<p><img src='/tds/img/ImagesHowTo/scripttorunarule/sr06.jpg' border='0'  class='photo'/><br />
fig. 6: testing the script (and no, my password is not XXXXXX)</p>

<p>And if we did everything the right way and the proper way, we should see a mail like this:</p>
<p><img src='/tds/img/ImagesHowTo/scripttorunarule/sr07.jpg' border='0'  class='photo'/><br />
fig. 7: mail</p>

<h3>schedule this, please</h3>
<p>Can we make life easier still? Sure: by scheduling this script. And before you do that, comment out the 
<b>WScript.Echo "finished"</b>. And don't forget to supply the parameters.</p>
<p><img src='/tds/img/ImagesHowTo/scripttorunarule/sr08.jpg' border='0'  class='photo'/><br />
fig. 8: scheduling the script (look, I told you my password is not XXXXXX!)</p>

<h3>so, what about the other URL?</h3>
<p>You may have noticed that in the script you can choose between running a Rule-set and running
all rules for a CRF. Where did that come from? Well, if we go to the list of CRFs and in it to
the CRF Screening, we can click on the magnifier-icon of the original.</p>
<p><img src='/tds/img/ImagesHowTo/scripttorunarule/sr09.jpg' border='0'  class='photo'/><br />
fig. 9</p>
<p><img src='/tds/img/ImagesHowTo/scripttorunarule/sr10.jpg' border='0'  class='photo'/><br />
fig. 10</p>

<p>At the end of the following screen we can click on <b>Run All Rules for this CRF</b> which is<br /> 
<b>http://www.tds-training.com/oc34/RunRule?crfId=1&amp;action=no</b><br /> 
With this URL we must submit/confirm, but if we change the URL to <br />
<b>http://www.tds-training.com/oc34/RunRule?crfId=1&amp;action=true</b><br />
then the execution will be immediately.</p>
<p>By un-commenting the line starting with <b>'strURL = strURLStart &amp; "RunRule?crfId="</b> and commenting out
the line with <b>strURL = strURLStart &amp; "RunRuleSet?ruleSetId="</b> we change the script in such a way
that it will run all Rules for this CRF. You may want to use this in a situation where you have many
Validations in a CRF and you do not want to slow down the data-entry by running them all at time of entry.</p>

<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#rules'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed December 2014</p>
		</div>
 
	</div> <!-- /.main -->

<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
