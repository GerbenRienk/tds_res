<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: showing or hiding items on a CRF using a rule-file" /> 
<meta name="keywords" content="openclinica 3.1 training conditional display status open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: showing or hiding items on a CRF using a rule-file (OC 3.1)</title>
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
			<h3>showing or hiding items on a CRF using a rule-file</h3>
			
			<p>As we've seen in the page about the <a href='/tds/howto/showhideitems.jsp'>SimpleConditionalDisplay</a> it is indeed
			simple to show or hide an item on your CRF, provided that <br />
			- this depends on just one other item and <br />
			- that this item is numerical and<br />
			- that this item is on the same CRF. <br />
			But what if you want to show or hide an item based on multiple conditions and/or multiple items? 
			In that case we can write a Rule. <br />
			Let's first make a CRF with information about the end of study.</p>
			<p>
			<img src='/tds/img/ImagesHowTo/showhidemulti/shm01.jpg' border='0'  class='photo'/><br />
			fig. 1: CRF with three items
			</p>
			<p>If the user chooses option 2, 5 or 6, then we would like the specify field to be shown and otherwise we would like to hide it. 
			Before we go to the rule-file, we must fill in a columns: ITEM_DISPLAY_STATUS (Z), so we can set the default status to HIDE, 
			because at the start of entry we do not want the specify-item to be visible.</p>
			<p>
			<img src='/tds/img/ImagesHowTo/showhidemulti/shm02.jpg' border='0'  class='photo'/><br />
			fig. 2: The ITEM_DISPLAY_STATUS
			</p>

			<p>After uploading our CRF looks like this:</p>
			<p>
			<img src='/tds/img/ImagesHowTo/showhidemulti/shm02b.jpg' border='0'  class='photo'/><br />
			fig. 3: The CRF
			</p>
			
			<h3>the Rule-file</h3>
			<p>Now we are ready to compose our rule-file and we start with finding the OIDs of the variables we will use.
			Information on how to do this can be found <a href='findingoids.jsp'>here</a>.<br />
			We start with documenting the rule-file and here we list the OIDs of all the variables we use. In this case the important one are 
			<b>I_TDSEN_REASONSSTUDYSTOP_2849</b>, which is the list of radio-buttons, and <b>I_TDSEN_SPECIFY_6063</b> for the specification.</p>
			<p>
			<img src='/tds/img/ImagesHowTo/showhidemulti/shm03.jpg' border='0'  class='photo'/><br />
			fig. 4: Documentation of the rule-file.
			</p>

			<p>The target for our rule is <b>I_TDSEN_REASONSSTUDYSTOP_2849</b> and we write this first. It may be a bit confusing to speak of the radio-buttons as
			the "target", because the "target" of this whole exercise is the specify-field. But in the rule-file this field will be referred to as 
			the "Destination": we'll come to that. For now keep in mind that the "target" is used in building the Expression.</p>
			<p>
			<img src='/tds/img/ImagesHowTo/showhidemulti/shm04.jpg' border='0'  class='photo'/><br />
			fig. 5: Target
			</p>
			<p>Now let's first do the easy part: the expression to evaluate. This is the target, <b>I_TDSEN_REASONSSTUDYSTOP_2849</b>, and the values 
			to check for are <b>2</b>, <b>5</b> and <b>6</b>.</p>
			<p>
			<img src='/tds/img/ImagesHowTo/showhidemulti/shm05.jpg' border='0'  class='photo'/><br />
			fig. 6: Expression
			</p>
			<p>Once we've made our expression, we must define what to do when this expression evaluates to <b>True</b> and 
			what when it evaluates to <b>False</b>. This is done in <b>ShowAction</b> and <b>HideAction</b>. In both cases the "Destination" 
			for the Action is <b>I_TDSEN_SPECIFY_6063</b> 
			In the ShowAction a message will be displayed: <b>Please specify the reason.</b></p>
			<p>
			<img src='/tds/img/ImagesHowTo/showhidemulti/shm06.jpg' border='0'  class='photo'/><br />
			fig. 7: ShowAction and HideAction
			</p>
	
			<h3>Show me!</h3>
			<p>Everything's in place and we enter data: <b>06-Jul-2011</b> for the date, <b>Patient decision, please specify</b>
			for the Reason and then we hit <b>Save</b>.</p>
			<p>
			<img src='/tds/img/ImagesHowTo/showhidemulti/shm07.jpg' border='0'  class='photo'/><br />
			fig. 8: ShowAction in action
			</p>
			<p>The first thing we see is the field Specify in yellow. Then we see the standard message <b>Based on your answers, you need to answer additional questions below. =======</b>
			on the top of our screen. Then in the grey area where we normally have our validation-messages, we now see our message 
			<b>Please specify the reason.</b></p>
			<p>What happens if we change the reason for example to <b>Normal</b>? Then we can click <b>Save</b> and the CRF
			will close and everything's fine.</p>
			<p>And what if we had something already in the Specify-field? And then chose for <b>Normal</b>? This is surprising: we
			can save the data and the Specify-field will be visible, despite the HideAction! If you do not want this situation, you still must write 
			a rule to tell the user to delete the content of Specify.</p>
			<p>
			<img src='/tds/img/ImagesHowTo/showhidemulti/shm08.jpg' border='0'  class='photo'/><br />
			fig. 9: Unwanted behaviour 
			</p>
			<p>And your rule would be something like:</p>
			<p>
			<img src='/tds/img/ImagesHowTo/showhidemulti/shm09.jpg' border='0'  class='photo'/><br />
			fig. 10: Rule to fix it 
			</p>

<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#rules'>here</a>.</p>
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
