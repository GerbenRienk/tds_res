<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="in this page is explained how you can export data 
from OpenClinica and import it into SPSS" /> 
<meta name="keywords" content="openclinica 3.1 training  status open source software clinical trials datamanagement 
non-profit academic edc spss dataextract" /> 

<title>Trial Data Solutions: getting your OpenClinica data into SPSS</title>
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
			<h1>getting your OpenClinica data into SPSS</h1>
			
<p>Capturing data is not a goal in itself, but is done to analyze the data. This can be done with several programs, such as SAS, R, Stata or SPSS. 
In this page we describe the process of creating a dataset, exporting the data in SPSS format and then importing them into SPSS. 
We will also discuss some caveats when designing your CRF's so you will not run into problems when you start analyzing.</p>
<p>All this is based on OpenClinica 3.1.4.1 and SPSS 21. If you have questions about other versions of OpenClinica, feel free to 
<a href='mailto:info@trialdatasolutions.com'>ask us</a>.</p>
<p>If you already know enough about datasets to create, extract and download your own, <a href='#spss'>go to the SPSS-part</a> of this story</p> 


<h1>creating and exporting a dataset</h1>
<p>Before we can import data, we must first extract it from OpenClinica. Extracting data is described in the 
<a href="https://docs.openclinica.com/3.1/openclinica-user-guide" target="_blank">OpenClinica Reference guide</a>  
and we recommend reading this, but below are also instructions on how to create a dataset and export the data in SPSS-format.</p>


<p>Exporting data is a two-step-process: the first step is defining a collection of items you want to include: 
this collection is called a <b>dataset</b>.<br /> 
The second step is exporting this dataset in a format of your choice.</p>
<p>Step 1: create a dataset<br />
Go to <b>Tasks</b>, <b>Extract Data</b> and click <b>Create Dataset</b>. In the introduction screen, click on button
<b>Proceed to Create a Dataset</b>. In this screen you can choose per Event which CRF's will be included. You do this by clicking on 
the Events in the left column. All CRF's used in that Event will be displayed and by clicking on the CRF you can choose which Items will be 
in the dataset. This is very flexible, but we go for the quick result and click on the link <b>Select All Items in Study</b></p> 

<p><img src='/tds/img/ImagesHowTo/spss/spss01.png' border='0'  class='photo'/><br />
fig. 1: select all items for the dataset</p>

<p>As you can see, you can include several attributes of the Subjects, the Subject-Groups, the Events and the CRF's. 
All this information will be included in your dataset (except the Subject Group Attributes: at version 3.1.4.1 this information will 
not make it in your dataset). And as you never know when you need this info, just tick all the boxes and your screen will look something 
like this:</p>

<p><img src='/tds/img/ImagesHowTo/spss/spss02.png' border='0'  class='photo'/><br />
fig. 2: select all attributes</p>


<p>Now we click the button <b>Continue to Define Scope</b> and this sounds impressive, but what is meant is that 
you can make a selection about which Subjects you would like to include in your dataset, filtered by <b>EnrollmentDate</b>.
For now we leave this as it is and click <b>Continue</b>. Give your dataset a name plus a description. You can choose which 
CRF's should be in the extract: all CRF's, or only marked complete CRF's or only not marked complete.<br />
"And what about this 'MetaDataVersion ODM': what is it and shouldn't we be doing something with that?" you might wonder. 
Well, considering that we will be extracting our data in SPSS-format, these fields are of no concern to us. (And even if we were 
extracting in ODM, whichever flavour, it still would be of no concern, only on very rare occasions.) 
</p>

<p><img src='/tds/img/ImagesHowTo/spss/spss03.png' border='0'  class='photo'/><br />
fig. 3: naming the dataset</p>

<p><b>Tip:</b> if you're running your Study in an environment with many other Studies, then start the name of your dataset with the short ID of your Study.
If you at a later stage want to schedule your extract, this will be very convenient for the OpenClinica-administrator to recognize your dataset.</p>
<p>The next time you want to extract a dataset, you do not need to create it: you can just use this dataset. 
Click <b>Tasks</b>, <b>Extract Data</b>, <b>View Datasets</b> and find your dataset. Then click on the rightmost icon and the screen
<b>Download Data</b> will open and from there you can choose SPSS, etc., all as described below.
This is of course provided that you did not change any CRF's and/or Events. If this is the case, create a new set or edit the existing one
to accommodate the changes. </p>
<p>You may notice that your extracted set will be overwritten with the new one. If you do not want this, go to the server.
In <b>/tomcat/webapps/OpenClinica/WEB-INF/classes</b> locate the file <b>extract.properties</b> and uncomment the line<br />
<b>extract.9.deleteOld=true</b></p>


