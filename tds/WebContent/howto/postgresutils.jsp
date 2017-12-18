<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="Postgres utilities for OpenClinica" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: Postgres utilities for OpenClinica</title>
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
			<h1>Postgres utilities</h1>
<p>On this page we have collected some postgres-utilities, or just commands and sql-statements
that we've used ourselves in working with OpenClinica. The topics are:</p>
<ul>
<li>- <a href="#e-mail-list">creating an e-mail-list</a></li>
<li>- <a href="#e-mail-list">a list of all databases</a></li>
<li>- <a href="#table-list">a list of all tables of your OpenClinica database</a></li>
<li>- <a href="#vacuuming">vacuuming your database for better performance</a></li>
<li>- <a href="#reindexing">reindexing your database for better performance</a></li>
<li>- <a href="#locking-accounts">locking accounts</a></li>
<li>- <a href="#when-template1-is-not-UTF8">when template1 is not UTF8</a></li>
<li>- <a href="#pg_hba.conf">and one little thing about pg_hba.conf</a></li>
</ul>

<a name="e-mail-list"></a>
<h1>creating an e-mail-list</h1>
<p>If you want to send out a mailing to all users of your OpenClinica-instance, it is easy if you can get the
mail-addresses from the UserAccounts. In order to get this, start psql and connect to the OpenClincia database<br />
<b>cd /usr/bin<br />
sudo -u postgres ./psql <br />
\c openclinica </b><br />
Now you can issue the select statement and write the result to a file: <br  /> 			
<b>copy (select email||', ' from user_account) to '/tmp/mailaddresses.txt';</b><br />
If you would like to have only the enabled, non-locked accounts filter on status_id: <br />
<b>copy (select email||', ' from user_account where status_id=1) to '/tmp/mailaddresses.txt';</b>
</p>
<p>
<img src='/tds/img/ImagesHowTo/postgres/postgres03.jpg' border='0'  class='photo'/><br />
fig. 1: writing mail-addresses to a file
</p>

<p>If you're working with pgAdmin, the command should be<br /> 
<b>copy (select email||', ' from user_account) to 'c:/temp/mailaddresses.txt';</b></p>

<p>
<img src='/tds/img/ImagesHowTo/postgres/postgres04.jpg' border='0'  class='photo'/><br />
fig. 2: with pgAdmin
</p>

<a name="a-list-of all-databases"></a>			 
			<h1>a list of all databases</h1>
			<p>To list all databases, for example if you want to check your OpenClinica database was created, login with
			 putty to your server and type:<br />
			<b>cd /usr/bin<br />
			sudo -u postgres ./psql -l</b><br />
			Your listing should look something like:</p>
			<p class='comoutput'>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;List of databases <br />
			&nbsp;&nbsp;&nbsp;&nbsp;Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;Owner&nbsp;&nbsp;&nbsp;|&nbsp;Encoding<br />
			-------------+----------+-----------<br />
			&nbsp;openclinica&nbsp;|&nbsp;clinica&nbsp;&nbsp;|&nbsp;UTF8<br />
			&nbsp;postgres&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;postgres&nbsp;| SQL_ASCII<br />
			&nbsp;template0&nbsp;&nbsp;&nbsp;| postgres | SQL_ASCII<br />
			&nbsp;template1&nbsp;&nbsp;&nbsp;| postgres | SQL_ASCII
			
			</p>
			
<a name="table-list"></a>
			<h1>a list of all tables of your OpenClinica database</h1>
			<p>Connect to your server with putty and start a psql session:<br />
			<b>sudo -u postgres ./psql</b><br /> Now connect to the openclinica database: <br />
			<b>\c openclinica</b>. <br />
			The prompt changes to <b>openclinica=#</b>. You can now issue the command <b>\dt</b> and your listing will be something like:		
			</p>
			<p class='comoutput'>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;List&nbsp;of&nbsp;relations<br />
&nbsp;Schema&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;Type&nbsp;&nbsp;|&nbsp;&nbsp;Owner<br />
--------+-------------------------------+-------+---------<br />
&nbsp;public&nbsp;|&nbsp;archived_dataset_file&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;table&nbsp;|&nbsp;clinica<br />
&nbsp;public&nbsp;|&nbsp;audit_event&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;table&nbsp;|&nbsp;clinica<br />
&nbsp;public&nbsp;|&nbsp;audit_event_context&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;table&nbsp;|&nbsp;clinica<br />
&nbsp;public&nbsp;|&nbsp;audit_event_values&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;table&nbsp;|&nbsp;clinica<br />
&nbsp;public&nbsp;|&nbsp;audit_log_event&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;table&nbsp;|&nbsp;clinica<br />
&nbsp;public&nbsp;|&nbsp;audit_log_event_type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;table&nbsp;|&nbsp;clinica<br />
&nbsp;public&nbsp;|&nbsp;audit_user_login&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;table&nbsp;|&nbsp;clinica
			
			</p>

<a name="vacuuming"></a>
			<h1>vacuuming your database for better performance</h1>
			<p>Connect to your server with putty and start a psql session:<br />
			<b>sudo -u postgres ./psql<br /></b>. Now connect to the openclinica database: <b>\c openclinica</b>. <br />
			The prompt changes to <b>openclinica=#</b>. You can now issue the command <br />
			<b>vacuum verbose analyse;</b><br />
			This will free disk space and improve your queries. The last bit of your ouput will be:
			</p>
			<p class='comoutput'>
