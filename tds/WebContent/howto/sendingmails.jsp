<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: using a rule to send a mail" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc free gratis database medisch onderzoek ecrf using a rule to send a mail" /> 

<title>Trial Data Solutions: Using a rule to send a mail</title>
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
			
			<h3>Using a rule to send a mail</h3>
			<p>
			Sometimes it's useful to send an e-mail, based on the input of a CRF. Think of the situation where the Study-coordinator 
			wants to be notified when a patient has been randomized.<br />
			Before we explain how to do this, a word of warning. The options to send the mail are limited: it will be sent to
			one or more static addresses and you can not change the message body dynamically. But still it's worth it to give it a try.  
			</p>
			<h3>Getting the ingredients</h3>
			<p>The message will be send by a Rule, so just as with a rule, we need the OIDs of the Study Event, 
			the CRF version, the Item Group and the Item. How to do this is explained  
			<a href='/tds/howto/findingoids.jsp'>here</a> in detail.<br />
			We'll base our mail on the CRF Randomisation, fig.1.
			</p>
			<p>
			<img src='/tds/img/ImagesHowTo/SendingMails/randocrf.jpg' border='0'  class='photo'/><br />
			fig. 1: The CRF
			</p>
			<p>
			Now we compose our xml-file and I prefer <a href='http://notepad-plus-plus.org/' target='blank'>Notepad++</a> for that. 
			I start the file with a short description, plus the list of OIDs I will use (fig. 2).
			</p>
			<p>
			<img src='/tds/img/ImagesHowTo/SendingMails/notepad01.jpg' border='0'  class='photo'/><br />
			fig. 2: the header of the XML file with comments
			</p>
			<p>The part for sending the mail is very much like a normal validation rule, but <b>DiscrepancyNoteAction</b> is now replaced with
			<b>EmailAction</b><br />
			The tag itself has two elements: <b>Message</b> and <b>To</b>. Message will be used in the Subject of your e-mail message. In the To-tag
			you can put one or more addresses to which the mail must be sent, separated by a comma.</p>
			<p>
			<img src='/tds/img/ImagesHowTo/SendingMails/notepad02.jpg' border='0'  class='photo'/><br />
			fig. 3: RuleAssignment
			</p>
			
			<p>Now you must define the RuleDef and that's straight-forward. You want the rule to fire if the Item with 
			allocation number is not empty (fig. 4).</p>
			<p>
			<img src='/tds/img/ImagesHowTo/SendingMails/notepad03.jpg' border='0'  class='photo'/><br />
			fig. 4: RuleDef
			</p>

			<h3>But how does it look?</h3>
			<p>'Fine, fine' you may think, 'but what do I see in my mail-reader?'. What you see depends on your 
			mail program, but it will look something like fig. 5.</p>
			<p>
			<img src='/tds/img/ImagesHowTo/SendingMails/mail.jpg' border='0'  class='photo'/><br />
			fig. 5: Mail
			</p>
			<p>As you can see, the Subject of your mail is not just "Randomisation message", but is is preceeded by "OpenClinica" and then
			the name of your Study, between square brackets.</p>
			<p>
			Then a short introduction follows: <i>"You received this email from OpenClinica regarding 'TOPFIT Trial' because you were listed as a person to contact. 
			Please review the information below: "</i></p>
			<p>
			Next are the details of the Target of your rule: Study, Site, Study Subject, Study Event Definition,  
			CRF, Section, Item Group, Item Name and Message.</p>
			<p>
			Very handy is the part that follows: a link to the CRF. The message ends with a disclaimer.</p>

<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#rules'>here</a>.</p>
		</div>
 
	</div> <!-- /.main -->

<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
