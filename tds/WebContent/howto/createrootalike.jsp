<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: how to create a root-alike" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc free gratis database medisch onderzoek ecrf root alike" /> 

<title>Trial Data Solutions: how to create a root-alike for OpenClinica</title>
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
			<h3>Why create a root-alike?</h3>
			
			<p>First of all: why would you want to have a technical administrator? You already have "root": isn't that enough? 
			This depends on several things. You may may have configured the "Lockout configuration". (And if you you haven't, you should do so now.) 
			This sets a maximum number of unsuccessful login-attempts to for example 5. After 5 failed attempts the account is locked, 
			which is a perfect safety measure. If an account is locked, a message appears on the login-form, telling the user to contact the administrator.
			But what if a malicious person tries to login as root and thereby locks the root account? Then you need a root-alike.</p>
			
			<h3>How to create a root-alike</h3>
			<p>Login to OpenClinica as Study Director and click on "Tasks". Choose from the list that appears "Users", 
			under header "Administration" (fig. 1).</p>
			<p>
			<img src='/tds/img/ImagesHowTo/TaskMenuUsers.jpg' class='photo'/><br />
			fig. 1: Task menu: Users
			</p>
			
			
			<p>A new screen opens "Administer Users" with the list of all users. In the top is a link "Create New User"(fig. 2) 
			and if you click this, a new form opens where you can create your root-alike (fig. 3).</p>
			<p>
			<img src='/tds/img/ImagesHowTo/CreateNewUser.jpg' class='photo'/><br />
			fig. 2: Create new user
			</p>
			<p>
			<img src='/tds/img/ImagesHowTo/CreateNewRoot2.jpg' class='photo'/><br />
			fig. 3: Create root2
			</p>
			
			
			<p>Give this root-alike any name you like, assign any active study to it, with any role. 
			The important thing is to set the field "User Type:" to "technical administrator". 
			Click the submit button and you're done.</p>
			
			<h3>How to set the Lockout Configuration</h3>
			<p>To set the Lockout Configuration, follow the steps above to open the screen titled "Administer Users". 
			Click on the link "Lockout Configuration". In the form that opens, set the appropriate number of attempts, and set 
			Lockout Enabled to True (fig. 4).</p>
			<p>
			<img src='/tds/img/ImagesHowTo/LockoutConfiguration.jpg' class='photo'/><br />
			fig. 4: Lockout Configuration
			</p>
			
			
			<h3>Worst case scenario</h3>
			<p>OK, so some malicious person looked over your shoulder and saw that your account-name was "root".
			And he or she tried to login 3 + 1 times and thereby locked the account! 
			When you try to login you get the friendly message saying your account was locked. Don't panic: all you have
			to do is log in as "root2", open the "Administer Users" screen and find the root-account. You'll see a red "Locked"-icon.
			Just click on it you're in business again (fig. 5).</p>
			<p>
			<img src='/tds/img/ImagesHowTo/LockedRoot.jpg' class='photo'/><br />
			fig. 5: root locked out
			</p>
			
		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
