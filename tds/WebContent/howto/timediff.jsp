<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: calculating the number of minutes between two timefields" /> 
<meta name="keywords" content="openclinica 3.1 training  open source software clinical trials datamanagement 
non-profit academic edc datefield calculation" /> 

<title>TrialDataSolutions: calculating the number of minutes between two timefields</title>
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

<h1>the number of minutes between two timefields</h1>
			
<p>This page is about <b>calculating</b> with time-fields. If you are looking for a way to add a timefield to your CRF, have a look at 
<a href='/tds/howto/usingregexpfortimefield.jsp'>this page</a>, where you can find just that.</p>
<p>And the page you are currently reading is remarkably similar to <a href='/tds/howto/datediff.jsp'>this page</a> where you can find instructions 
how to calculate the difference between two dates.</p>
<p>Let's start at the end: this is what we want:</p>

<p><img src='/tds/img/ImagesHowTo/timediff/td01.png' border='0'  class='photo'/><br />
fig. 1: what we want</p>

<h1>start easy</h1>
<p>If you can't wait to see it in action, click <a href='/tds/CRFExamples/TimeDiff.zip'>here</a> for the XL-file. <br />
It looks like this:
</p>

<p><img src='/tds/img/ImagesHowTo/timediff/td02.png' border='0'  class='photo'/><br />
fig. 2: the XL </p>

<p>"That won't do the trick" you'll say and right you are: we need some java-script to do the math.
We stored that in the instructions-part of the Section:</p>

<p><img src='/tds/img/ImagesHowTo/timediff/td03.png' border='0'  class='photo'/><br />
fig. 3: the script in the section </p>

<h3>the works</h3>
<pre>
&lt;script src="includes/jmesa/jquery.min.js"&gt;// for OC versions before 3.1.4, use jquery-1.3.2.min.js !&lt;/script&gt;
&lt;script lang="Javascript"&gt;
$.noConflict();
jQuery(document).ready(function($){
	//find out who's who
	var fieldTimeField1 = $("#TimeField1").parent().parent().find("input");
	var fieldTimeField2 = $("#TimeField2").parent().parent().find("input");
	var fieldDifference = $("#Difference").parent().parent().find("input");

	function calculateMinutes(fieldTimeField){
		// retrieve values
		var TimeAsText = fieldTimeField.val();
		// check if field is filled
		if (TimeAsText!=""){
			// split and determine hours and minutes
			var splitString = TimeAsText.split(":");
			var hours = splitString[0];
			var minutes = splitString[1];
			return (60*hours) + (1*minutes);
		}
	}

	function calculateDifference(){
		var Diff = calculateMinutes(fieldTimeField2) - calculateMinutes(fieldTimeField1);
		if (fieldDifference.val() != Diff){
			fieldDifference.val(Diff);
			fieldDifference.change();
		}
	}
	// fire when anything is entered 
	fieldTimeField1.keyup(function(){
		calculateDifference();
	});
	fieldTimeField2.keyup(function(){
		calculateDifference();
	 });
});
&lt;/script&gt;
</pre>

<p>You can read this script almost from top to bottom. It starts with making references to the items in the CRF:
TimeField1, TimeField2 and Difference. <br />
Then two functions follow: the first one, <b>calculateMinutes</b> 
takes a CRF-item as parameter and returns the
minutes since midnight. This function is used by the second function, <b>calculateDifference</b> to calculate the difference (surprise!),
to check if this differs from the value already in field <b>Difference</b> and if so, to set the new value.<br />
Finally we indicate that we want this function to run, every time something is entered in either TimeField1 or TimeField2
with <b>fieldTimeField1.keyup</b> and <b>fieldTimeField2.keyup</b>.</p>

<h3>sure, fine, but I need this in a repeating item group</h3>
<p>The above is not very impressive if you want to calculate minutes between items in a grid, or 
repeating-item-group, because then you do not have the right item text to put a div in and refer to that etc, etc. 
To get the result shown at fig. 4, we need some more java-scripting. This time we put it all in the instructions of the section.</p>

<p><img src='/tds/img/ImagesHowTo/timediff/td04.png' border='0'  class='photo'/><br />
fig. 4: same trick in a repeating item group </p>