INFO:  index "measurement_unit_name_key" now contains 13 row versions in 2 pages <br />
DETAIL:  0 index row versions were removed. <br />
0 index pages have been deleted, 0 are currently reusable. <br />
CPU 0.00s/0.00u sec elapsed 0.00 sec. <br />
INFO:  "measurement_unit": found 0 removable, 13 nonremovable row versions in 1 pages <br />
DETAIL:  0 dead row versions cannot be removed yet. <br />
There were 0 unused item pointers. <br />
1 pages contain useful free space. <br />
0 pages are entirely empty. <br />
CPU 0.00s/0.00u sec elapsed 0.00 sec. <br />
INFO:  analyzing "public.measurement_unit" <br />
INFO:  "measurement_unit": scanned 1 of 1 pages, containing 13 live rows and 0 dead rows; 13 rows in sample, 13 estimated total rows <br />
INFO:  free space map contains 213 pages in 213 relations <br />
DETAIL:  A total of 3456 page slots are in use (including overhead). <br />
3456 page slots are required to track all free space. <br />
Current limits are:  153600 page slots, 1000 relations, using 965 kB. <br />
VACUUM
			
			</p>
			
<a name="reindexing"></a>			
			<h1>reindexing your database for better performance</h1>
			<p>A more drastic measure to improve performance is reindexing your database. Before you do this, make a backup 
			(you can find a page about this <a href='/tds/howto/backuprestore.jsp'>here</a>).</p>
			<p>Again, you must login to the server on which your postgres is running and start a psql-session.<br />
			<b>sudo -u postgres ./psql</b><br /> and then connect to the openclinica database: <br />
			<b>\c openclinica</b>. <br />
			Now you can issue the command to rebuild the indexes:<br />
			<b>reindex database openclinica;</b><br />
			And quit psql with <b>\q</b>.
			
			</p>
			<h1>what if I want to use pgAdmin?</h1>
			<p>You're lucky if you can use pgAdmin, because it's even easier. Choose your database and right-click on it.</p>

<p>
<img src='/tds/img/ImagesHowTo/postgres/postgres01.jpg' border='0'  class='photo'/><br />
fig. 3: pgAdmin
</p>
<p>Choose option "Maintenance" and there you have in one window both vacuum and reindex. Choose "FULL" if you can lock your database,
and not when other users are accessing it. With option "ANALYZE" postgres uses new data to optimise query-execution-plans.</p>
		
<p>
<img src='/tds/img/ImagesHowTo/postgres/postgres02.jpg' border='0'  class='photo'/><br />
fig. 4: Vacuum and Reindex
</p>

<a name="locking-accounts"></a>	
<h1>locking accounts</h1>
<p>You may want to lock accounts automatically if users have not logged in for 100 days. To do this you can use the following script:</p>
<p class='comoutput'>
\c openclinica<br />
select 'the following accounts will be set to Locked: ' as title ;<br />
SELECT user_id, user_name, first_name, last_name, status_id, account_non_locked, date_lastvisit<br />
FROM user_account <br />
WHERE date_lastvisit &lt; current_date - 100 and status_id=1<br />
ORDER by date_lastvisit;<br />
<br />

Update user_account set status_id=6, account_non_locked=false WHERE <br />
  date_lastvisit &lt; current_date - 100 and status_id=1;<br />
  <br />
  
select 'the following accounts are still unlocked: ' as title ;<br />
SELECT user_id, user_name, first_name, last_name, status_id, account_non_locked, date_lastvisit<br />
FROM user_account <br />
WHERE date_lastvisit &lt; current_date - 100 and status_id=1<br />
ORDER by date_lastvisit;<br />
select 'end of script' as title ;</p>
<p>If you save this script you can schedule it as a cron-job. </p>

<a name="when-template1-is-not-UTF8"></a>	
<h1>when template1 is not UTF8</h1>
<p>On rare occassions you may receive an error message when creating your openclinica database, stating you should 
<b>Change Default Encoding of New Databases To UTF-8</b></p>

<p class='comoutput'>
UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'template1';<br />
DROP DATABASE template1;<br />
CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8';<br />
UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'template1';<br />
\c template1<br />
VACUUM FREEZE;<br />
\c postgres<br />
</p>

<a name="pg_hba.conf"></a>
<h1>and one little thing about pg_hba.conf</h1>
<p>On some Debian-distro's postgresql is set up in such a way that a user can only access
databases that have the same name as their OS-name. So user <b>clinica</b> is not allowed
to connect to database <b>openclinica</b>. To correct this go to <b>pg_hba.conf</b> and edit the line</p>
<p class='comoutput'>
#&nbsp;TYPE&nbsp;&nbsp;DATABASE&nbsp;&nbsp;&nbsp;&nbsp;USER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CIDR-ADDRESS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;METHOD
#&nbsp;"local"&nbsp;is&nbsp;for&nbsp;Unix&nbsp;domain&nbsp;socket&nbsp;connections&nbsp;only
local&nbsp;&nbsp;&nbsp;all&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;all&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ident
</p>
<p>to:</p>
<p class='comoutput'>
local&nbsp;&nbsp;&nbsp;all&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;all&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;password
</p>

<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#other'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed November 2013</p>


</div>	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
