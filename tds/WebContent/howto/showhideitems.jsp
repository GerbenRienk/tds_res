<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="Simple conditional display in OpenClinica 3.1.x" /> 
<meta name="keywords" content="openclinica training 3.1 simple conditional display status open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>TDS: showing and hiding items on a CRF (OC 3.1)</title>
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
<h3>showing or hiding items on a CRF, based on the input of another item (OC 3.1)</h3>

<p>One of the features of OpenClinica since version 3.1 is 
 showing or hiding items based on the value of an other item on the same CRF. OpenClinica offers two ways of doing this: 
 in the Excel-sheet or by using an XML-file. On this page we'll discuss the first option.</p>
<p>To make things a bit livelier we uploaded <a href='http://www.youtube.com/watch?v=lkDgdUWl_hQ' target='_blank'>a video to Youtube</a>,
 so you can sit back and watch that. But the same information is given below, plus a link to download the XL, so read on.</p>

<iframe title="YouTube video player" width="574" height="360" 
src="http://www.youtube.com/embed/lkDgdUWl_hQ?rel=0&amp;hd=1" frameborder="0" ></iframe>	
		 
<h3>what to show and when to show it</h3>
<p>For this demo we'll make a CRF with just three items: Gender, Are you currently pregnant? and Have you been tested for Prostate 
Cancer</p>
<p>
<img src='/tds/img/ImagesHowTo/ShowHideItems/00shi.jpg' border='0'  class='photo'/><br />
fig. 1: CRF with three items
</p>
<p>If the user chooses for gender 1, then we would like to hide the question about pregnancy and show the prostate-question.
And if on the other hand 2 is chosen, so if the subject is female, then hide the prostate-question and show the pregnancy-question.</p>

<h3>two essential columns</h3>
<p>To do this we use the last two columns: <br/>
Z: ITEM_DISPLAY_STATUS and <br />
AA: SIMPLE_CONDITIONAL_DISPLAY</p>
<p>The function of the first column is to assign a default display-status to an item. If you leave this cell open, the default is <b>Show</b>.
For our example we fill in for Gender <b>Show</b> and for the other two items <b>Hide</b>.</p>
<p>The last column, SIMPLE_CONDITIONAL_DISPLAY, is used to change the ITEM_DISPLAY_STATUS from hide to show
and has three parameters. The syntax is:<br />
ITEM_NAME: name of the item that decides whether the the hidden item will be shown<br />
RESPONSE_VALUE: if ITEM_NAME equals RESPONSE_VALUE then the item will be shown<br />
message: the message to be displayed if inconsistencies arise</p>

<p>In our case we type in for the pregnancy-question: show it, if item Gender equals two, plus a message: 
<br /><b>Gender, 2, Only provide answer if subject is female</b>.</p>


			<p>
			<img src='/tds/img/ImagesHowTo/ShowHideItems/01shi.jpg' border='0'  class='photo'/><br />
			fig. 2: conditional display of two questions
			</p>
			
<h3>the message</h3>
<p>The third parameter, the message, may be a bit confusing: why would you add a message? Consider the following situation.
At first the data-entry person chooses Male and answers for the prostate-question "no", by clicking the appropriate radio-button.
Then he/she realises a mistake was made and changes the Gender-item to Female. The prostate-item will be hidden, but there will
be a value associated with it. This is of course a discrepancy and should be handled as such. At the top of the CRF the message will be 
displayed <b>Only provide answer if Subject is male</b>. Because this item is of type radio-button, you can not delete the answer.
What you can do is make a note of the discrepancy by clicking on the blue flag, give an explanation of your mistake and close the discrepancy.</p>
			
<h3>limitations of Simple Conditional Display</h3>
<p>Simple Conditional Display works only with non-repeating items that have pre-determined values, so with 
radio and single-select fields: the DATA_TYPE must be INT. 
And only if the item equals a certain value: you can not 
define a conditional display by "greater than" or other operators.<br/>
The items that are hidden and shown can be of any type.
</p>		

<p>Click <a href='/tds/CRFExamples/SimpleConditionalCRF.xls' target='_blank'>here</a> to download the XL-file used for this example.</p>
<h3>what about checkboxes and multi-selects?</h3>
<p>As we've seen on <a href='/tds/howto/ctoperator.jsp'>another page</a> about the checkboxes, the answer, or rather answers, to this
type of question are a string with all the options checked, separated with comma's. And the ResponseType is always <b>ST</b>.
But fortunately this does not mean that we can not use a check-box answer with SimpleConditonalDisplay.<br  />
For example take the question <b>Are you allergic?</b> where a user can tick all that apply.</p>


<p><img src='/tds/img/ImagesHowTo/ShowHideItems/02shi.jpg' border='0'  class='photo'/><br />
fig. 3: check boxes</p>

<p>As you can see in the XL-sheet the ResponseType of the group of checkboxes is <b>ST</b>, but the
SimpleConditionalDisplay can still be used.</p>

<p><img src='/tds/img/ImagesHowTo/ShowHideItems/04shi.jpg' border='0'  class='photo'/><br />
fig. 4: XL-file</p>

<p><img src='/tds/img/ImagesHowTo/ShowHideItems/03shi.jpg' border='0'  class='photo'/><br />
fig. 5: the result</p>

<p>Of course the limitation is that you can only define one item to perform the SimpleConditionalDisplay on. As soon as you
have more than one item, you must use the <b>ShowAction</b>, of which you can find an example  
<a href='/tds/howto/showhidemulti.jsp'>here</a>.</p>			

<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#crfs'>here</a>.</p>
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
