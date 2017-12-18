<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: a quick setup for OC 3.1 Beta" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: a quick setup for OC 3.1 Beta</title>
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
			<h3>a quick setup for OpenClinica 3.1 Beta</h3>
			
			<p>January 2011 started with the announcement by Akaza that OC 3.1  Beta is ready to download. I'm sure many of you, like myself,
			have already been looking at the Alpha version or have been peeking at the trunk. And you downloaded the zip or tar and
			now you want to have a good look around, before you decide to move to this new release or not. 
			But you don't want to loose your precious test environment with OC 3.0.4.2 or what have you. 
			Well, here's an easy way to setup OC 3.1, next to your existing environment.
			</p>
			<h3>six easy steps</h3>
			<p>1. Start with stopping both Tomcat and Postgres. Put the OpenClinica-web.war in the webapps directory,
			or upload it to your test-server.<br />
			2. Now start Tomcat, but not Postgres. The reason is that Tomcat will unpack the war, but OC can do nothing with the database
			not available. Wait until the famous webapps\OpenClinica-web\WEB-INF\classes\datainfo.properties is in place.<br />
			3. Stop Tomcat again and open datainfo.properties for editing. <br />
			4. Change the line <b>db=openclinica</b> into <b>db=openclinica31</b>.<br />
			If you're running Windows, also change: <br />
			- <b>filePath=$catalina.home/${WEBAPP.lower}.data/</b> into <b>filePath=c:\\Tomcat\\openclinica-web.data</b> 
			and create this directory<br />
			- change <b>log.dir=/usr/local/tomcat/logs/openclinica</b> into <b>log.dir=c:\\Tomcat\\logs\\openclinica-web</b><br />
			- uncomment <b>supportURL=http://www.openclinica.org/OpenClinica/3.0/support/</b><br />
			5. Start Postgres, but not Tomcat and create a database called <b>openclinica31</b>, (UTF-8) with owner clinica.<br />
			6. Now start Tomcat and you're in bussiness!
			
			</p>
			<p>You'll probably want to Stop the other OpenClinica. Or you'll go online to order some more memory, because
			this Beta needs a lot!</p>
		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