<h1>can we now, at last, start SPSS?</h1>
<p>Not so fast: we only defined which items we want to use.
Before we can get these into SPSS we must first export the items and to do that, we must first choose
the format in which we want to have the data. Click the <b>Run Now</b></p>

<p><img src='/tds/img/ImagesHowTo/spss/spss04.png' border='0'  class='photo'/><br />
fig. 4: choosing SPPS</p>

<p>You will see the message <b>Your extract is running. You will receive an email and message when the extract is complete.</b> 
If you think or know this won't be a long time, then click <b>Back to Dataset</b> and refresh the page a couple of times, 
until you see your dataset appear in the list of <b>Archive of Exported Dataset Files</b>. Otherwise, look at your inbox for the mail saying 
your extract has completed.</p>	

<p><img src='/tds/img/ImagesHowTo/spss/spss05.png' border='0'  class='photo'/><br />
fig. 5: the dataset ready to download</p>

<p>Now when you click the white down-arrow the download will start of a zip-file named something like 
<b>SPSS_Demoset_2013-11-04-214613148.spss.zip</b>. Save this in a convenient location, for example <b>C:\OC\SPSS</b> and when you've done
that, open the zip and take the two files, SPSS_DAT.dat and SPSS_SPS.sps, and extract them in the same directory. 
SPSS_SPS.sps is a syntax file which contains the definition and structure for SPSS and SPSS_DAT.dat contains the data</p>

<p><img src='/tds/img/ImagesHowTo/spss/spss06.png' border='0'  class='photo'/><br />
fig. 6: the SPSS-folder with the extracted files</p>



<a name="spss"></a>		
<h1>working with SPSS</h1>
<p>You may be tempted to start SPSS and try directly to open  the SPSS_DAT.dat file, because this is tab-delimited file and SPSS is
perfectly able to load that. But much cleaner and easier is to open the SPSS_SPS.sps file, because this contains the syntax to:<br />
1. read the data: <b>GET DATA</b><br />
2. give labels to the variables: <b>VARIABLE LABELS</b><br />
3. give, if applicable, labels to values<b>VALUE LABELS</b></p>

<p>In SPSS select File, Open, Syntax. Browse to the location of the sps-file and select it.</p>

<p><img src='/tds/img/ImagesHowTo/spss/spss07.png' border='0'  class='photo'/><br />
fig. 7: opening a syntax-file</p>

<p>
At the first line adjust the location and name and make it the correct name of your .dat file for example: 
change <b>/FILE = 'SPSS_DAT.dat'</b> into <b>/FILE = 'C:\OC\SPSS\SPSS_DAT.dat'</b>.</p>

<p><img src='/tds/img/ImagesHowTo/spss/spss08.png' border='0'  class='photo'/><br />
fig. 8: modifying the location of the dat-file</p>

<p>
With the cursor somewhere in the <b>GET DATA</b> part of the syntax, click the big green Start-button to run the syntax. 
This will open two additional windows, so now you have 3 SPSS windows: <br />
1. The <b>Viewer</b> with a log of the execution of the syntax. <br />
2. The <b>Syntax Editor</b> window and <br />
3. The <b>Data Editor</b>: this window has 2 views: Data View and Variable View</p>

<p>If there were no errors during the execution of the Get-Data-comand, you can switch to the Data Editor window and have 
a first look at the data: congratulations! But it gets even better than that. Switch back to the Syntax Editor window, put the cursor 
somewhere in the <b>VARIABLE LABELS</b> part and hit Run again. All your variables in SPSS will now have a label, as is shown in the 
Data Editor window, with tab Variable View activated. The label is taken from the column DESCRIPTION in your XL-sheet and 
not from the column <b>LEFT_ITEM_TEXT</b>.<br />
As a last step we swicth back to the Syntax Editor window, put the cursor somewhere in the <b>VALUE LABELS</b> part and hit Run 
for the third time. This is for all CRF-items of type <b>Radio</b> or <b>Single-select</b> that have RESPONSE_OPTIONS and RESPONSE_VALUES.
Without this bit of syntax, only the actual values will be shown in SPSS, so if you for example defined Yes=1 and No=0, then only the
ones and zeros are shown. After running the syntax, Yes and No will be shown.
</p>