<p>The script is a bit harder to explain: see below. (Many thanks to Sander de Ridder and Lindsay Stevens, who came up with 
a script on the wikibook page on <a href='http://en.wikibooks.org/wiki/OpenClinica_User_Manual/LongLists' target='_blank'>
How to use long, external lists</a>: that forms an essential part of this script.)
</p>
<pre>
&lt;script src="includes/jmesa/jquery.min.js"&gt;// for OC versions before 3.1.4, use jquery-1.3.2.min.js !&lt;/script&gt;
&lt;script lang="Javascript"&gt;
$.noConflict();
jQuery(document).ready(function($){
	//set group name the same as in XL
	var groupName = "MyGroup";
	groupName = groupName.toUpperCase();

	function calculateMinutes(fieldTimeField){
		var TimeAsText = fieldTimeField.val();
		// check if field is filled
		if (TimeAsText!=""){
		 // split and determine hours and minutes
		 var splitString = TimeAsText.split(":");
		 var hours = splitString[0];
		 var minutes = splitString[1];
		 return (60*hours) + (1*minutes);
		}
	}

	function calcDiff(me){
		if(me.attr("ID")!=undefined){
		 var myID = me.attr("ID");
		 var gIndex = myID.indexOf(groupName);
		 if(gIndex!=-1){
				var myParent = me.parent();
				var colNr = $(myParent).parent().children().index($(myParent)) + 1;
		
				if(colNr==1|colNr==2){
				 //fldF0 is the other time field
				 var fldF0 = $(myParent).siblings(':eq(0)').children('input:text');
				 //fldF1 is the field to write the difference in
				 var fldF1 = $(myParent).siblings(':eq(1)').children('input:text');
				 var val1 = calculateMinutes(me);
				 var val2 = calculateMinutes(fldF0);
				 var valTot = Math.abs(val2-val1);
				 //ony write the value if it has changed
				 if (valTot != fldF1.val()){
						fldF1.val(valTot);
						fldF1.change();
				 }
				}
		 }
		}
	}
	
	$("table.aka_form_table").on("keyup", ":input", function(){
		calcDiff($(this));
	});
});
&lt;/script&gt;
</pre>


<p>Start with the line at the bottom <b>$("table.aka_form_table").on("keyup", ":input", function()</b> where you call a function
when in an object of type <b>input</b> something is typed, <b>keyup</b>. You don't want this to happen everywhere, but just in a <b>table</b> 
that has the class <b>aka_form_table</b>, because this class is used for the RepeatingItemGroup.</p>
<p>Now we go to the top of the script. First we define which Group we are interested in and this we store in <b>groupName</b>.
Make sure that you use exactly the same Group name as defined in the CRF. Then in the second line we convert this groupName
to uppercase, which may seem odd, but comes in handy when you want to test the CRF in preview-mode: in preview your item will be 
called <b>MyGroup_0input3344</b> while in actual data-entry mode it is called <b>IG_TDSDI_MYGROUP_0input3344</b>. (So if you want
to testdrive your java-script in preview-mode, just comment out <b>groupName = groupName.toUpperCase();</b>) </p>
<p>We skip function <b>calculateMinutes()</b>, because that works the same as in the other CRF, explained earlier.
What's more interesting is the function <b>calcDiff(me)</b>, where <b>me</b> is the object in the table where we typed something.
First we want to find the ID of this input with <b>myID = me.attr("ID")</b> and then we check if the name of the group
we are looking for is in the ID of the input. If not, we're in the wrong table all together and we exit the function.</p>
<p>But if we are in the right table, then we look at the parent of our input, which is a <b>td</b> and the parent of our parent 
is the table row <b>tr</b>. To find out which column we are in, we ask for the index of our parent and then add 1, because the 
set of children starts with 0: <b>colNr = $(myParent).parent().children().index($(myParent)) + 1;</b> If the
column is 1 or 2, then we must take the two values, convert them into minutes and write the difference to the
item Difference. </p>
<p>This can be done with <b>$(myParent).siblings(':eq(0)').children('input:text')</b>, because what it does is that it
goes to the parent, <b>td</b>, and then finds the siblings, so other td's in the tr, where the index starts with 0 and the parent itself 
is not included. Confusing? Yes, it is! It's easier if you take the example where you click in one of the inputs of T1.
The parent is now the td in column 1, and this td has 2 siblings: sibling(0) for column 2 and sibling(1) for column3.<br />
Now if we type something in an input in T2, our parent will have again 2 siblings:  sibling(0) for column 1 and sibling(1) 
again for column3.</p>
<p>Now that is handy, because sibling(0) will always be "the other time-field" and sibling(1) will
always be the difference-field. We subtract the two time-fields, but because we do not know which one is the greater 
of the two, we must take the absolute difference, <b>valTot = Math.abs(val2-val1);</b> <br />
However be aware of the fact that we do not check if the first time-field is before the second one. </p>

<p>You may wonder why use <b>children('input:text')</b> when we want the value of "the other time-field".
This is because we talk about a collection of objects of a td. In it can be all sorts of things, but we are interested
in inputs. However if we would refer to <b>children('input')</b> we would get the collection of inputs in the td
and all though you can not see them, there are 2! In each td is not only the visible input, but also 
a hidden input with the default value of he item. Therefore we must specify we're only interested in inputs of type text.</p>
<p>Have fun scripting your own CRFs (and don't hesitate to ask if you get stuck).</p>





<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#crfs'>here</a>.</p>
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
