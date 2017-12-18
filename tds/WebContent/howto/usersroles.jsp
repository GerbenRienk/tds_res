<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="A practical approach to users and roles" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: A practical introduction to users, types and roles</title>
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
			
			<h3>A practical introduction to users, types and roles</h3>
			<p>Working with Users, Types and Roles in OpenClinica can be a bit confusing. Of course there's the overview at<br /> 
			<a href='https://docs.openclinica.com/3.1/manage-users' target='_blank'>
			https://docs.openclinica.com/3.1/manage-users</a> with the 
			<a href='https://docs.openclinica.com/sites/fileuploads/akaza/cms-docs/user-matrix.html'target='_blank'>huge matrix</a><br /> and I strongly recommend reading this.
			</p>
			<p>Basically the idea is that you can assign permissions on three levels:</p>
			<ul>
			<li>- OpenClinica-application-level</li>
			<li>- Study-level</li>
			<li>- Site-level</li>
			</ul>
			<h3>OpenClinica-application-level</h3>
			<p>At this level the privileges are called "User Type". 
			You assign a User Type to a user on application-level when you create the user. The differences between the types are mainly
			concerning the right to manage other users-accounts<br />
			Leading question: <b>do I want to give this user any rights to manage other user-accounts?</b> 
			If the answer is "no", then choose as User Type "user". You can assign this user to Studies or Sites.<br />
			If you want this new user to be able to manage other user-accounts, the next question will be:
			<b>do I want to give this user any rights to manage other user-accounts, but not my own user-account?</b> 
			If the answer is "yes", then choose as User Type ""business administrator"<br />
			The third User Type is "technical administrator" and this is the highest level. Give this User Type only to users whom you trust
			not to change your root-account.
			</p>
			<p><b>Bottomline: choose "user" as User Type to be on the safe side.</b></p>
			
			<h3>Now what about Roles?</h3>
			<p>You are now at the point where things get complicated. As part of creating a user-account you are asked for a default study
			and for a role in this study. Should you make the user Data Manager or Study Coordinator?
			And is Monitor the same as Monitor (site)? Who is going to sign? It seems there's a lot of overlap. And that is precisely
			what makes it so complex: there are several ways to assign the different functions.</p>
			<p>It helps to think about this in two different situations: </p>
			<ul>
			<li>1. Study in design</li>
			<li>2. Study available</li>
			</ul>
			<h3>Situation 1: Study in design</h3>
			<p>In this situation it is easiest to make the users who are working on the study, i.e. designing Events, CRFs and writing Rules,
			"Data Manager". This is done on Study-level. That will cover 90% of your needs in this phase of the study. And yes, there are four 
			more roles to choose from with all sorts of differences and it is definitely worth it to dive into that, 
			but if you're in a hurry: </p>
			<p><b>make those who work on a Study "Data Manager".</b></p>
			
			<h3>Situation 2: Study available</h3>
			<p>So everything is in place for your study, CRF's, Rules, Sites, the works. You set the study status to available: 
			data-entry can start as of now. The only thing to do is assign users to the different tasks.</p>
			<p>One way to do this, and this is the way I recommend, is by assigning the functions on <b>Site-level</b>. 
			This may seem odd, but it makes managing the study so much easier. Your choices are now limited to three.</p> 
			<ul>
			<li>1. Clinical Research Coordinator</li>
			<li>2. Monitor (site)</li>
			<li>3. Investigator</li>
			</ul>
			<p>Now how clean is that? The Clinical Research Coordinator (1) adds subjects, does data-entry and solves discrepancies. 
			And nothing more. (He/she can also import data, although this is not shown on the wiki-page.)<br />
			The Monitor (2) handles discrepancies and does Source Data Verification and works with extract data-sets.<br />
			The Investigator (3) can do all of the above, plus sign the CRFs.</p>

<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#conducting'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed January 2015</p>

		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
