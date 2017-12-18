<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: javascript" /> 
<meta name="keywords" content="openclinica 3.x training  open source software clinical trials datamanagement 
non-profit academic edc commands frequently used" /> 

<title>TrialDataSolutions: workshop javascript</title>
<link rel="stylesheet" type="text/css" media="screen, projection" href="/tds/css/screen.css" />
<script src="/tds/js/jquery-1.2.6.min.js" type="text/javascript"></script>

<script src="/tds/js/ga.js" type="text/javascript"></script>
<script src="/tds/js/highlight.pack.js" type="text/javascript"></script>
<script>hljs.initHighlightingOnLoad();</script>
</head>

<body>

<%@ include file="/includes/headermenu.jsp" %>

<div id="wrap" class="group">
	<div class="main">		
		<div class="entry group">


<h1>in general</h1>
<ul class='disc'>
<li>javascript is case sensitive!</li>
<li>mind your brackets and curly brackets</li>
<li>separate commands with a semi-colon <b>;</b></li>
<li>layout-things such as new lines, tabs or spaces are of no importance or consequence: you can use them to make your script easier to read</li>
</ul>

<h1>most used commands</h1>
<ul class='disc'>
<li>jQuery(document).ready(function($) {[a_set_of_commands]}: a set of commands that is executed when the document is ready to be used</li>
<li>.val(): read the value of an object</li>
<li>.val([new_value]): set the value of an object</li>
<li>.parent(): refer to the parent of an object</li>
<li>.find("[type_of_object]"): find object of a certain type</li>
<li>.keyup(function(){[set_of_commands]}): a set of commands to execute when something is entered in an object, for example in an input-box</li>
<li>console.log([something_to_be_displayed]): writes something to be displayed in the console of the browser</li>
<li>if ([expression]){[set_of_commands]}else{[set_of_commands]}</li>
<li>== means 'equals'</li>
<li>!= means 'not equals' or 'is different from'</li>
<li>.change(): set the status of an object to 'changed'</li>
<li>.prop("[attribute]", "[new_value]"): set the attribute of an object to 'new value'</li>
<li>.click(function(){[set_of_commands]}): a set of commands to execute when an object is clicked, for example a button</li>
<li>$("#[name_of_select]").append($("&lt;option /&gt;").val([new_code]).text([new_text])): add option to a select</li>
</ul>

<p>About '===' (and '!=='): triple equals means 'equality without type coersion'. Using the double equals allows us to be sloppy. For example is we test
1=='1' the result will be 'true', because auto type coersion is on and the character '1' will be converted into the integer 1. However if we compare 1==='1' the result will be false, because they are of a different type.</p>

<p>And some love to use "shortcuts" like:<br />
<b>return months &lt;= 0 ? 0 : months; </b> meaning "evaluate if months is less than or equals zero; if true then return zero, if false
 then return months".<br />
 Or <b>myInt -= anotherInt;</b> and that is the same as <b>myInt = myInt - anotherInt;</b>
</p>

<p align='right'><a href='/tds/workshop_javascript/index.jsp'>Start-page of the workshop.</a></p>
<p class='pagereviewdate'>this page was last reviewed July 2015</p>
    </div> <!-- /.entry group -->
  </div> <!-- /.main -->
  
<%@ include file="/includes/footerhowto.jsp" %>
  <hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