<p><img src='/tds/img/ImagesHowTo/spss/spss09.png' border='0'  class='photo'/><br />
fig. 9: after applying the VALUE LABELS syntax</p>

<h1>about E's and C's</h1>
<p>You will see something particular about the Variable-names in SPSS: they all have an extension. For example an Item of CRF Lab, asked at Event Baseline,
 which is called in your 
CRF VISITEDATE will appear in SPSS as VISITDATE_E1_C1. And if the CRF is used in another Event, then there will also be a VISITDATE_E2_C1.</p>

<p>You will probably know which Events are meant with E1, E2 etc, but others may not. It is a good idea to include in your dataset
the attributes of the Events, especially <b>StartDate</b> and <b>Status</b>. When you do this, you will have two variables in 
SPSS, with Variable-Labels, such as <b>StartDate_E1 "Start Date For Baseline(E1)" /</b> and 
<b>EventStatus_E1 "Event Status For Visit1(E1)" /</b> and this way it will be perfectly clear which Event is meant with E1.</p>

<p>Things get even more complicated with Items in a RepeatingItemsGroup: every occurrence has a number. So if a Subjects has data in 3 rows for item
TestScore, then these will end up in the SPSS data as TestScore_E1_C1_1, TestScore_E1_C1_2 and TestScore_E1_C1_3.</p>
<p>And you probably guessed it: if there are Repeating Events, then we get an extra ordinal. For example there were two occurrences of Event E2 and
in the first occurrence two TestScores were entered and in the second one three. This will result in: 
TestScore_E2_1_C1_1, TestScore_E2_1_C1_2 and TestScore_E2_2_C1_1, TestScore_E2_2_C1_2, TestScore_E2_2_C1_3.</p>

<h1>caveats and tips</h1>
<p>There are some things you should keep in mind when working with datasets.</p>
<p> First of all: be aware of the fact that 
OpenClinica exports only variables that have data. Therefore it is a good idea, before you start exporting data, to
make a test site and enter data for as many test subjects needed to ensure you have data in all potential data elements. 
Don't forget to cover different scenarios when you've used SimpleConditionalDisplay. And if you have RepeatingItemGroups,
fill in a realistic number of rows for your test Subjects. Also don't forget to create several occurrences of RepeatingEvents.</p>

<p>When repeating item groups are used, it may be wise to export the data for these separate from the rest of the data.</p>

<p>OpenClinica allows case-sensitive names, SPSS does not. This may lead to a situation of two items having perfectly
different ItemNames for OpenClinica, but are identical for SPSS. All ItemNames in capitals can be a solution, 
but if you like case differences in items names for readabilty be aware of the SPSS requirement.</p>

<p>Incorrect use of the WidthDecimal may result in definitions of SPSS-variables with an impossible format, such 
as <b>F3.6</b> which is a floating point variable of length 3, with 6 position behind the decimal separator. Even SPSS can't
do that. You get a general error message <b>4 GET DATA (2265) Unrecognized or invalid variable format.  
The format is invalid.  For numeric formats, the width or decimals value may be invalid.</b> 
That's not very helpfull and you will have to search and search and search.</p>

<p>Maximum Item length in OpenClinica is 255 caracterst for an item name, SPSS only allows 64.</p>

<p>If all of your variables that are defined as REAL's appear as blanks in SPPS, there's probably something wrong with the setting 
of the decimal separator. For the correct use of decimals add the folowing line: SET LOCALE = 'en_US.windows-1252' run this command.</p>

<p>In case you have VALUE LABELS for Items in CRF's used in Repeating Events, then only for the first occurrence of the Event will
the Value Label syntax be generated and not for the others. You must manually change
<b>RADIO_ITEM_E2_1_C6</b> to <b>RADIO_ITEM_E2_1_C6, RADIO_ITEM_E2_2_C6</b></p>

<p><img src='/tds/img/ImagesHowTo/spss/spss10.png' border='0'  class='photo'/><br />
fig. 10: VALUE LABELS syntax for Repeating Events</p>


<p>In Case the SPSS syntax shows the word BLANKS, do a search and replace and remove these.</p>

<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#other'>here</a>.</p>
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
