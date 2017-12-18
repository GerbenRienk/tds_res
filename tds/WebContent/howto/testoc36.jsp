<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: a quick setup for testing OpenClinica 3.4" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: a quick way to test OpenClinica 3.6</title>
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
			<h3>a quick way to test OpenClinica 3.6</h3>
			
<p>For those of us who want to test release 3.6 before installing it, here is a quick way to do just that.<br />
What we'll do is:</p>
<ol>
<li>download the war and rename it to oc36.war</li>
<li>let tomcat deploy it</li>
<li>create a new, empty database oc36</li>
<li>make a backup of our existing 3.1.x, 3.2, 3.3, 3.4 or 3.5 database</li>
<li>restore that as oc36</li>
<li>copy the directory openclinica.data</li>

<li>modify datainfo.properties</li>
<li>start oc36</li>
</ol>

<h3>start with the war</h3>
<p>Start with downloading the zip with the war and then unzip it and rename the war to <b>oc36.war</b>. 
Once you've done that, copy the war to 
<b>tomcat/webapps</b>. Tomcat will start deploying it, but it will not be able to start it, 
because there is no corresponding database.
If tomcat does not deploy the war automatically, check with <b>ls -al</b> if tomcat is the owner and if not, 
issue <b>chown tomcat:tomcat oc36.war</b>
</p>


<h3>copying the database</h3>
<p>We assume that you will want a copy of your existing database and the way to do that is making a new, 
empty database. 
Then making a dump of your production database and restoring that to the new one. 
</p>
<p class='comoutput'>
sudo -u postgres /usr/bin/psql<br />
create database oc36 with encoding='UTF-8' owner=clinica;<br />
\l<br />
\q<br />
<br />
sudo -u postgres /usr/bin/pg_dump openclinica &gt; pg_dump_openclinica_2015081<br />
sudo -u postgres /usr/bin/psql oc36 &lt; pg_dump_openclinica_20150801<br />
</p>
<p>(The <b>\l</b> is to check if the creation of the database was successful and the <b>\q</b> to quit psql.)</p>
<h3>don't forget the data</h3>
<p>Now before we start we must copy the data-directories and we do that with:</p>
<p class='comoutput'>
cd /usr/local/tomcat<br />
sudo -u tomcat cp -r openclinica.data oc36.data
</p>

<h3>datainfo.properties anyone?</h3>
<p>If you like you can go through datainfo.properties, to edit it to your favorite settings. But the defaults work.
Be aware that also in this version the location of the datainfo.properties is now <b>oc36.config</b> in the tomcat directory!</p>

<h3>start oc36</h3>
<p>As a last step, go to tomcat's manager/html and start oc36.</p>

<h3>what to look for?</h3>
<p>On <a href='https://docs.openclinica.com/release-notes/release-notes-openclinica-3.6' target='_blank'>
https://docs.openclinica.com/release-notes/release-notes-openclinica-3.6</a> you can find a summary of 
what's new in this release.<br />
We very much like the option to set the status of CRFs after import. But 
also the rest-service to get all data.<br />
Then there are some features added for Participate, but these are for the most of us not available, 
so we will skip them on this site.</p>
<p>Is it worth installing? Depends of course on your situation, but if you are not into importing data into OpenClinica
or getting them out of OpenClinica with REST, you might as well skip this release.</p>

<h3>and how about tomcat?</h3>
<p>Maybe you have been using tomcat6 and now you must upgrade to tomcat7. And maybe you must have both living on the same server:
is that an option? O yes it is. Take a look at <a href='/tds/howto/tomcat6and7.jsp'>tomcat 6 <span class='amp'>&amp;</span> 7</a>
for detailed info. </p>

<h3>one last thing</h3>
<p>After you've evaluated version 3.6 and decided that indeed you want to upgrade, make a backup first! 
Do it for example as described <a href='/tds/howto/backuprestore.jsp'>here</a> and when you've done that,
 store the files on another server and a tape and burn them on CD. Well, you get the picture. </p>

<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#other'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed August 2015</p>

</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
