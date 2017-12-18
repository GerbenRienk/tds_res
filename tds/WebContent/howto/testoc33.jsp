<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: a quick setup for testing OpenClinica 3.2.0" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: a quick way to test OpenClinica 3.2.0</title>
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
			<h3>a quick way to test OpenClinica 3.3</h3>
			
<p>For those of us who want to test release 3.3 before installing it, here is a quick way to do just that.<br />
What we'll do is:</p>
<ol>
<li>rename the war to oc33.war</li>
<li>let tomcat deploy it</li>
<li>create a new, empty database oc33</li>
<li>make a backup of our existing 3.1.2, 3.1.3, 3.1.4 or 3.2 database</li>
<li>restore that as oc33</li>
<li>copy the directory openclinica.data</li>

<li>modify datainfo.properties</li>
<li>start oc33</li>
</ol>

<h3>start with the war</h3>
<p>Start with downloading the zip with the war and then unzip it and rename the war to <b>oc33.war</b>. 
Once you've done that, copy the war to 
<b>tomcat/webapps</b>. Tomcat will start deploying it, but it will not be able to start it, 
because there is no corresponding database.
If tomcat does not deploy the war automatically, check with <b>ls -al</b> if tomcat is the owner and if not, 
issue <b>chown tomcat:tomcat oc33.war</b>
</p>


<h3>copying the database</h3>
<p>We assume that you will want a copy of your existing database and the way to do that is making a new, 
empty database. 
Then making a dump of your production database and restoring that to the new one. 
</p>
<p class='comoutput'>
sudo -u postgres /usr/bin/psql<br />
create database oc33 with encoding='UTF-8' owner=clinica;<br />
\l<br />
\q<br />
<br />
sudo -u postgres /usr/bin/pg_dump openclinica &gt; pg_dump_openclinica_20140624<br />
sudo -u postgres /usr/bin/psql oc33 &lt; pg_dump_openclinica_20140624<br />
</p>
<p>(The <b>\l</b> is to check if the creation of the database was successful and the <b>\q</b> to quit psql.)</p>
<h3>don't forget the data</h3>
<p>Now before we start we must copy the data-directories and we do that with:</p>
<p class='comoutput'>
cd /usr/local/tomcat<br />
sudo -u tomcat cp -r openclinica.data oc33.data
</p>

<h3>datainfo.properties anyone?</h3>
<p>If you like you can go through datainfo.properties, to edit it to your favorite settings. But the defaults work.</p>

<h3>start oc33</h3>
<p>As a last step, go to tomcat's manager/html and start oc33.</p>

<h3>what to look for?</h3>
<p>On <a href='https://docs.openclinica.com/release-notes/openclinica-3.3' target='_blank'>
https://docs.openclinica.com/release-notes/openclinica-3.3</a> you can find a summary of what's new in this release.</p>
<p>The new <b>EventAction</b> is something many users looked forward to, because it gives you the option
to schedule Events automatically. Another thing is the use of tokens, 
mainly to create links to other systems in an easy way.</p>
<p>If you can life without that, you might as well stick to version 3.2</p>


<h3>one last thing</h3>
<p>After you've evaluated version 3.3 and decided that indeed you want to upgrade, make a backup first! 
Do it for example as described <a href='/tds/howto/backuprestore.jsp'>here</a> and when you've done that,
 store the files on another server and a tape and burn them on CD. Well, you get the picture. </p>

<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#other'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed June 2014</p>

</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
