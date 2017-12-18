<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: setting up web-services" /> 
<meta name="keywords" content="openclinica 3.1 training conditional display status open source software clinical trials datamanagement 
non-profit academic edc web services" /> 

<title>Trial Data Solutions: setting up webservices for OpenClinica</title>
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
			<h3>setting up web-services</h3>
			
			<p>With version 3.1 came a brand-new version of the web-services of OpenClinica. Before the webservices were in the same app
			as the web-interface, but starting with this release, a separate app is used. And it is very easy to install.<br />
			First of all you must check if you have in your Tomcat settings the setting "-XX:PermSize=128m". Take this as a startingpoint 
			and and add more if your logs tell you.</p>
			<p>The next step is downloading the war with the web-service. Take care to choose exactly the same version as your web-interface.
			Unzip the file OpenClinica-ws.war and then open a browser and choose <b>[yourserver]:8080/manager/html</b> as URL. 
			This is a bit different from the installation instructions, but rest assured: they work as well. Scroll down the page to the box labeled 
	<b>WAR file to deploy</b> and browse to the location of the war-file and click the button <b>Deploy</b>.</p>
			
			<p>
			<img src='/tds/img/ImagesHowTo/wssetup/img01.jpg' border='0'  class='photo'/><br />
			fig. 1: Deploying the war using Tomcat's manager-application
			</p>
			<p>After some time, let's say a couple of minutes, Tomcat will have deployed the war and tried to start it, but this was not successful,
			so column <b>Running</b> will be set to false. Of course this has to do with the datainfo.properties, located under 
			/tomcat/webapps/OpenClinica-ws/WEB-INF/classes. To repair, take the datainfo.properties of <b>OpenClinica</b> and copy it to the 
			location of the default datainfo.properties of the <b>OpenClinica-ws</b>. Open it in your favorite editor, such as <a href='http://notepad-plus-plus.org/'
			 target='_blank'>Notepad++</a> and 
			and then change two lines:<br />
			- the name of the database, that is: if you did not change it from <b>${WEBAPP.lower}</b> to a hard-coded name (which is what I prefer)<br />
			- the sysURL under number 8: change <b>OpenClinica</b> into <b>OpenClinca-ws</b>
			
			 </p>
			 <p>Hold on, while you still have Notepad++ open, open /tomcat/webapps/OpenClinica-ws/WEB-INF/web.xml. Change the elements
			 display-name and description into something slightly more descriptive.</p>

<p>
<img src='/tds/img/ImagesHowTo/wssetup/img02.jpg' border='0'  class='photo'/><br />
fig. 2: Change database-name
</p>
<p>
<img src='/tds/img/ImagesHowTo/wssetup/img03.jpg' border='0'  class='photo'/><br />
fig. 3: Change sysURL
</p>


<p>Hold on, while you still have Notepad++ open, open /tomcat/webapps/OpenClinica-ws/WEB-INF/web.xml. Change the elements
display-name and description into something slightly more descriptive.</p>
<p>
<img src='/tds/img/ImagesHowTo/wssetup/img04.jpg' border='0'  class='photo'/><br />
fig. 4: Changing web.xml
</p>

<p>Now if we click the <b>Start</b> link of the OpenClinica-ws-app, it should be up and running.</p>
<p>
<img src='/tds/img/ImagesHowTo/wssetup/img05.jpg' border='0'  class='photo'/><br />
fig. 5: web interface and web-services running
</p>

<p>We can check this by typing in a URL of one of the web-services, for example <b>/ws/studySubject/v1/studySubjectWsdl.wsdl</b> and 
then we see the output in our browser. Not extremely useful yet, but it is proof we've accomplished something. On to the next step.</p>
<p>
<img src='/tds/img/ImagesHowTo/wssetup/img06.jpg' border='0'  class='photo'/><br />
fig. 6: testing one of the web-services
</p>

<h3>enter soapUI</h3>
<p>To test web-services <a href='http://soapui.org/' target='_blank'>soapUI</a> is a great tool.<br />
Once you've installed it you start by making a new workspace, for example <b>OC 3.1.1</b>. 
For this example we will use the <b>study-webservice</b>, located under
/OpenClinica-ws/ws/study/v1/studyWsdl.wsdl. Make sure this is the right address by typing it in a browser and seeing the output. Copy the address.
Switch to soapUI and create a new project, by right-clicking on the workspace and choosing <b>New soapUI project</b>. In the screen that appears,
fill in for Project name <b>Study webservice</b> and paste the URL from your browser into Initial WSDL/WADL.</p>

