<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: javascript" /> 
<meta name="keywords" content="openclinica 3.x training  open source software clinical trials datamanagement 
non-profit academic edc if thens and writing values" /> 

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

<h1>if-then-construction plus some more events</h1>

<p>Let's head on and do something sensible. <a href='CRFs/CRFB.xls'>download CRF B</a> and upload it to your OpenClinica-instance and choose "View CRF Version Data Entry". Save this as D:\tomcat\webapps\oc341\StaticCRF_B.html Open the file in notepad++.</p>
<p>We now have three items to do something with and we start with the first one. Let's say we want to display a message next to the input, when this input is less than 3.
In notepad++ search for "Item A" and there paste:</p>
<pre><code>&lt;!-- our code starts here 
********************************************************** --&gt;
	&lt;div id='ConclusionDiv'&gt;&lt;/div&gt;
	&lt;script src="includes/jmesa/jquery.min.js"&gt;&lt;/script&gt;
	&lt;script&gt;&#36;.noConflict();
	jQuery(document).ready(function(&#36;) {
		//the CRF item:
		var myItem=&#36;("#ConclusionDiv").parent().parent().find("input");
		
		//function of the actions to be executed:
		function executeMyActions(){
			&#36;("#ConclusionDiv").html('you are ...');
			}
		//call the function when something is entered
		myItem.keyup(function(){
			executeMyActions();
			})
		
		// and execute the function also when the document loads
		executeMyActions();
		}
	)
	&lt;/script&gt;
							
&lt;!-- our code ends here   
********************************************************** --&gt;
</code></pre>
<p>We now add a condition to the function. We check if the value in the input is more or less than 3 and based on that, we qualify the person lucky or poor.</p>
<pre><code>console.log('executing script for item-value ' + myItem.val());
if (myItem.val() &gt; 3){
	&#36;("#ConclusionDiv").html('lucky you!');
	}
else{
	&#36;("#ConclusionDiv").html('poor you!');
	}
}
</code></pre>

<p>This is getting somewhere: we can evaluate the input and based on that we take two different actions. Furthermore we can see in the console what is happening. The only thing not so nice is that when nothing is in the input, the script still rates us as poor, so we add another condition to the else-part of the if-statement: only write "poor you!" if the item has a value which is less than 3</p>

<pre><code>function executeMyActions(){
	console.log('executing script for item-value ' + myItem.val());
	if (myItem.val() &gt; 3){
		&#36;("#ConclusionDiv").html('lucky you!');
		}
	else{
		if(myItem.val()){&#36;("#ConclusionDiv").html('poor you!');}
		}
	}</code></pre>

<h1>and a select is the same?</h1>
<p>Let's now focus on the second item: what if we want to display the message "go then" if the user chooses option 2. If we copy a bit from the first item and change the names of the objects to make them unique, we might come up with something like:</p>
<pre><code>&lt;div id='HolidayDiv'&gt;&lt;/div&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;&lt;/script&gt;
&lt;script&gt;&#36;.noConflict();
jQuery(document).ready(function(&#36;) {
	//the CRF item:
	var mySelect=&#36;("#HolidayDiv").parent().parent().find("select");
	
	//function of the actions to be executed:
	function executeMyActions2(){
		if (mySelect.val() == 2){
			&#36;("#HolidayDiv").html('go then');
			}
		}
	//call the function when something is entered
	mySelect.keyup(function(){
		executeMyActions2();
		})
	
	// and execute the function also when the document loads
	executeMyActions2();
	}
)
&lt;/script&gt;</code></pre>

<p>Syntactically there is nothing wrong here, but we will never see the message, because nothing gets keyed-in. However you can use the event <b>change</b> in stead of keyup:</p>
<pre><code>//call the function when something is entered
	mySelect.change(function(){
		executeMyActions2();
		})&lt;/script&gt;</code></pre>

<p>Be careful not to use the function onChange(), because that is already in use by OpenClinica!</p>
<h1>can't wait to see that with radio's?</h1>
<p>A group of radio-buttons is quite something different. If we right-click on the Yes of the radio-buttons and choose "inspect element" we see that it is an input of type radio and the id is something like input1994. Now if we do the same for No, we see exactly the same, but with a different value. And of course also for the third option. In fact these radio-buttons are all part of a group, or array. You can see how many buttons there are by referring to the length of the array:</p>


<pre><code>&lt;div id='ComplexDiv'&gt;&lt;/div&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;&lt;/script&gt;
&lt;script&gt;&#36;.noConflict();
jQuery(document).ready(function(&#36;) {
	//the CRF item:
	var myRadioGroup=&#36;("#ComplexDiv").parent().parent().find("input");
	
	//function of the actions to be executed:
	function executeMyActions3(){
		console.log("radios: " + myRadioGroup.length);
		//&#36;("#ComplexDiv").html('I know');
		}
	//call the function when something is entered
	myRadioGroup.change(function(){
		executeMyActions3();
		})
	
	// and execute the function also when the document loads
	executeMyActions3();
	}
)
&lt;/script&gt;</code></pre>

<p>And if we want to find which button was pressed, we must go through all the options and make a note of which one was checked:</p>

<pre><code>function executeMyActions3(){
	// loop through the radio's
	for (var i = 0; i &lt; myRadioGroup.length; i++) {
			if (myRadioGroup[i].checked) {
				var valueToCheck = myRadioGroup[i].value;
				}
			}
	if (valueToCheck == 7){
		&#36;("#ComplexDiv").html('I know');
		}
	else{
		&#36;("#ComplexDiv").html('');
		}
	}</code></pre>
	
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
