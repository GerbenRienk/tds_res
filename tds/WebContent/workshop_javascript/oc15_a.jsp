<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: javascript in your CRF" /> 
<meta name="keywords" content="openclinica 3.x training  open source software clinical trials datamanagement 
non-profit academic edc javascript" /> 

<title>TrialDataSolutions: workshop javascript; hello world</title>
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
<script src="/tds/js/highlight.pack.js" type="text/javascript"></script>
<script>hljs.initHighlightingOnLoad();</script>
</head>

<body>

<%@ include file="/includes/headermenu.jsp" %>
<hr />

<div id="wrap" class="group">
  
  <div class="main">    
    
    <div class="entry group">

<h3>tools: what do we need</h3>
<ul class='disc'>
<li>local installation of OpenClinica</li>
<li>Microsoft Excel</li>
<li>notepad plus plus, available at <a href='http://notepad-plus-plus.org' target='_blank'>http://notepad-plus-plus.org</a></li>
</ul>



<h1>hello world: in plain java script</h1>
<ul class='disc'>
<li><a href='CRFs/CRFA.xls'>download CRF A</a></li>
<li>upload it to your local OC</li>
<li>choose: View CRF Version Data Entry</li>
<li>right-click in the screen and choose "save as"</li>
<li>browse to your tomcat\webapps folder</li>
<li>choose for name "StaticCRF_A.html", "Webpage, HTML Only"</li>
<li>change your browser to "http://localhost:8081/oc341/StaticCRF_A.html"</li>
<li>open StaticCRF_A.html in notepad++</li>
<li>find "RightItemText" and next to it write 
<pre><code>&lt;td valign="top"&gt;RightItemText
&lt;script&gt;document.write('hello world');&lt;/script&gt;&lt;/td&gt;</code></pre></li>
<li>refresh the page</li>
</ul>

What if you don't see anything? Then switch on the console by pressing F12.<br />
Warning: you will see an error message: prototype.js (regel 6598, kol 4); this is a bug and will not break your code!

<h1>hello world: with jquery</h1>
<p>jQuery: it is already there: D:\tomcat\webapps\oc341\includes\jmesa <br />
What is jQuery? The people who contribute to jQuery lovingly say it is "The Write Less, Do More, JavaScript Library". 
It has a number of built-in functions that make javascripting easier.<br />
To demonstrate how jQuery works, we'll switch to notepad++ and change "document.write('hello world');"  to:</p>

<pre><code>&lt;script src="includes/jmesa/jquery.min.js"&gt;&lt;/script&gt;
&lt;script&gt;&#36;.noConflict();
&#36;.noConflict();
jQuery(document).ready(function(&#36;) {
	document.write('hello world');
	})
&lt;/script&gt;
</code></pre>
<p>
When you do this and refresh your screen you will see only hello world, which is a bit too much! JQuery "takes over" 
your whole HTML-document and we don't want to go that far.
Create a so-called div or division in your CRF with the name DivToShowText</p>

<pre><code>&lt;div id='DivToShowText'&gt;&lt;/div&gt;
</code></pre>
<p>Now you can make a reference to this "object" by using the function: &#36;("#DivToShowText")
And we not only want to make a reference to it, we want to change it, or rather we want to change the html that is in the div. this we do with:</p>
<pre><code>&#36;("#DivToShowText").html('hello world');</code></pre>
<p>
Big steps! We've written script in our page that will be executed, the moment that all objects of the document are present, or in other words, when the document is ready.
</p><p>
You can see this even more clearly when you change </p>
<pre><code>&lt;div id='DivToShowText'&gt;&lt;/div&gt;
</code></pre>
<p>into</p>
<pre><code>&lt;div id='DivToShowText'&gt;goodbye world&lt;/div&gt;
</code></pre>


<p>
This is a good start, but of course we want to interact with whatever is entered into the CRF. Now, as we saw, our div has an id, 
and so do all objects of the document. However these id's are not "logical" in any way. For example the input of our item is called "input10".</p>

<p>Now it would be nice to refer to the input directly. This we do with a trick: we start with our div "DivToShowText". 
This div is in a td and the td is part of a tr, which is part of a table. If you want to see which table, go upwards to around line 815 where it says</p>
<pre><code>&lt;table border="0"&gt;
	&lt;tr&gt;
		&lt;td valign="top" class="aka_ques_block"&gt;&lt;/td&gt;</code></pre>
		
<p>and then change that to table border="1".<br />
We will walk to the input by taking this "route": first go to the parent of the div ad this is the td. Then go to the parent of the td and this is the tr. 
Now in this tr, we look for objects of type "input". And the result is</p>
<pre><code>&#36;("#DivToShowText").parent().parent().find("input");</code></pre>

<p>We're almost at the point where we can do something sensible. The score so far: we can read and write and we can refer a bit. 
Now we must look at the timing. Suppose we don't want to say "hello world", but "you just wrote ..." 
and then the content of what the user entered in the CRF-item. This means in fact two things: </p>
<ol>
<li>reading the value of the item and displaying it</li>
<li>updating it when anything changes</li>
</ol>
<p>As for 1, let's settle that first. We rewrite our jQuery(document).ready function and we give the CRF-item a name, like myItem. 
We can then read the value of it with the method <b>.val()</b></p>
<pre><code>var myItem=&#36;("#DivToShowText").parent().parent().find("input");
&#36;("#DivToShowText").html('you just wrote: ' + myItem.val());</code></pre>

<p>If we now reload the page, we just see "you just wrote" and nothing more, even if we write something in the item. 
We must execute the action again if anyhing is entered in the CRFItem, step 2. This we do by using the function keyup:</p>
<pre><code>myItem.keyup(function(){
	&#36;("#DivToShowText").html('you just wrote: ' + myItem.val());
	})</code></pre>

<p>Now it is obvious that we are repeating ourselves here, so we put the action in a function called "executeMyActions()" 
and we call this function whenever something is typed in the input and also when the document is ready:</p>
<pre><code>&lt;!-- our code starts here 
********************************************************** --&gt;
	&lt;td valign="top"&gt;RightItemText
	&lt;div id='DivToShowText'&gt;goodbye world&lt;/div&gt;
	&lt;script src="includes/jmesa/jquery.min.js"&gt;&lt;/script&gt;
	&lt;script&gt;&#36;.noConflict();
	jQuery(document).ready(function(&#36;) {
		//define the CRF item:
		var myItem=&#36;("#DivToShowText").parent().parent().find("input");
		
		//define a function of the actions to be executed:
		function executeMyActions(){
			&#36;("#DivToShowText").html('you just wrote: ' + myItem.val());
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

<p>If you're happy with the script, copy it in notepad++ and paste it in the right_item_text of the item of the CRF. Upload the CRF and check if everything works also in OpenClinica.</p>



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