<p>
<img src='/tds/img/ImagesHowTo/wssetup/img07.jpg' border='0'  class='photo'/><br />
fig. 7: creating a new project
</p>

<p>We will use the second Request, called <b>listAll</b>. Double-click this and a request will be generated. Click on the select that says <b>
/ws/study/v1</b> and choose <b>[edit current..]</b>.</p>

<p>
<img src='/tds/img/ImagesHowTo/wssetup/img08.jpg' border='0'  class='photo'/><br />
fig. 8: creating a new Request
</p>
<p>Again, paste the URL of the web-service from your browser into the dialog asking for the end-point.</p>
<p>
<img src='/tds/img/ImagesHowTo/wssetup/img09.jpg' border='0'  class='photo'/><br />
fig. 9: Endpoint
</p>
<p>We can almost submit our request, but first we must do two things:</p>
<ol> 
<li>allowing one of the OpenClinica-users to access the webservice</li>
<li>supplying the webservice with username and password</li>
</ol>

<h3>back to OpenClinica</h3>
<p>It's one of the fine features of OpenClinica's webservices that you can rely on the user-rights as defined in the application.
This may seem trivial, but it is surely not. It means that you do not have to worry about unauthorised
users accessing your data. In fact you must specifically authorise them to make use of webservices.<br />
This is done in the web-interface, the "normal" OpenClinica, under menu-option <b>Users</b>.<br />
We will start with allowing user root access to the webservices. This is done by checking the box labeled 
<b>Authorize SOAP web services in this account</b> and then click <b>Next</b> and <b>Confirm</b>. </p>
<p>
<img src='/tds/img/ImagesHowTo/wssetup/img10.jpg' border='0'  class='photo'/><br />
fig. 10: authorizing root
</p>

<h3>and over to you, soapUI</h3>
<p>So, can we now make the request? No, we must start the request with handing over our credentials, so to speak. 
This is done in the request header, which by default is set to <b>&lt;soapenv:Header/&gt;</b>. 
That's not enough and we see that when we submit the request by clicking the Start-icon, the green arrow/triangle in the top-left of the
soapUI-screen. The service responds with a <b>XWSSecurityException</b>.<br  />
We can find the right format at the OpenClinica-docs-site, at 
<a href='https://docs.openclinica.com/3.1/technical-documents/openclinica-web-services-guide/study-web-service#content-title-3004' target='_blank'>
https://docs.openclinica.com/3.1/technical-documents/openclinica-web-services-guide/study-web-service#content-title-3004</a>. Just
copy the bit between <b>&lt;soapenv:Header&gt;</b> and <b>&lt;/soapenv:Header&gt;</b> 
and paste it in soapUI, so that it replaces <b>&lt;soapenv:Header/&gt;</b>.</p>
<p>
<img src='/tds/img/ImagesHowTo/wssetup/img11.jpg' border='0'  class='photo'/><br />
fig. 11: pasting the header
</p>

<p>Hold on, there are two more steps to take. First we replace the word <b>user</b> in the header with <b>root</b>, 
and then we replace <b>password</b> with, no, not with the actual password. We must use the password 
converted into a hash with the SHA1-algoritm. There are sites and utils for this, for example 
<a href='http://www.tech-faq.com/sha-1-generator' target='_blank'>
http://www.tech-faq.com/sha-1-generator</a>.<br />
Copy the generated string and paste it in the header.
</p>
<p>
<img src='/tds/img/ImagesHowTo/wssetup/img12.jpg' border='0'  class='photo'/><br />
fig. 12: the request, ready to be sent
</p>
<p>And finally you can push the button, the green icon in the top-left corner, and your result will be a list of all available studies
and sites.</p>
<p>
<img src='/tds/img/ImagesHowTo/wssetup/img13.jpg' border='0'  class='photo'/><br />
fig. 13: the result
</p>


<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#webservices'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed November 2013</p>

</div>
	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
