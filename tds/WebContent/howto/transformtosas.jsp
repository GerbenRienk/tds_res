<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: importing into SAS" /> 
<meta name="keywords" content="openclinica SAS 3.x training  open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>Trial Data Solutions: getting your data into SAS</title>
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
			<h3>getting your data into SAS</h3>
			
<p>Getting data into SAS was always a great source of headache for me, because I am not familiar with SAS. 
There were some items in the 
<a href='http://en.wikibooks.org/wiki/OpenClinica_User_Manual/SAS' target='_blank'>wiki-book</a>, 
but when I referred people to those they said that it was not complete and/or
that that was not what they were looking for. But in February 2014 Linas Silvas published some great scripts! Lindsay 
Stevens modified them a bit and put them in his <a href='https://github.com/lindsay-stevens-kirby/openclinica_scripts/tree/master/OC_XML_to_SAS_R_CSV'
 target='_blank'>repository</a> and they were welcomed with a loud hurray. Well, from me at last. 
I must confess that it took me some time to get them working, but once I had done some transformations it was a breeze.
I even managed to "minify" the script a bit, so that it is easier to use it. 
</p>

<h3>preparation</h3>
<p>You can download the scripts from Lindsay's Github, but you can also use this
<a href='/tds/CRFExamples/SASscript.zip' target='_blank'>zip-file</a>. Then unzip the lot and put it in a folder:
</p>
<p>
<img src='/tds/img/ImagesHowTo/transformtosas/ts01.JPG' border='0'  class='photo'/><br />
fig. 1: the contents of the folder
</p>
<p>Now you are ready to transform your dataset, so go to your OpenClinica and create a dataset and 
extract it to <b>CDISC ODM XML 1.3</b>: any flavor will do. Download the zip and unzip the xml to the
same folder where you unzipped the script files. Personally I prefer to rename the file to something 
short like <b>total_20141031.xml</b></p>

<h3>the big transformations</h3>
<p>With all this in place we can run the scripts and this is done by opening a command prompt as administrator.
The script is a Powershell script, so we first go to the right drive and folder and then we start Powershell.
We have to set the right execution policy and this is done by <b>Set-ExecutionPolicy Unrestricted -Scope Process</b>.
The script only needs one parameter and that is the name of the xml-file with the dataset, so in our case
<b>.\From_XML_to_SAS_xsl_transforms.ps1 "total_20141031.xml"</b></p>

<p>
<img src='/tds/img/ImagesHowTo/transformtosas/ts02.JPG' border='0'  class='photo'/><br />
fig. 2: calling the script
</p>
<p>You then leave Powershell with "exit" and the command-prompt with another "exit". 
In your folder you now should have: <b>mapout_total_20141031.xml</b>, <b>formatout_total_20141031.xml</b>
and <b>data_total_20141031.xml</b>
</p>
<h3>how it works</h3>
<p>In the zip file is another ps1-file, called <b>powershell_perform_SAS_xsl_transforms.ps1</b> and this is Linas'
original script. When you open it you see that it needs seven parameters. I'm prone to make typo's, so I rewrote 
that to have the xsl-names, because they are already set, plus generated names for the output-files.<br />
There is also the file <b>xml_convert_dynamic_lookup.xsl</b> which can be used to give your groupsids
more friendly names. This file has to be modified manually, before you do the transformations.</p>

<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#crfs'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed November 2014</p>
		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
