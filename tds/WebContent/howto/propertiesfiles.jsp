<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="about the properties-files and translating" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc properties-files translating i18n internationalization" /> 

<title>TDS: the properties-files and translating OpenClinica</title>
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
			<h3>properties-files, i18n and translating</h3>
<p>Sometimes you would like to change just a little bit in the text that is displayed on the OpenClinica screen. Or you would like to
modify the content of, for example, the mail that is sent after a dataset has been created.</p>
			<p>
			<img src='/tds/img/ImagesHowTo/properties/pr01.jpg' border='0'  class='photo'/><br />
			fig. 1: mail-message
			</p>
<p>In this message we would of course love to replace the last words with: <b>Thank you, the TrialDataSolutions Team</b>. 
You probably know that all this information is stored in the so-called properties files. 
Those are located in your tomcat-webapps-dir, under the OpenClinica folder\WEB-INF\classes\org\akaza\openclinica\i18n.</p>
<p>There are nine, or rather eight not counting the <b>format.properties</b>, of these files and when you open them you can edit
them in any text-editor. The only problem is that they contain more than 3000 terms!</p>

<h3>can we make that easier?</h3>
<p>Very few like to go through such a list and find what they're looking for manually and that's why you can download
an <a href='/tds/CRFExamples/i18n_20180910.zip' target='_blank'>MS Access database</a> where all the terms of OpenClinica 3.2 - 3.14 are stored in one big table, called 
<b>tblPropertiesValues</b>.<br />
(Click <a href='/tds/CRFExamples/i18n_oc313_20130103.zip' target='_blank'>here</a> for OpenClinica pre 3.1.4. and 
<a href='/tds/CRFExamples/i18n_oc314_20130714.zip' target='_blank'>here</a> for OpenClinica 3.1.4.x)</p>

			<p>
			<img src='/tds/img/ImagesHowTo/properties/pr02.jpg' border='0'  class='photo'/><br />
			fig. 1: tblPropertiesValues
			</p> 
<p>To find the term <b>Development Team</b> you just click in the column labeled <b>none</b>, press Ctrl-F etc. 
Now you know in which file to look for the term, so you could go to the file, edit and save it and restart OpenClinica to enjoy the result.<br />
But you can also use the form that is included and that was meant for something different altogether: translating OpenClinica</p>

<h3>translating OpenClinca</h3>
<p>The main reasons why I started this database was that I wanted to translate the interface in Dutch. But I got stuck somewhere in the middle.
But my plan was to 'just' go through the terms and translate them, using the form labeled <b>frmPV</b>.</p>

			<p>
			<img src='/tds/img/ImagesHowTo/properties/pr03.jpg' border='0'  class='photo'/><br />
			fig. 3: form for translating terms
			</p>
			
<p>The use of the form is basically: choose a language; type your translations in the box at the bottom and when finished click the button
<b>write prop files for selected language</b>. If you made any changes to the standard terms, that are in field <b>none</b>, you can click the button
<b>write main properties files</b>. The only thing you must do is make sure the location of the files is correct. 
It is displayed at the top of the form and it is set as a Constant in modReadAndWrite.</p>	


			<p>
			<img src='/tds/img/ImagesHowTo/properties/pr04.jpg' border='0'  class='photo'/><br />
			fig. 4: setting the location of the files
			</p>

<h3>unicode, anyone?</h3>
<p>If you are translating into a language with nice, but non ASCII characters, like Portugese, you must convert all these
characters into their unicode-format. And this is not difficult, because of the button labeled <b>generate unicode</b>. 
For example you want to translate <b>Please see the instructions to the right on the main page.</b> Faithfully you enter this in 
Google Translate and you paste the result in Access</p>		

<p>
<img src='/tds/img/ImagesHowTo/properties/pr08.jpg' border='0'  class='photo'/><br />
fig. 5: pasting the result of Google-translate
</p>

<p>Next you click on <b>generate unicode</b> and all characters are transformed to unicode and below the box you can see the result.</p>

<p>
<img src='/tds/img/ImagesHowTo/properties/pr09.jpg' border='0'  class='photo'/><br />
fig. 6: unicode transformation
</p>

<h3>and it looks like ...</h3>
<p>Have fun with this database: treat yourself to a wealth of Chinese characters by choosing <b>zh</b> writing the files and 
restarting OpenClinica. Then click in Firefox <b>Tools</b>, <b>Options</b>  </p>

			<p>
			<img src='/tds/img/ImagesHowTo/properties/pr05.jpg' border='0'  class='photo'/><br />
			fig. 7: setting languages in Firefox
			</p>
<p>Add <b>zh</b> and move it to the first position</p>

			<p>
			<img src='/tds/img/ImagesHowTo/properties/pr06.jpg' border='0'  class='photo'/><br />
			fig. 8: setting languages in Firefox
			</p>

			<p>
			<img src='/tds/img/ImagesHowTo/properties/pr07.jpg' border='0'  class='photo'/><br />
			fig. 9: your home, but differently
			</p>

<p>If you would like to contribute translations or work on the existing ones: contact OpenClinica! If you have questions about the 
database, contact <a href='mailto:GerbenRienk@trialdatasolutions.com' target='_blank'>me</a>. </p>

<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#other'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed October 2018</p>

		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
