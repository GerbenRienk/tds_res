<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: using the status of the CRF in your expression" /> 
<meta name="keywords" content="openclinica 3.x training conditional display status open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: adding row-numbers in a repeating item group</title>
<link rel="stylesheet" type="text/css" media="screen, projection" href="/tds/css/screen.css" />
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
			<h3>adding row-numbers in a repeating item group</h3>
			
<p>You may want to have row-numbers in a repeating-item-group for several reasons, such as making an easy reference to the data in a row. 
However auto-numbering in a grid is not standard and we have to apply some javascript . The result will be like this:

 </p>
			
<p>
<img src='/tds/img/ImagesHowTo/rownumber/rn01.PNG' border='0'  class='photo'/><br />
fig. 1: the result
</p>
<h3>no time for all that</h3>			
<p>
No time to wait? <a href='/tds/CRFExamples/CRFWithAutoNumber.zip' target='_blank'>Here</a> is the zip-file with an example CRF.
The script writes an autonumber, whenever something is entered in any input of the table.  What you must do if you want to use the script in
your own table is set the proper groupName in <b>var groupName =[your very own groupname here]</b>. 
Furthermore in the script a prefix is defined, now #, but that can of course be anything or nothing.
</p>

<h3>what about the code?</h3>
<p>The code is put in the header column of the first item of the repeating-item-group and it is not so difficult:</p>
<pre><code class="javascript">#&lt;div id='B'&gt;&lt;/div&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;&lt;/script&gt;
&lt;script lang="Javascript"&gt;
$.noConflict();
jQuery(document).ready(function($){
 var groupName = "RIG";
 var prefix="#";
 //set the first column to read-only and make it a bit smaller
 $("#B").parent().parent().parent().parent().children('tbody').children('tr').children('td:nth-child(1)').children('input:text').prop({"readonly":"readonly"});
 $("#B").parent().parent().parent().parent().children('tbody').children('tr').children('td:nth-child(1)').children('input:text').width(25);
 function checkAutoNr(me){
  // check if whatever was clicked has an ID
  if(me.attr("ID")!=undefined){
   //now check if this ID has the groupname in it
   var myID = me.attr("ID");
   var gIndex = myID.indexOf(groupName.toUpperCase());
   if(gIndex!=-1){
    //we're actually in the correct table!
    var myParent = me.parent();
    var rowindex = $(me).closest('tr').index() + 1;
    var autoNumber = prefix + rowindex;
    var fldAN = $(myParent).parent().children('td:nth-child(1)').children('input:text');
    if (fldAN.val()!=autoNumber){
     fldAN.val(autoNumber);
     fldAN.change();
    }
   }
  }
 }
 //add a listener to all tables, for the key-up-event, when it is an input
 $("table.aka_form_table").on("keyup", ":input", function(){
  checkAutoNr($(this));
 });
});
&lt;/script&gt;
</code></pre>
<p>First we define a div that will act as a Beacon and we call it <b>B</b>. From this beacon we can refer to the table of the repeating-item-group
 as the parent of the parent of the parent of our parent: <br />
 <b>$("#B").parent().parent().parent().parent()</b>. <br />
 In this table we look at the tbody and in that tbody we loop through all the table-rows, tr:<br />
 <b>children('tbody').children('tr')</b>.<br />
 In each table-row we take the first child of type table-data, td: <b>children('td:nth-child(1)')</b>. <br />
 And in this cell or td, we take  the first input of type text: <b>children('input:text')</b>. <br />
 And that input we make read-only. And in the next line of the script we set the width of that input to 25. </p>
<p>The next step is that we define the function that will write the auto-number, <b>checkAutoNr()</b> and at the end we add a listener to all
inputs (of in fact all tables) that the function checkAutoNr() must be processed whenever something is entered in an input.</p>
<p>The function itself first takes the ID of the object that called the function and in our case this is the input. This input has an ID and the name of the 
repeating-item-group is part of that ID, for example <b>IG_TDSAU_RIG_0input445</b>, where <b>RIG</b> is the name of the group, the group_label.
"RIG" starts at the 10th character of the ID, so <b>indexOf</b> will return a <b>10</b>.<br />
If we're in another repeating-item-group, then "RIG" will not be in the ID and the <b>indexOf</b> will be <b>-1</b>.
</p>
<p>Now then, we know that we're in the correct table. All we have to do is look at the index of the row we're in. 
We add  the prefix to this row-index and put that in the auto-number field, but only if it was not there already:
<b>if (fldAN.val()!=autoNumber)</b>.</p>

<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#crfs'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed January 2017</p>
    </div>

  </div> <!-- /.main -->
  
<%@ include file="/includes/footerhowto.jsp" %>
  <hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
