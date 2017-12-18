<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="Setting up a test-environment for OpenClinica in less than 30 minutes" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: setting up a test-environment for OpenClinica</title>
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
<h1>setting up a test-environment</h1>
<p>Every once in a while you need to test something for OpenClinica and you don't want to clutter your production database,
so you decide you need a test-environment. Here is how to do that, plus instructions how to clean up after your testing.</p>
<p>It takes four steps to create your test-environment:</p>
<ol>
	<li>make a backup of the production database</li>
	<li>create a new database and restore the production database</li>
	<li>make a copy of the application and the data directory</li>
	<li>edit datainfo.properties</li>
</ol>

<h1>make a backup of the production database</h1>
<p>Let's say our production instance is called <b>OpenClinica</b> and we want to create an instance called <b>octest</b>. First we make a
directory to store the postgres-dump.</p>
<p class='comoutput'>cd $HOME<br />
mkdir octest<br />
cd $HOME/octest<br />
pg_dump -U postgres openclinica &gt; pgd_openclinica_20131109
</p>
<h1>create a new database and restore the production database</h1>
<p>We create the new database with psql:</p>
<p class='comoutput'>
psql -U postgres<br />
CREATE DATABASE  octest WITH ENCODING='UTF8' OWNER=clinica;</p>
<p>Check if the database was created correctly with "\list" (or just "\l" will do) and quit psql with "\q". 
Now restore the production database to this new one:</p>
<p class='comoutput'>psql -U postgres octest &lt; pgd_openclinica_20131109</p>

<h1>make a copy of the application and the data directory</h1>
<p>Now we stop both tomcat:</p>
<p class='comoutput'>/etc/init.d/tomcat stop</p>

<p>And we make a copy of the war and of the data-directory:</p>
<p class='comoutput'>cd /opt/tomcat/webapps/ <br />
cp OpenClinica.war ./octest.war <br />
cd .. <br />
cp -R /opt/tomcat/openclinica.data ./octest.data <br />
chown -R tomcat:tomcat octest.data 
</p>

<h1>edit datainfo.properties</h1>
<p>Now we will start tomcat, so the new <b>octest.war</b> can be deployed.
But we do not start postgresql yet, because we want to edit <b>datainfo.properties</b>.</p>
<p class='comoutput'>/etc/init.d/tomcat start</p>
<p>Then after a few minutes we see the directory structure of octest and then we copy the 
datainfo.properties of OpenClincia and edit it. </p>
<p>For OpenClinica before 3.4 the location of the file is <b>/opt/tomcat/webapps/octest/WEB-INF/classes</b>, but since 3.4 it 
is:  </p>
<p class='comoutput'>cd /opt/tomcat/octest.config<br />
cp /opt/tomcat/openclinica.config/datainfo.properties ./ <br />
vi datainfo.properties
</p>
<p>The editing only concerns the database name and if your original datainfo.properties refers to 
<b>db=&#36;{WEBAPP.lower}</b> you're good to go. If not, change this line to <b>db=octest</b>.</p>
<p>Now we can start tomcat again and start both applications with the tomcat-manager.</p>

<h1>cleaning up</h1>
<p>After testing you should clean up the database and the app and you do this by:</p>
<ol>
<li>undeploying in tomcat-manager the application octest</li>
<li>stopping tomcat: "/etc/init.d/tomcat stop"</li>
<li>removing the data-directory: "rm -rf /opt/tomcat/octest.data"</li>
<li>removing the config-directory: "rm -rf /opt/tomcat/octest.config"</li>
<li>starting psql and removing the database: "drop database octest;"</li>
</ol>
			

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
