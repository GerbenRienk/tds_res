<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: copying the Event-date in the CRF" /> 
<meta name="keywords" content="openclinica 3.1 training  open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: running tomcat 6 and 7</title>
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

<script src="/tds/js/ga.js" type="text/javascript"></script>
<script src="/tds/js/highlight.pack.js" type="text/javascript"></script>
<script>hljs.initHighlightingOnLoad();</script>
</head>

<body>

<%@ include file="/includes/headermenu.jsp" %>
<hr />

<div id="wrap" class="group">
	
	<div class="main">		
		
		<div class="entry group">

<h1>running tomcat 6 <span class='amp'>&amp;</span> 7</h1>
			
<p>When you are in a position that you have several versions of OpenClinica running at the same time, this might be problematic,
because some run on tomcat6, but others must run on tomcat7. Let's say you use apache2 as front-end and you have
an OpenClinica 3.1.4 instance running as <b>oc314</b> and an OpenClinica 3.6 instance, running as <b>oc36</b>.
And oc314 is deployed by tomcat6 and oc36 by tomcat7.</p>

<h1>hold on, not so quick: 6 <span class='amp'>&amp;</span> 7?</h1>
<p>Yes, you can have different versions of tomcat on the same server. When you have a "normal" tomcat6 installation, 
you will have installed jdk 1.6 and "java" will refer to that. But if you run on top of that a normal installation of jdk1.7 
in for example /usr/lib/jvm/jdk1.7.0_51 and then a normal installation of tomcat7, you can use jdk1.7 by referring to it in 
<b>setenv.sh</b> by adding the line <b>export JAVA_HOME="/usr/lib/jvm/jdk1.7.0_51"</b>. <br />
You probably know that tomcat uses ports for communication and for shutdown and by default these are for http 8080,
for ajp 8009 and for shutdown 8005. If you used these for tomcat6, you must use other ports for tomcat7, and you do this in 
server.xml, for example <b>http 8081</b>, <b>ajp 8010</b> and <b>shutdown 8006</b>.<br />
To summarize this all:
</p>

<table class="summarytable">
<tr><th>file</th><th>tomcat6</th><th>tomcat7</th></tr>
<tr><td>bin/setenv.sh</td><td>export JAVA_HOME="/usr/lib/jvm/java-6-openjdk"</td><td>export JAVA_HOME="/usr/lib/jvm/jdk1.7.0_51"</td></tr>
<tr><td>conf/server.xml</td><td>&lt;Server port="8005" shutdown="SHUTDOWN"&gt;</td><td>&lt;Server port="8006" shutdown="SHUTDOWN"&gt;</td></tr>
<tr><td></td><td>&lt;Connector port="8080" protocol="HTTP/1.1"<br />connectionTimeout="20000"<br />redirectPort="8443" /&gt;</td>
<td>&lt;Connector port="8081" protocol="HTTP/1.1"<br />connectionTimeout="20000"<br />redirectPort="8443" /&gt;</td></tr>
<tr><td></td><td>&lt;Connector port="8009" protocol="AJP/1.3" redirectPort="8443" / /&gt;</td>
<td>&lt;Connector port="8010" protocol="AJP/1.3" redirectPort="8443" / /&gt;</td></tr>
<tr><td>/etc/init.d/tomcat or tomcat7</td><td>SHUTDOWN_PORT=`netstat -vatn|grep LISTEN|grep 8005|wc -l`</td>
<td>SHUTDOWN_PORT=`netstat -vatn|grep LISTEN|grep 8006|wc -l`</td></tr>
</table>
 

<p>As you can see we have two ways of communicating with tomcat: via 8080/8081 or via AJP. With this second method the request
is first handled by apache and then routed to tomcat. Because we now have two tomcats, we must specify who does what through which channel. <br />
We define the two channels in /etc/apache2/workers.properties:
</p>

<pre><code>$ps=/
worker.list=tomcat6,tomcat7

worker.tomcat6.port=8009
worker.tomcat6.host=localhost
worker.tomcat6.type=ajp13

worker.tomcat7.port=8010
worker.tomcat7.host=localhost
worker.tomcat7.type=ajp13</code></pre>


<p>Who does what is defined by the JKMount directive. For example:</p> 
<pre><code>&lt;VirtualHost 212.224.84.235:80&gt;
  JKMount /oc314*           tomcat6
  JKMount /manager-tomcat6* tomcat6
  JKMount /oc36*            tomcat7
  JKMount /manager-tomcat7* tomcat7

  ServerName tds-training.com
  ServerAlias *.tds-training.com
  
  etc.</code></pre>


<h3>OK, more tips?</h3>

<p>While we're editing all this, why not make our OpenClinica a bit safer. We can do three things: close the http-port for the two tomcats,
rename the manager-app and undeploy the examples .
Closing the http-ports is done by commenting out in server.xml the part about port 8080/8081, like this:</p>
<pre><code>&lt;!--
&lt;Connector executor="tomcatThreadPool"
           port="8080" protocol="HTTP/1.1"
           connectionTimeout="20000"
           redirectPort="8443" /&gt;
--&gt;</code></pre>
<p>Now rename <b>/opt/tomcat/webapps/manager</b> to <b>/opt/tomcat/webapps/manager-tomcat6</b> and
likewise, rename <b>/opt/tomcat7/webapps/manager</b> to <b>/opt/tomcat7/webapps/manager-tomcat7</b></p>

<p>Now start your two tomcats and browse to http://tds-training.com/manager-tomcat6/html and http://tds-training.com/manager-tomcat7/html
and undeploy <b>examples</b>.</p>


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
