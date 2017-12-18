<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: deselecting a radio button" /> 
<meta name="keywords" content="openclinica 3.1 training  open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>TrialDataSolutions: deselecting a radio button</title>
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

<h3>two manuals</h3>
      
<p>So you designed your CRFs and you wrote your Validations and you're ready to start enrolling, but ...
you must instruct your users! The least they expect is a manual telling them how to login, how to add Subject, create Discrepancies, etc..
And that's just the investigators: the monitors need instructions on how to SDV, follow up Discrepancies, etc.<br />
Don't despair, we have two manuals for you: one for 
<a href='/tds/CRFExamples/InvestigatorManual_20150413.pdf' target='_blank'>investigators</a>
 and one for <a href='/tds/CRFExamples/MonitorManual_20150413.pdf' target='_blank'>monitors</a>.</p>
 <p>They are lean and mean and surely you will want to write another version, tailored to your particular situation, 
 but this could be a starting point. (And if you don't have time to write them yourself, why not ask us?)</p>


<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#crfs'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed April 2015</p>
    </div>

  </div> <!-- /.main -->
  
<%@ include file="/includes/footerhowto.jsp" %>
  <hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
