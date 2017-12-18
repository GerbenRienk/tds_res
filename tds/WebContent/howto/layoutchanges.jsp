<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: modifying the CRF layout" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc free gratis database medisch onderzoek ecrf java-script to change the stylesheet" /> 

<title>TrialDataSolutions: modifying the CRF layout</title>
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
<h3>Changing the layout of a CRF</h3>

<p>
Although OpenClinica is very flexible in what you can do with it, it is not so flexible in how you can display it.
In fact there is not so much you can do with the layout: everything is determined by the stylesheets. <br />
Of course there's nothing wrong with changing the stylesheet. For example, if you want to have a bit more space 
for the "LEFT_ITEM_TEXT" and have it aligned to the left, you can edit the stylesheet <b>styles.css</b>.
But some of us have to run their studies in an environment with lots of other studies and then changing a stylesheet is not
an option.
</p>

<h3>jQuery</h3>
<p>R. Meester came up with a very clever way to change the style-sheet-classes by using jQuery. How it works is described at the 
<a href='http://en.wikibooks.org/wiki/OpenClinica_User_Manual/StylingWithJQuery' target='_blank'>wiki-book</a> and
you can down-load an example CRF <a href='/tds/CRFExamples/TDSjQuery.xls'>here</a>.</p>


<h3>a bit simpler than that</h3>
<p>One other way of coping with this limitation is by using so-called <b>inline style</b>, with which you can override the
normal stylesheet. For example, you want to modify the column of the Left_Item_Text.<br />
First you must find out which class in the stylesheet is applied. You do this, in FireFox, by opening a CRF and right-clicking on a Left_Item_Text.<br />
Choose <b>Inspect Element</b></p>			

	<p>
	<img src='/tds/img/ImagesHowTo/layoutchanges/loc01.jpg' border='0'  class='photo'/><br />
	fig. 1: inspect element
	</p>
<p>Now we see that the class is called <b>.aka_text_block</b> (the "aka" is from "Akaza", not "also known as") and the width is now 110px.
We would like to change that to 200 and align the text to the left. 
To do this we put<br />
<b>&lt;style type="text/css"&gt;.aka_text_block{width:200px;text-align:left;}&lt;/style&gt;</b>
<br />in the Instructions
of the section.</p>

	<p>
	<img src='/tds/img/ImagesHowTo/layoutchanges/loc02.jpg' border='0'  class='photo'/><br />
	fig. 2: inline style
	</p>
	<p>
	<img src='/tds/img/ImagesHowTo/layoutchanges/loc03.jpg' border='0'  class='photo'/><br />
	fig. 3: the result
	</p>

<h3>Another example</h3>
<p>The same method can be used in a repeating_item_group. Take for example this CRF:</p>
	<p>
	<img src='/tds/img/ImagesHowTo/layoutchanges/loc04.jpg' border='0'  class='photo'/><br />
	fig. 4: very wide CRF
	</p>
	<p>
	<img src='/tds/img/ImagesHowTo/layoutchanges/loc05.jpg' border='0'  class='photo'/><br />
	fig. 5: no special class associated with this element
	</p>

<p>In this CRF for every two hours the result of a test must be entered. This results in 1 + 12 columns, which all
have the standard width. All the inputs are just that: <b>input</b>, so we do not change a class but set
the properties of all the elements of type <b>input</b>.</p>
<p>We now put <b>&lt;style type="text/css"&gt;input{width:40px;}&lt;/style&gt;</b> in the instructions of the section.</p>

	<p>
	<img src='/tds/img/ImagesHowTo/layoutchanges/loc06.jpg' border='0'  class='photo'/><br />
	fig. 6: changing the width of all inputs
	</p>
	<p>
	<img src='/tds/img/ImagesHowTo/layoutchanges/loc07.jpg' border='0'  class='photo'/><br />
	fig. 7: smaller columns as result
	</p>

<p>As you can see in the screen-shot, the columns all fit on the screen.</p>

<h3>any extra small solutions?</h3>
<p>For those of you who just want to make one input a bit smaller and do not feel like the whole jquery 
functions-and-classes-approach, here's another trick. The idea is that you use some jquery, but not more than necessary.</p>

<pre><code>&lt;div id="B"&gt;&lt;/div&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;// for OC versions before 3.1.4, use jquery-1.3.2.min.js !&lt;/script&gt;
&lt;script lang="Javascript"&gt;$.noConflict();
jQuery(document).ready(function($){var T = $("#B").parent().parent().find("input");
 $(T).width(10);});&lt;/script&gt;</code></pre>

<p><img src='/tds/img/ImagesHowTo/layoutchanges/loc08.jpg' border='0'  class='photo'/><br />
fig. 8: smaller column</p>

<p>The script defines first an element called <b>B</b> for beacon. From there it 
goes to the parent of the parent and from there finds the first <b>input</b>, the target, or <b>T</b>.
Of this object it sets the widht to 10.</p>


<p><img src='/tds/img/ImagesHowTo/layoutchanges/loc09.jpg' border='0'  class='photo'/><br />
fig. 9: the result</p>

<h3>and making items read-only?</h3>
<p>Setting an item read-only is almost the same as changing the layout of an item. 
The idea is that you use some jquery, but not more than necessary. Again: paste the script in the right_item_text field.</p>

<pre><code>&lt;div id="RO"&gt;&lt;/div&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;&lt;/script&gt;
&lt;script lang="Javascript"&gt;$.noConflict();
jQuery(document).ready(function($){var T = $("#RO").parent().parent().find("input");
 $(T).prop({"readonly":"readonly"});});&lt;/script&gt;</code></pre>

<h3>cool, but actually I need that for a repeating item group</h3>
<p>Now this last trick does not work when you are looking at a table, or repeating item group, because whatever is in the 
right item text will not be shown. But then again: if you define an element in the header of one of the items 
in the repeating item group, you also have a reference point from which you can refer to a column. So paste the script into
the header column of one of the items of your repeating_item_group:</p>

<pre><code>&lt;span class="tableref"&gt;&lt;/span&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;&lt;/script&gt;
&lt;script&gt;
$.noConflict();
jQuery(document).ready(function($){
  function setPropGroupColumnN(pClassSelector, pN, pElementType, pPropMap) {
    $(pClassSelector).parent().parent().parent().parent().children('tbody').children('tr').children('td:nth-child(' + pN + ')').children(pElementType).prop(pPropMap);
  }
  setPropGroupColumnN('.tableref','1','input',{'readonly':'readonly'});
});
&lt;/script&gt;</code></pre>

<h3>and what about endless radio-options?</h3>
<p>Under some circumstances you can have radio-options with very long texts and they are all on one line. This is because the &lt;td&gt; has been given the 
attribute <b>nowrap</b>. You can remove this attribute with the following bit of script, that you put in the right_item_text of your CRF-item:</p>

<pre><code>&lt;div id="B"&gt;&lt;/div&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;&lt;/script&gt;
&lt;script lang="Javascript"&gt;$.noConflict();
jQuery(document).ready(function($){
  var T = $("#B").parent().parent().children("td:nth-child(3)");
  $(T).removeAttr("nowrap");
  $(T).width("150px");
});
&lt;/script&gt;</code></pre>

<p><img src='/tds/img/ImagesHowTo/layoutchanges/loc11.PNG' border='0'  class='photo'/><br />
fig. 10</p>

<p>And the result will be like this:</p>
<p><img src='/tds/img/ImagesHowTo/layoutchanges/loc10.PNG' border='0'  class='photo'/><br />
fig. 11</p>

<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#crfs'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed December 2015</p>

			</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
