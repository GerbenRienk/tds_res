<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: the ct-operator for a rule with a multi-select" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc free gratis database medisch onderzoek ecrf using a rule to send a mail" /> 

<title>Trial Data Solutions: the ct-operator for a rule with a multi-option-item</title>
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
			
			<h3>the ct-operator for a rule with a multi-option-item</h3>
			<p>One of the lesser-known operators to use in a rule is the ct-operator. <br />
			Ct stands for <b>contains</b>. It is used on a string, takes one parameter and returns <b>True</b> or <b>False</b>.<br />
			An example could be that you want to check if in a CRF-item anything is mentioned about the heart. Your Rule Expression would then be:<br />
			<b>ItemOID ct "heart" or ItemOID ct "cardi"</b>
			</p>
			<h3>multi-option-item</h3>
			<p>This previous example is a bit far-fetched. Let's have a look at a real-life example. Think of a CRF with
			End of Study data.
			</p>
			<p>
			<img src='/tds/img/ImagesHowTo/CTOperator/ctop01.jpg' border='0'  class='photo'/><br />
			fig. 1: The CRF
			</p>
			<p>
			It is possible that more than one reason exists to end a study, so the option-list is made of checkboxes. 
			All reasons that apply can be ticked. You do this by choosing <b>checkbox</b> for RESPONSE_TYPE and defining all the different options in 
			RESPONSE_OPTIONS_TEXT and RESPONSE_VALUES_OR_CALCULATIONS. <br />
			Notice the double backslash as escape-character for the comma in "Patient decision, please specify".<br />
			Also notice that the DATA_TYPE (column T) is <b>ST</b> for string, and not <b>INT</b> for integer.
			</p>
			<p>
			<img src='/tds/img/ImagesHowTo/CTOperator/ctop02.jpg' border='0'  class='photo'/><br />
			fig. 2: The XL-sheet
			</p>
			<p>Now the CRF is in place we'll take a look at the ItemData. Let's say both item 2 and item 5 have been ticked:</p>
			
			<p>
			<img src='/tds/img/ImagesHowTo/CTOperator/ctop03.jpg' border='0'  class='photo'/><br />
			fig. 3: Items 2 and 5 ticked
			</p>
			<p>In the dataset this results in a string <b>2,5</b></p>
			
			<p>
			<img src='/tds/img/ImagesHowTo/CTOperator/ctop04.jpg' border='0'  class='photo'/><br />
			fig. 4: The result
			</p>
			<p>With this information we can create our rule. Did I mention <a href='http://notepad-plus-plus.org/' target='blank'>Notepad++</a>? 
			And the <a href='/tds/howto/findingoids.jsp' target='_blank'>page about finding OIDs</a>? 
			Right, then we put all the essential information in the header of the Rule file.</p>
			<p>
			<img src='/tds/img/ImagesHowTo/CTOperator/ctop05.jpg' border='0'  class='photo'/><br />
			fig. 5: Header, full of info.
			</p>
			<p>Then the easy part: defining the target for this rule and writing the discrepancy-message:</p>
			<p>
			<img src='/tds/img/ImagesHowTo/CTOperator/ctop06.jpg' border='0'  class='photo'/><br />
			fig. 6: Target and message.
			</p>
			<p>Then the fun part: the rule, with the ct-operator:<br />
			<b>I_TDSEN_REASONSSTUDYSTOP ct "2" and I_TDSEN_SPECIFY eq ""</b></p>
			<p>
			<img src='/tds/img/ImagesHowTo/CTOperator/ctop07.jpg' border='0'  class='photo'/><br />
			fig. 7: the rule with the ct-operator.
			</p>
			<p>It's probably clear what this rule does: it check for the condition that the string with ticked options contains <b>2</b>
			and at the same time the field to Specify is empty.</p>
			
			<h3>that wasn't very impressive</h3>
			<p>You may find this not very impressive and say: "yeah, OK, you check the tick on one, just one little item: big deal. But what if I have, 
			say, three items that need specifying?" Of course you can add more to your rule like:<br />
			<b>(I_TDSEN_REASONSSTUDYSTOP ct "2" or I_TDSEN_REASONSSTUDYSTOP ct "5" or I_TDSEN_REASONSSTUDYSTOP ct "6") and I_TDSEN_SPECIFY eq ""</b>
			</p>
			<p>That's valid and it works, but it's not very legible and with more items it becomes a mess. So here's another approach.</p>
			<p>In the example so far, we defined the values as integers, but we can also use characters for them. Or character-combinations.
			We will define all values as <b>a</b>, <b>b</b>, <b>c</b>, <b>d</b>, <b>e</b> and <b>f</b>. And for each option where  
			we want a specification, we'll add <b>spc</b>. The result looks like this: </p>
			<p>
			<img src='/tds/img/ImagesHowTo/CTOperator/ctop08.jpg' border='0'  class='photo'/><br />
			fig. 8: Alternative approach.
			</p>
			<p>Now if options a, b and f are ticked as in fig. 9, then the output will be like fig. 10</p>
			<p>
			<img src='/tds/img/ImagesHowTo/CTOperator/ctop09.jpg' border='0'  class='photo'/><br />
			fig. 9: Three options ticked.
			</p>
			<p>
			<img src='/tds/img/ImagesHowTo/CTOperator/ctop10.jpg' border='0'  class='photo'/><br />
			fig. 10: Output.
			</p>

			<p>Now our rule becomes very easy, because we only have to check for <b>spc</b>:<br />
			<b>I_TDSEN_REASONSSTUDYSTOPALT ct "spc" and I_TDSEN_SPECIFY eq ""</b></p>

			<p>Neat, isn't it?</p>
		</div>
 
	</div> <!-- /.main -->

<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
