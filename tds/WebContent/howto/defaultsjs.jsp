<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: using the status of the CRF in your expression" /> 
<meta name="keywords" content="openclinica 3.x training conditional display status open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: javascript to set defaults in a repeating item group</title>
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
			<h3>default entries in a repeating item group</h3>
			
<p>For some time we've had the option to insert values in a repeating-item-group, as described on 
<a target='/tds/howto/transferdatanewversion.jsp' href='_blank'>this page</a>, but you may need additional functionality,
like making the defaults read-only and/or taking away the option to remove a line in the grid. 
To be able to do this we must use some java-scripting, so it makes sense to set the defaults in the same script.
 </p>
			
<p>
<img src='/tds/img/ImagesHowTo/defaultjs/dj01.PNG' border='0'  class='photo'/><br />
fig. 1: the end result
</p>
<h3>try it for yourself</h3>			
<p>
Do you want to see that on your own OpenClinica? <a href='/tds/CRFExamples/defaultsjs.zip' target='_blank'>Here</a> is the zip-file.
</p>

<h3>what does the script do?</h3>
<p>The code is put in the header column of the first item of the repeating-item-group and it is not so difficult, in fact it looks
a lot like the code that was used to create an autonumber:</p>

<pre><code class="javascript">&lt;div id="Beacon"&gt;&lt;/div&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;&lt;/script&gt;
&lt;script lang="Javascript"&gt;
$.noConflict();
jQuery(document).ready(function($){
  var valuesToInsert = ["Ig","Hgb","Na","K","pH","ALAT","ASAT","Creat"];
  var columnToInsert = 1;
  var columnWidth = 50;
  //make a reference to the table we're in 
  var MyTable = $("#Beacon").parent().parent().parent().parent();
  //define a counter 
  var i = 0;
  var myInput;
  //define the function
  function setDefaults(){
    //loop through the tr's
    $(MyTable).children('tbody').children('tr').each(function(){
      //make a reference to the right input
      myInput = $(this).children('td:nth-child(' + columnToInsert + ')').children('input:text');
      //check if the input is already populated
      if(valuesToInsert[i] &amp;&amp; myInput.val() != valuesToInsert[i]){
        myInput.val(valuesToInsert[i]);
        myInput.change();
      }
        myInput.attr("readonly","readonly");
        myInput.width(columnWidth);
      //increase the counter 
      i++;
    });
  }
  //now call the function
  window.setTimeout(function(){
      setDefaults();
    },1);
});
&lt;/script&gt;
</code></pre>

<p>First we define a div that will act as a Beacon and we call it <b>Beacon</b>. From this beacon we can refer to the table of the repeating-item-group
 as the parent of the parent of the parent of our parent: <br />
 <b>MyTable = $("#Beacon").parent().parent().parent().parent()</b>. <br />
 To keep things simple we define the values to insert plus the column in which to insert and also the width of the inputs we will use:<br />
  <b>valuesToInsert = ["Ig","Hgb","Na","K","pH","ALAT","ASAT","Creat"]<br />
  var columnToInsert = 1<br />
  var columnWidth = 50</b></p>
 <p>
 <b>function setDefaults()</b> is where it's happening: we loop through all the table-rows, and in each table-row 
 we take the first n-th child of type td, whatever we defined as the column to insert. <br />
 Once we're there, we can check if the value has already been inserted and if not, we do that and set the status to <b>changed</b>.<br />
 And to round things up we make the input read-only and set the width. </p>
 
<p>There's one more thing that needs explaining and that is <b>window.setTimeout(function(){setDefaults();},1);</b>.
This function waits one millisecond and then executes the function and the thing is: it starts counting once the whole page has finished.
"Mmmh, that sounds like document-ready and we already use that" you may say and yes, we do, but a grid in OpenClinica is 
built with the so-called repetition-model which makes one line of the grid and then copies it. JQuery doesn't wait for that, 
so your grid could be halfway, when jQuery tries to populate it. With setTimeout we wait for the repetition-script to finish
and one millisecond later we start populating. 
</p>


<h3>now tell us what animals you saw in Australia</h3>

<p>After taking so much trouble to insert the defaults you may want prevent the users from deleting the rows. This can be done relatively easy,
 because the remove-icons all share the same class, called <b>button_remove</b>. Here you see the result:</p>
 
<p>
<img src='/tds/img/ImagesHowTo/defaultjs/dj02.PNG' border='0'  class='photo'/><br />
fig. 2: CRF with remove-icons gone
</p>
 
<p>The code is almost similar to the previous code:</p>
<pre><code class="javascript">&lt;div id="BeaconAnimal"&gt;&lt;/div&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;&lt;/script&gt;
&lt;script lang="Javascript"&gt;
$.noConflict();
jQuery(document).ready(function($){
  var valuesToInsert = ["whale", "wombat", "wallaby"];
  var columnToInsert = 1;
  var columnWidth = 80;
  //make a reference to the table we're in 
  var MyTable = $("#BeaconAnimal").parent().parent().parent().parent();
  //define a counter 
  var i = 0;
  var myInput;
  //define the function
  function setDefaults(){
    //loop through the tr's
    $(MyTable).children('tbody').children('tr').each(function(){
      //make a reference to the right input
      myInput = $(this).children('td:nth-child(' + columnToInsert + ')').children('input:text');
      //check if the input is already populated
      if(valuesToInsert[i] &amp;&amp; myInput.val() != valuesToInsert[i]){
        myInput.val(valuesToInsert[i]);
        myInput.change();
      }
        myInput.attr("readonly","readonly");
        myInput.width(columnWidth);
      //increase the counter 
      i++;
    });
    // now remove the remove buttons that are all of class button_remove
    $(MyTable).find(".button_remove").remove();
  }
  //now call the function
  window.setTimeout(function(){
    setDefaults();
  },1);
});
&lt;/script&gt;
</code></pre>
<p>The difference is just one line, <b>$(MyTable).find(".button_remove").remove()</b>, that takes our table and removes from it all
objects of class <b>button_remove</b>.<br />
You may think "can't we just do that for the whole form, as opposed to one table?" but it could be that you have on the same section
more than one grid and then you would like to apply the remove-action just on one.</p>

<p>
<img src='/tds/img/ImagesHowTo/defaultjs/dj03.PNG' border='0'  class='photo'/><br />
fig. 3: where to put it
</p>


<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#crfs'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed February 2018</p>
    </div>

  </div> <!-- /.main -->
  
<%@ include file="/includes/footerhowto.jsp" %>
  <hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
