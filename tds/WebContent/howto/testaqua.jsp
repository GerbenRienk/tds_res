<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: a quick setup for testing OpenClinica's Aquamarine" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: a quick setup for Aquamarine</title>
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
			<h3>a quick setup for OpenClinica's Aquamarine</h3>
			
<p>As we write this page, the current release of OpenClinica is 3.1.2 and 3.1.3 is in the making, as can be followed on the
<a target='_blank' href='https://issuetracker.openclinica.com/roadmap_page.php?version_id=58'>roadmap</a>. 
But at the same time there is already talk of 
Aquamarine, OC's Next Generation so to speak. Look at the two screen-shots: configurable user-privileges and
coding using MedRA: exiting stuff. If you're into datamanagement.</p>
	<p><img src='/tds/img/ImagesHowTo/testaqua/ta05.jpg' border='0'  class='photo'/><br />
	fig. 1: configurable user-privileges</p>


	<p><img src='/tds/img/ImagesHowTo/testaqua/ta06.jpg' border='0'  class='photo'/><br />
	fig. 2: MedRA coding</p>

<p>For those of you who want to have a look at it, here's how to do it in less than 15 minutes.<br />
The idea is that you first duplicate your database under another name, then unpack the Aquamarine-war and point it to the new database.<br />
Although these steps are safe, do yourself a favor and execute them on your test/development-server and not on your production-server!</p>
<h3>copying the database</h3>
<p>For those that use pgAdmin: right-click on the database you want to copy and choose <b>Backup ...</b> and in the new screen
choose a name for your backup file. Click OK and the backup should end with <b>Process returned exit code 0.</b> Click <b>Done</b>.</p>

	<p><img src='/tds/img/ImagesHowTo/testaqua/ta01.jpg' border='0'  class='photo'/><br />
	fig. 3: backup database</p>


	<p><img src='/tds/img/ImagesHowTo/testaqua/ta02.jpg' border='0'  class='photo'/><br />
	fig. 4: backup database messages</p>

<p>Now right-click on <b>Databases</b> and choose <b>New Database ...</b> and in the new screen fill in a name, for example <b>oc_aqua</b>
 for the database and choose user <b>clinica</b> as the owner. Check if <b>Encoding</b> is set to UTF-8 and you're good to go.</p>

	<p><img src='/tds/img/ImagesHowTo/testaqua/ta03.jpg' border='0'  class='photo'/><br />
	fig. 5: create empty database</p>

<p>Right-click on the newly created database and choose <b>Restore ...</b> and choose in the new screen the backup-file you just created.<br />
Click <b>OK</b> and wait for the restore to finish. This will probably end with <b>WARNING: errors ignored on restore: 1; 
Process returned exit code 1.</b> and if you scroll to the start of the messages, you will hopefully see 
<b>ERROR:  language "plpgsql" already exists</b> which was to be expected and can be safely ignored.</p>
<h3>and now: war</h3>
<p>
Next thing to do is downloading the zip with Aquamarine and when you've done that, open the zip and browse to folder <b>distribution</b>
and copy the file <b>OpenClinica-web.war</b>. Paste this file in any folder, but not in the webapps folder of Tomcat and after putting it there,
rename it to whatever you want, for example the name you gave the database, <b>oc_aqua.war</b>. 
Now copy the renamed war to the tomcat-webapps folder. Tomcat will unpack it and try to deploy it, 
but after a couple of minutes the app will stop. </p>

<p>Open \webapps\oc_aqua\WEB-INF\classes\datainfo.properties in your editor of choice and make the following changes:<br />
- under <b>1 - Database Configuration</b> change the entry for <b>db</b> to match the new database: <b>db=oc_aqua</b><br />
- under <b>8 - sysURL</b> change <b>sysURL</b> to match your configuration: <b>sysURL=http://localhost:8080/${WEBAPP}/MainMenu</b><br />
- under <b>11 - Logging configuration</b> change <b>log.dir</b> to match your configuration: <b>log.dir=c:\\tomcat\\logs\\oc_aqua</b><br />
</p>
<p>Before you close your editor and start the application, open \webapps\oc_aqua\WEB-INF\web.xml and change 
<b>&lt;display-name&gt;OpenClinica 3.0&lt;/display-name&gt;</b> into something more sensible, like <b>
OC Aquamarine</b>.</p>

<h3>at last!</h3>
<p>Now open Tomcat's manager, in my case <b>http://localhost:8080/manager/html</b> and we can start <b>oc_aqua</b>.</p>

	<p><img src='/tds/img/ImagesHowTo/testaqua/ta04.jpg' border='0'  class='photo'/><br />
	fig. 6: Aquamarine in action</p>


<p>Log in and have a look at <b>Coding Review</b> and, under Users, <b>View User Permissions</b> 
and you will get an idea of where OpenClinica is going.</p>



</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
