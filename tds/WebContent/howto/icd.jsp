<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: an extra warning" /> 
<meta name="keywords" content="openclinica 3.1 training  open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: a link to ICD 10</title>
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
			<h3>a (one way) link to the ICD10 site</h3>
			
<p>You are probably aware of the ICD10 coding system and of the fact that it contains thousands of terms. If you want to use the ICD classification
in your Study, you can not make a single-select with all the possible terms: the best you can do is make a text-input and 
apply a regular expression to it (and we'll come the regexp later).</p>
<p>But wouldn't it be nice if we had a link to the ICD-site? That's straight-forward: in your <b>RIGHT_ITEM_TEXT</b> you add 
the link, which is <a target='_blank' href='http://apps.who.int/classifications/icd10/browse/2010/en'>
http://apps.who.int/classifications/icd10/browse/2010/en</a>.</p>
<p>That's already a big step forward. Now suppose you wanted to classify the injuries someone has from riding his/her bicycle into another one.
(I'm not making this up: an ICD10-code exists for this!) In the search-bar you type in <b>cycl</b> and a list of matching terms comes up and you
choose <b>V11: Pedal cyclist injured in collision with other pedal cycle</b>. (See? I told you.)</p>
<p>All good and well, but look at the address-bar of your browser: an extra part is added, <b>#/V11</b>. What if we could 
modify our link to hold that extra bit? We can do that, just read on, but remember it is only one-way: 
you can not go the ICD-site, pick a term and have it inserted into your OpenClinica-CRF.</p>

<p><img src='/tds/img/ImagesHowTo/icd/icd01.jpg' border='0'  class='photo'/><br />
fig. 1: the ICD-site</p>

<h3>adding the term to the link</h3>
<p>You guessed it: we will use some javascript to add the term entered to the link, so that clicking it not only
opens the ICD10-site, but also at that specific term.<br />
Can't wait to try it? Download the example-CRF <a href='/tds/CRFExamples/CRFWithICD10Link.zip' target='_blank'>here</a>.</p>


<p>Here's the code that we'll use. We can put it in the <b>RIGHT_ITEM_TEXT</b> of the item with the ICD-term</p>
<pre>
&lt;div id="ICDLink"&gt;&nbsp;&lt;/div&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;// for OC versions before 3.1.4, use jquery-1.3.2.min.js !&lt;/script&gt;
&lt;script&gt;
$.noConflict();
jQuery(document).ready(function($) { 
var fieldWithICDTerm = $("#ICDLink").parent().parent().find("input");
var BaseURL = 'http://apps.who.int/classifications/icd10/browse/2010/en';
var LinkBegin = '&lt;a target="icd" href="';
var LinkEnd = '"&gt;open ICD10&lt;/a&gt;';

function setLink(){
  var ICDTerm = fieldWithICDTerm.val();
  if (ICDTerm){
    $("#ICDLink").html(LinkBegin + BaseURL + '#/' + ICDTerm + LinkEnd);
    }
  else {
    $("#ICDLink").html(LinkBegin + BaseURL + LinkEnd);
 };
};
fieldWithICDTerm.keyup(function(){
  setLink();
  });
setLink();
})
&lt;/script&gt;
</pre>
<p>We start with defining a block or <b>div</b> that will hold the link and call it <b>ICDLink</b>. 
We get to the CRF-item with the ICD-term by going to the parent-of-the-parent of this div and then finding the <b>input</b> and we give this the name 
<b>fieldWithICDTerm</b>. </p>
<p>We now can compose the link and that is done with some variables: to start with these are <b>LinkBegin</b>, followed by the <b>BaseURL</b>
 and then the <b>LinkEnd</b>.
In function <b>setLink()</b> this is written to the div.<br />
And the same function is called every time something is done in the CRF-item. If anything is filled in then the link will begin with 
<b>LinkBegin</b>, followed by the <b>BaseURL</b> plus <b>#/</b> and the actual term and finally <b>LinkEnd</b>.</p>

<h3>and the regular expression?</h3>
<p>For the regular expression we will use <b>regexp: /[A-Z]\d{2}(\.\d)?/</b>. Which more or less means:
start with one uppercase character, followed by exactly two digits and then zero or one times the part between 
parentheses, being a dot and one digit.</p>

<p><img src='/tds/img/ImagesHowTo/icd/icd02.jpg' border='0'  class='photo'/><br />
fig. 2: the regular expression</p>


<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#crfs'>here</a>.</p>
		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
