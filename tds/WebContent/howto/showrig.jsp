<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="TDS: rules for items in a repeating_item_group" /> 
<meta name="keywords" content="openclinica 3.1 training conditional display status open source software clinical trials datamanagement 
non-profit academic edc insert action repeating items " /> 

<title>Trial Data Solutions: rule to show a group with repeating items</title>
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
<h3>a rule to show a group</h3>
<p>In this short page we will discuss a very common situation. Consider the following CRF in which medication is recorded.
First of all the so-called <b>indicator question</b> is asked <b>Was any medication used in the previous 12 months?</b> </p>
<p>
<img src='/tds/img/ImagesHowTo/rigrule/im01.jpg' border='0'  class='photo'/><br />
fig. 1: CRF for medication history
</p>

<p>To minimize dataentry-errors we would like to hide the repeating-items group and only show it, after the first question
has been answered with <b>Yes</b>. This is done by creating a Rule-file with a ShowAction.<br />
Let's take this step by step and the first thing to do is create and upload the CRF.
Click <a href='/tds/CRFExamples/showrig.zip'>here</a> for the CRF plus the XML-file. <br />
As you can see in the tab <b>Groups</b> we defined the
Group_Display_Status as <b>HIDE</b> in column F.</p>

<p>
<img src='/tds/img/ImagesHowTo/rigrule/im02.jpg' border='0'  class='photo'/><br />
fig. 2: the group is not shown by default
</p>

<p>When we open this CRF for dataentry, only the indicator question is shown.</p>

<h3>composing the rule-file</h3>

<p>What we need to do next is create a Rule file that will show the Group Medication when the answer to the indicator question
is Yes. And to do this we need the OIDs of all the objects concerned. Take a look at 
<a href="http://www.trialdatasolutions.com/tds/howto/findingoids.jsp" target="_blank">this page</a> for instructions on how to get them.
For reference it is nice to have these OIDs in the header of our Rule file, so after some searching this should look like this:</p>
<p>
<img src='/tds/img/ImagesHowTo/rigrule/im03.jpg' border='0'  class='photo'/><br />
fig. 3: the OIDs
</p>
<p>In this documentation part of the Rule-file, we see the OID for the Event and the CRF. Then we have two OIDs for ItemGroups:
one for the ItemGroup to which the indicator-question belongs and one for the ItemGroup we want to show.</p>


<p>Now we are ready to write our expression and that will be <b>I_TDSSH_MEDUSED eq 1</b>, because Yes was coded as 1.
As you can see, the Expression is part of the so-called RuleDef, short for RuleDefinition. 
We give our RuleDef an OID, so we can later refer to it. You can use anything for this RuleDef-OID, but it must be unique for your Study. 
You might be tempted to call this rule <b>Rule1</b> or something like that, but be careful with such OIDs: it's easy to forget you 
already had a Rule23 three weeks ago, so instead of creating a new Rule, you are overwriting an existing one. An easy trick to 
avoid this is using something unique, like the ItemOID of the target of your RuleAssignment. Now because all OIDs in OpenClinica
have a prefix that indicates the type of object, we start our RuleOID with <b>R_</b>, followed by the ItemOID. 
And to avoid further confusion when we need more than one Rule associated with the same Target, we add a counter to the RuleOID.
This sums up to <b>R_I_TDSSH_MEDUSED_1</b> in our example.
Finish this part with a short name in the list of Rules and a long description to explain the why and how of this ShowAction.</p>
<p>
<img src='/tds/img/ImagesHowTo/rigrule/im04.jpg' border='0'  class='photo'/><br />
fig. 4: the RuleDef with the expression
</p>

<h3>some action please</h3>
<p>So now we have the expression right: if the answer to "was any medication used in the previous 12 months" is "Yes", then we 
want a <b>ShowAction</b>. First of all we have the target, in this case R_I_TDSSH_MEDUSED_1: whenever this Item is changed, the associated 
expressions will be evaluated. Another way of saying this "this target refers to the following RuleDefs", or in XML
<b>&lt;RuleRef OID="R_I_TDSSH_MEDUSED_1"&gt;</b><br />
And what should be the result of the evaluation of the expression of the RuleDef? 
We want a ShowAction, but only if the expression evaluates to true: <br />
<b>&lt;ShowAction IfExpressionEvaluates="true"&gt;</b><br />
Of course we must say what we want to show, or: what the DestinationProperty of our ShowAction is.<br />
(Excuse us: <b>DestinationProperty</b>? Where did that come from? Wouldn't <b>Target</b> be more appropriate?
Maybe, but that term is already in use.)<br />
In our case the DestinationProperty of the ShowAction is the ItemGroup with OID <b>IG_TDSSH_MEDICATION</b> 
and our RuleAssignmentnow looks like this:</p>
<p>
<img src='/tds/img/ImagesHowTo/rigrule/im05.jpg' border='0'  class='photo'/><br />
fig. 5: the RuleAssignment
</p>
<h3>and it looks like ...?</h3>
<p>The result is quite good: you start with:</p>
<p>
<img src='/tds/img/ImagesHowTo/rigrule/im06.jpg' border='0'  class='photo'/><br />
fig. 6: what is your answer?
</p>
<p>And then when you've clicked Save you get:</p>
<p>
<img src='/tds/img/ImagesHowTo/rigrule/im07.jpg' border='0'  class='photo'/><br />
fig. 7: the result of the ShowAction
</p>
<h3>three more things</h3>
<p>You may have noticed that we did not discuss one line, the one with the <b>Run</b>-tag. What this line does it that it 
defines at which occasions the Action must be performed.<br />
And you will probably wonder if we can use a corresponding HideAction, like we did on <a href="/tds/howto/showhidemulti.jsp">this page</a>.
Unfortunately the answer is: not yet. You can only Show hidden Groups, but you can not Hide shown Groups.<br />
And you may think "mmm, we defined the GROUP_REPEAT_NUMBER as 5, but I only see 1 row" and yes, you are right: this is 
a bug.</p>



<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#rules'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed August 2014</p>
		</div>
	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
