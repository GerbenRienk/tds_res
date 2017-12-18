<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: getExternalValue, postMessage and controlled vocabularies" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc free gratis database medisch onderzoek ecrf assigning users to sites" /> 

<title>Trial Data Solutions: getExternalValue, postMessage and controlled vocabularies</title>
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
<h3>getExternalValue, postMessage and controlled vocabularies</h3>
<p>Sometimes you want the user to be able to choose from many hundreds of options. And you even have these in a database,
sometimes called a <b>controlled library</b>, but you definitely do not want to type in a enormous amount of response-options and values.
And this library may change over time and changing your CRF to synch with this is not an option.<br /> 
You can solve this by using the function <b>getExternalValue</b> in your CRF.</p>

<h3>compatibility</h3>
<p>Be aware that this only works in Firefox. Or putting it more precisely: I could not make it work it in IE (8 or 9).
As reported by <a href='http://caniuse.com/#search=postmessage' target='_blank'>Can I use</a> the postMessage is partially supported,
but not across two windows. Sorry. (See also <a href='http://stevesouders.com/misc/test-postmessage.php' target='_blank'>this page</a>.)</p>

<h3>the easy part: your CRF</h3>
<p>Setting up an item to accept an external value is (very) easy. In our example we will make an item of RESPONSE_TYPE <b>calculation</b>.
We can then define where to get the external value. A link will be displayed and clicking it will open a browser window. There you can choose
a value and this is returned to the OpenClinica-form and inserted in the item.<br />
In fig. 1 you can see a one-item-CRF. This item has both a LEFT_ITEM_TEXT and a RIGHT_ITEM_TEXT.<br />
Then column RESPONSE_TYPE (N) must be <b>calculation</b>. Because we will use column RESPONSE_VALUES_OR_CALCULATIONS (Q), we must supply something for
RESPONSE_LABEL (O) and RESPONSE_OPTIONS_TEXT (P). In fact it does not matter what you fill in here. Of course, if you have more than one item
with getExternalValue, then you must give each a unique RESPONSE_LABEL.
</p>

<p>
<img src='/tds/img/ImagesHowTo/postmessage/pm01.jpg' border='0'  class='photo'/><br />
fig. 1: The CRF columns 
</p>
			
<p>Now we come to the function.</p>			
			
<p>
<img src='/tds/img/ImagesHowTo/postmessage/pm02.jpg' border='0'  class='photo'/><br />
fig. 2: The function getExternalValue 
</p>

<p>The function in column RESPONSE_VALUES_OR_CALCULATIONS is<br /> 
<b>func: getExternalValue("http://www.trialdatasolutions.com/tds/howto/pm.htm",right,500,300)</b>. The components are more or less obvious:<br  />
first the URL where the page with the controlled library is, then <b>left</b> or <b>right</b>, to choose if you want the left- or right-item-text
to be the link, and then the height and width of the browser window.</p>
<p>Upload your CRF and attach it to an EventDefinition and it should look something like fig. 3.</p>

<p>
<img src='/tds/img/ImagesHowTo/postmessage/pm03.jpg' border='0'  class='photo'/><br />
fig. 3: The CRF 
</p>

<p>Clicking on the link will open a new browser window, as defined in your spreadsheet. Notice that it has a reference to the item
on the OC-form in the querystring of the URL: <b>item=mainForm.input4345</b>.</p>
<p>
<img src='/tds/img/ImagesHowTo/postmessage/pm04.jpg' border='0'  class='photo'/><br />
fig. 4: The new browser-window with the Controlled Library 
</p>



<h3>but now the other part</h3>
<p>The preceeding part is not so difficult, the part to come is a bit trickier.</p>
<p>First of all: what do we need? According to the <a href='https://wiki.openclinica.com/doku.php?id=developerwiki:postmessage' target='_blank'>
documentation</a>, we must use the function <b>postMessage</b>. I will first display the source of the page with the JavaScript to do this and then 
explain how it works. </p>

<pre>
&lt;html&gt;
&lt;head&gt;
&lt;script type="text/javascript"&gt;    
function postItToOC () {            
    // start by taking the query string and from that the part after
    // item=
    // and that should be something like mainForm.input4343
    var mes=window.location.search;
    mes=mes.substring(mes.indexOf("item=")+5);
    // now read the choice of the select
    var select = document.getElementById ("mySelect");
    // and concatenate the value with mes
    mes=mes + ":" + select.value;
    // mes is now something like
    // mainForm.input4343:2
    window.opener.postMessage (mes, "*");        
}
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;p&gt;This is an example of the method to use if you want to insert a value from another page/URL into an item of an OpenClinica-form&lt;/p&gt;
    &lt;select id="mySelect"&gt;
        &lt;option value="1"&gt;First option&lt;/option&gt;
        &lt;option value="2"&gt;Second option&lt;/option&gt;
        &lt;option value="3"&gt;Third option&lt;/option&gt;
    &lt;/select&gt;
    &lt;button onclick="postItToOC ();"&gt;Post it to OC&lt;/button&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3>try it</h3>
<p>Before we explain this: try it. You can make a CRF and use the exact same link to this page, 
http://www.trialdatasolutions.com/tds/howto/pm.htm. Experiment with your CRF etc. 
Then download the page to your own environment and use it as a 
startingpoint for your own page. There are many ways of developing jscript, but I would recommend testing in FireFox with the FireBug-add-on.
</p>

<h3>how does it work?</h3>
<p>When the OC-form is loaded into the browser, it creates a listener, that listens to messages.
This is all taken care of: you do not have to do anything extra.<br />
The OC-form is displayed and the user clicks the link and the Controlled-Library-form (CL-form) is opened. On it is the option to select
something, plus a button. When the user clicks this button, a function <b>postItToOC</b> is called. 
This function sends a message to the browser with the OC-form. The listener of the OC-form receives it, checks it, extracts the content 
for the CRF-item and writes that to the form.</p>
<p>Let's get to the details. We start with the last step on the CL-form: the sending of the message to the OC-form.
In the script this is done on the line <b>window.opener.postMessage (mes, "*");</b>. <b>mes</b> is the message to send back to the OC-form.
<b>postMessage</b> is the action of sending the message, but the script must know who to send the message to. And the answer is: 
"send it to the browser window that opened this window", which is defined as <b>window.opener</b>, resulting in the OC-form, 
because in this context the <b>window</b> is the CL-form.<br />
The <b>"*"</b> means we allow the message to be sent to any domain. This is of course a security risk and in most cases you would 
put here the domain of your company or institute.</p>
<p>So we know how to send the message, but what should the message look like? Of course we want to send the chosen option 
and this is done with <b>select = document.getElementById ("mySelect")</b> and <b>select.value</b>. But we can not send this as the content of our
message! The format is not so very well documented, but it must be something like <b>mainForm.input4345:2</b>. 
Look at the line in showItemInput.jsp that goes<br /> 
<b>if (e.data.substring(0,e.data.indexOf(":")) != 'mainForm.input&lt;c:out value="${itemId}"/&gt;'){return;}</b>. 
This means that any other format is rejected.
</p>
<p>But we have all the information to build this format, because it was given to us in the querystring. We extract it  with 
<b>mes=window.location.search;</b> and <b>mes=mes.substring(mes.indexOf("item=")+5);</b>. Now we must add the <b>":"</b> and  we're done.</p>
<p>And with this technique you now have a great way to add a Controlled Library to your OpenClinica-Studies.</p>
		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
