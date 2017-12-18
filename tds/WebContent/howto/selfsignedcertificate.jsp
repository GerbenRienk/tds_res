<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="installing a self-signed certificate for Tomcat" /> 
<meta name="keywords" content="openclinica training self-signed certificate Tomcat openclinca open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>TDS: installing a self-signed certificate for Tomcat</title>
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
			<h3>Certificates</h3>
			<p>One of the (many, many) requirements of 21 CFR Part 11 is that all traffic to and from the server where OpenClinica runs
			must be encrypted. If anything is intercepted, at least it is not readable. For encryption you will need a certificate on 
			your server. (This certificate can also be used to authenticate your server, i.e. to guarantee anyone who connects to your server
			that indeed this is the server they expect to connect to.)</p>
			<h3>Production-environment</h3>
			<p>In a production-environment you will probably be using Apache or IIS as the main web-server. In the main web-server you 
			define connectors that describe where and how to redirect requests that must be handled by Tomcat. If you install a certificate on 
			Apache/IIS the encryption/decryption is done there. This has the considerable advantage
			that Tomcat gets plain requests and can send back plain responses and does not need to spend processing power on
			encryption/decryption. <br />
			On this page we will <b>not</b> explain how to install a certificate for Apache or IIS. Most Certificate Authorities have their
			own how-to-pages for requesting a certificate and installing it.
			</p>
			
			<h3>A self-signed certificate for Tomcat</h3>
			
			<p>But let's say you have a relatively small OpenClinca environment and you want to secure it, 
			but without bothering to request a certificate (or without the funding to pay for a certificate). 
			Before we do this, a word of warning: such a certificate will always give
			a <b>security warning</b> in the browsers of your users! You will have to explain to your users where this warning comes 
			from and what the procedures are to add your site to the "trusted sites" or how they can "accept the risk" of connecting 
			to a server with a non-certified certificate.</p>
			<p>(The following information was mostly taken from <a href='http://tomcat.apache.org/tomcat-6.0-doc/ssl-howto.html'
			target='_blank'>http://tomcat.apache.org/tomcat-6.0-doc/ssl-howto.html</a>: an excellent starting point.)</p>
			<p>Having said all this, let's look at the works: we need to do two things: 1- generate a certificate and 2- configure Tomcat
			to accept requests on another port (8443) and where to find the information concerning the certificate.</p>
			
			<h3>Generating the certificate</h3>
			<p>Our first step is to generate the certificate. (This example is for Windows, Unix is almost the same.) This is done by using 
			the keytool, located in your JAVA_HOME. For our Windows example this will be C:\Program Files\Java\jdk1.6.0_18\bin</p>
			<p>Open a command prompt. First create the directory for your keystore-file, that is the file that will hold your certificate. 
			We will put the keystore-file in the Tomcat-directory: C:\Tomcat\Keystore.</p>
			<p class='comoutput'>C:\&gt;mkdir C:\Tomcat\Keystore</p>
			<p>The command you are going to use, keytool.exe, is part of your Java-installation. Switch to your JAVA_HOME directory, 
			in the example C:\Program Files\Java\jdk1.6.0_18 and from there to the bin directory. <br />
			Start the keytool, with the 
			following parameters: <b>keytool -genkey -alias tomcat -keyalg RSA -keystore c:\tomcat\keystore\.keystore</b>. This means 
			more or less: generate a certificate/key called tomcat, using RSA as key-algorithm and store the certificate in the keystore, 
			located in C:\Tomcat\Keystore.</p>
			<p class='comoutput'>
			C:\&gt;cd %JAVA_HOME%<br />
			C:\Program Files\Java\jdk1.6.0_18&gt;cd bin<br />
			C:\Program Files\Java\jdk1.6.0_18\bin&gt;keytool -genkey -alias tomcat -keyalg RSA -keystore c:\tomcat\keystore\.keystore</p>
 			<p>Now you must supply several parameters. None of these are very important, except the <b>keystore password</b>.
 			Standard is <b>changeit</b>, but of course you can use anything. But whatever you choose: write it down. You will 
 			need this password in the server.xml file, so Tomcat can open the keystore and read the certificate. 
 			A typical output of the keystore is:</p>
			<p class='comoutput'>
			Enter keystore password:<br />
			Re-enter new password:<br />
			What is your first and last name?<br />
			  [Unknown]:  GR Visser<br />
			What is the name of your organizational unit?<br />
			  [Unknown]:  TrialDataSolutions<br />
			What is the name of your organization?<br />
			  [Unknown]:  TrialDataSolutions<br />
			What is the name of your City or Locality?<br />
			  [Unknown]:  Amsterdam<br />
			What is the name of your State or Province?<br />
			  [Unknown]:  NH<br />
			What is the two-letter country code for this unit?<br />
			  [Unknown]:  NL<br />
			Is CN=GR Visser, OU=TrialDataSolutions, O=TrialDataSolutions, L=Amsterdam, ST=NH<br />
			, C=NL correct?<br />
			  [no]:  y<br />
			<br />
			Enter key password for &lt;tomcat&gt;<br />
			        (RETURN if same as keystore password):&lt;tomcat&gt;</p>
			
			<h3>Configuring Tomcat</h3>
			<p>You have your certificate in place, but you still must configure Tomcat. Shutdown Tomcat. Go to the 
			C:\Tomcat\conf directory and copy the file <b>server.xml</b>, so you have a backup-copy in case you mess it up.
			Scroll to the comment-line that says "Define a SSL HTTP/1.1 Connector on port 8443". Uncomment it (and add your own comment, 
			so you can find back later what you've changed). You must add information about where the keystore with 
			the certificate is and what the password for the keystore is: <b>keystoreFile="c:\tomcat\keystore\.keystore" keystorePass="changeit"</b></p>
			<p>
			<img src='/tds/img/ImagesHowTo/ServerXMLForHttps.jpg' border='0'  class='photo'/><br />
			fig. 1: modified server.xml 
			</p>
			<p>And that's it. Save your file and start Tomcat. Open your browser and use as address <b>https://localhost:8443</b>
			Tell your browser this is a trusted site or add an exception etc.</p>

<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#other'>here</a>.</p>
		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
