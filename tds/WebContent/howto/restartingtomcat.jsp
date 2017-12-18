<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: restarting Tomcat" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: restarting Tomcat for OpenClinica</title>
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
			<h3>Restarting Tomcat</h3>
			<p>Although Tomcat does it's job very well in most circumstances, it sometimes "gets stuck". 
			This may happen when for example you're making changes to your webapps, starting and stopping a lot
			and in general use a lot of CPU.<br />
			You should always try first to stop the Tomcat-service using the daemon. Login to your server and issue the commands:</p>
			<p class='comoutput'>cd /etc/init.d<br />
			sudo ./tomcat stop</p>
			<p>To check if this was succesfull, list the processes:</p>
			<p class='comoutput'>ps -ef</p>
			<p>You should see no processes owned by user tomcat. But sometimes processes remain active, for example if a database action needs 
			to be finished. (And then you see processes owned by user progres, with postgres-user clinica on database openclinica.) <br />
			Your reaction may be to stop tomcat again, but if you issue the command, you get "Tomcat already stopped". 
			In that case you have to kill the process. And not only the tomcat-process, but also all linked processes. 
			To do this you must use the proces-id and you can find this with </p>
			<p class='comoutput'>ps -ef</p>
			<p>or, if you have many processes, with</p>
			<p class='comoutput'>ps -f -U tomcat</p>
			<p>Look at the second column, PID, and use that number to kill the process:</p>
			<p class='comoutput'>kill -9 6203</p>
			<p>where 6203 is the PID of tomcat's proces and the switch "-9" indicates that child-processes should be stopped as well. 
			Type "ps -ef" to make sure no tomcat-proces is running, and then start the daemon again with:</p>
			<p class='comoutput'>sudo ./tomcat start</p>
			
		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
