<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="Backup and restore of OpenClinica" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc free gratis database medisch onderzoek ecrf Backup and restore" /> 

<title>Trial Data Solutions: backup and restore of OpenClinica</title>
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
			<h3>Backup and restore of OpenClinica</h3>
			<p>Backing up your OpenClinca setup is a must. And not only that: you must practice restoring your backup. 
			You know why, so do it.<br />
			Having said these grave warnings: backing up your OpenClinica is simple! There are only two things to backup: your database
			and your study-files.</p>
			
			<h3>Backup of the database</h3>
			<p>Postgres comes with a number of commandline utilities and one of them is <b>pg_dump</b>. This utility makes 
			a (huge) text-file  with commands to recreate your openclinica database, plus inserts into all the tables.</p>
			<p>Let's say you your database is called "openclinica" and you are making your backup on 14 Juli 2010. 
			First you login to your server and then you type:</p>
			<p class='comoutput'>sudo -u postgres /usr/bin/pg_dump openclinica &gt; pg_dump_openclinica_20100714</p>
			<p>The syntax is straightforward: pg_dump, followed by the name of the database and then the name of the dumpfile. 
			Make the name of this file as descriptive as possible, so do not use just "OC" or "backup", and always add a date to it.
			As a last step you must take your dump-file of the server and store it somewhere safe. 
			And I repeat: do not leave it on your server!</p>
			
			<h3>Backup of the studyfiles</h3>
			<p>All your CRF's in XL-format, plus XML-rules files, plus CRF-attached files and 
			also your generated datasets and Metadata-sets are stored in the directory <b>openclinica.data</b>.  
			This directory is located in /usr/local/tomcat/. For a complete backup of OpenClinica you can put all these files in a tar
			and then take that to a safe location anywhere, but not on the same server.<br /> You can do this in one line with:</p>
			<p class='comoutput'>tar -cvvf oc_data_20100714.tar /usr/local/tomcat/openclinica.data</p>
			<p>To take things one step further, include your datainfo.properties. Usually the information in this file does not 
			change much after the installation of OpenClinica. But in case of a crash, it will save you a lot of time if you 
			have settings like ports and mail-configuration, so type:</p>
			<p class='comoutput'>tar -rf oc_data_20100714.tar /usr/local/tomcat/webapps/OpenClinica/WEB-INF/classes/datainfo.properties</p>
			
			<h3>Restore of the database</h3>
			<p>To restore the database you will have to delete the existing openclinica database, recreate it and "run" the dump-file:</p>
			<p class='comoutput'>/usr/bin/psql<br />
			drop database openclinica <br />
			create database openclinica with encoding='UTF-8' owner=clinica;</p>
			<p>Then exit psql (\q) and go to the directory where your dumpfile is located and type (as user postgres):</p>
			<p class='comoutput'>/usr/bin/psql openclinica &lt; pg_dump_openclinica_20100714</p>
			<p>This will restore your database.
			</p>
<h3>a script, maybe?</h3>
<p>The above is all very fine, but most of us want a script that we can use in <b>crontab</b>. Of course we can combine the above lines in a script
but let's go a step further. We make a directory structure where we can put all the backup-files per month.<br />
It's difficult to give a "one-size-fits-all" solution, but you can use this script as a starting point:</p>
<p class='comoutput'>
#!/bin/sh<br />
# use date as extension and find the year and month for the folders<br />
date_ext=$(date +%Y%m%d)<br />
yearmonth=$(date +%Y%m)<br />
<br />
# create the folders, if they do not exist already<br />
cd /home/gerben/bu_files<br />
mkdir $yearmonth<br />
cd $yearmonth<br />
<br />
# start with making a dump of the database<br />
sudo -u postgres /usr/bin/pg_dump openclinica &gt; pg_dump_openclinica_$date_ext<br />
<br />
# put all Study files in one big tar<br />
tar -cf openclinica_$date_ext.tar /usr/local/tomcat/openclinica.data<br />
# add datainfo.properties<br />
tar -rf openclinica_$date_ext.tar /usr/local/tomcat/webapps/OpenClinica/WEB-INF/classes/datainfo.properties<br />
# add the database dump file<br />
tar -rf openclinica_$date_ext.tar pg_dump_openclinica_$date_ext<br />
# zip it all<br />
gzip -9 -f openclinica_$date_ext.tar<br />
# remove the original dump file<br />
rm -f pg_dump_openclinica_$date_ext<br />
<br />
# do the same for the tomcat logs<br />
tar -cf tomcat_logs_$date_ext.tar /usr/local/tomcat/logs<br />
gzip -9f tomcat_logs_$date_ext.tar<br />

</p>
<h3>restoring from linux to windows</h3>
<p>You may want to restore a dump-file that was created on Linux to a Windows-machine with pgAdmin.
Unfortunately this can not be done using the graphical interface, but must be done using a prompt.</p>	

<p class='comoutput'>
cd C:\Program Files (x86)\PostgreSQL\8.4\bin <br />
psql -U postgres openclinica &lt; c:\oc\diversen\pg_backups\pg_dump_openclinica_20150801
</p>					

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
