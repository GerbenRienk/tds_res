<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: showing instructions about an item in a CRF by using Tip" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: showing instructions with Tip</title>
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
			<h3>showing instructions</h3>
			
<p>This is a very short page about how you can put even more instructions in your CRF while they will be  
visible only on demand.<br />
As you know you have not only the <b>LEFT_ITEM_TEXT</b> to put information in, but also the <b>RIGHT_ITEM_TEXT</b>, but sometimes this
just is not good enough. You may want to explain all sorts of details, but you don't want your CRF cluttered with 
text.</p>
<p>Fortunately you already have a function for this! It's called Tip and you can see how it works if you position your mouse above the word
<b>OpenClinica Community</b> in the footer of your screen</p>
			
<p>
<img src='/tds/img/ImagesHowTo/InstructionsInTip/it01.jpg' class='photo'/><br />   
fig. 1: Tip in rest ...<br />
<img src='/tds/img/ImagesHowTo/InstructionsInTip/it02.jpg' class='photo'/><br />
fig. 2: ... and Tip in action
</p>
			
<h3>that's what we want!</h3>
<p>And that is exactly what we want in our CRF. If you look at the source of your OpenClinica-page
you see the syntax and that is:</p>

<p>
<img src='/tds/img/ImagesHowTo/InstructionsInTip/it03.jpg' class='photo'/><br />   
fig. 3: the code 
</p>
<p>And the essential part of it is</p>

<pre>
&lt;a href="javascript:void(0)" onmouseover="Tip('Our own information here')" onmouseout="UnTip()"&gt;
</pre>
			
<h3>where do I put that?</h3>
<p>The most obvious place to put this is the <b>RIGHT_ITEM_TEXT</b> and your XL-sheet will 
look something like this:</p>
<p>
<img src='/tds/img/ImagesHowTo/InstructionsInTip/it04.jpg' class='photo'/><br />   
fig. 4: the XL-file 
</p>
<p>It's all very flexible, but there's one thing: you can not use line-breaks in the tip-function! 
You must put all the information in one big line.</p>


<p>And the result in your CRF is a link <b>Instructions</b> which does not do anything, 
but which displays the extra instructions when the mouse is positioned above it.</p>
<p>
<img src='/tds/img/ImagesHowTo/InstructionsInTip/it05.jpg' class='photo'/><br />   
fig. 5: the result 
</p>

<p>You can download the <a href='/tds/CRFExamples/TDSUsingTip.xls' target='_blank'>XL-sheet here</a>.</p>

<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#crfs'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed October 2013</p>
		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
