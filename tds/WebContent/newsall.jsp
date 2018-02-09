<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="our recent OpenClinica activities" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>TDS: about what we have been doing lately with OpenClinica</title>
<link rel="stylesheet" type="text/css" media="screen, projection" href="css/screen.css" />
<script src="js/jquery-1.2.6.min.js" type="text/javascript"></script>
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
			<h3>News, or what have you done lately?</h3>
			<div class="entry-body">

<a name='N056'>&nbsp;</a>
<p class='question'>setting defaults using java-script</p>
<p>On <a href='/tds/howto/defaultsjs.jsp'>this page</a> we explain how you can set defaults in your grid, or repeating-item-group. 
As an extra we also make the values read-only and set the width. And as a final touch we take out the remove-icons.</p>
<p>(8-2-2018)</p>

<a name='N055'>&nbsp;</a>
<p class='question'>adding row-numbers in a repeating item group</p>
<p>On <a href='/tds/howto/rownumber.jsp'>this page</a> we explain how you can get a row-number in your grid, or repeating-item-group. Simple, but effective.</p>
<p>(9-1-2017)</p>

<a name='N054'>&nbsp;</a>
<p class='question'>installing OpenClinica 3.12 for testing</p>
<p>On <a href='/tds/howto/testoc312.jsp'>this page</a> you can find instructions how to set up a test environment for OpenClinica 3.12, 
a release definitely worth testing. We even made a <a href='https://youtu.be/poewFusx9JI' target='_blank'>video</a> about it!</p>
<p>(10-10-2016)</p>

<a name='N053'>&nbsp;</a>
<p class='question'>a clickable Google map</p>
<p>Using maps in OpenClinica is, as many other things, very easy. 
On <a href='/tds/howto/googlemap.jsp'>this page</a> you can find an example plus some explaining of how things work,
so you can tailor the map to your study-needs.</p>
<p>(9-1-2016)</p>

<a name='N052'>&nbsp;</a>
<p class='question'>tomcat6 <span class='amp'>&amp;</span> 7</p>
<p>Sometimes you are running trials in older versions of OpenClinica and then a new trial must be 
started. But this time you want to use the latest version of OpenClinica so this means you must
install tomcat7. On <a href='/tds/howto/tomcat6and7.jsp'>this page</a> you can find instructions on how to do just that.</p>
<p>(18-8-2015)</p>

<a name='N051'>&nbsp;</a>
<p class='question'>OC 3.6</p>
<p>On <a href='/tds/howto/testoc36.jsp'>this page</a> you can find instructions on how to testdrive the new OpenClinica
version 3.6. Testing it before you decide on installing or not is a good idea: if you're happy with how your OpenClinica is 
performing right now and you have no 
plans for a new Study in the near future, you may well decide to stay with your current release.
On the other hand: if you're a heavy user of data-import via the web-service, go and upgrade.</p>
<p>(1-8-2015)</p>


<a name='N050'>&nbsp;</a>
<p class='question'>workshop java-script</p>
<p>On the OC15 this summer in Amsterdam we held a workshop about java-script and 
all the fun things you can do with it when you combine it with OpenClinica. For those of you who attended the workshop and for those
of you who could not be there: everything that was discussed can be found on 
<a href='/tds/workshop_javascript/index.jsp'>these pages</a>, including many examples and even more explanations.</p>
<p>(12-7-2015)</p>


<a name='N049'>&nbsp;</a>
<p class='question'>deselecting radio-buttons in a group</p>
<p>Thomas Kissner showed us a way to place deselect-buttons in a group. Together we came up with the script that 
you can see on <a href='/tds/howto/deselectradio.jsp'>this page</a>, including screenshots and of course
a full explanation.</p>
<p>(30-1-2015)</p>

<a name='N048'>&nbsp;</a>
<p class='question'>script to run a rule</p>
<p>Not everyone knows that you can use a script to execute a Rule. Or even all Rules for a CRF! 
On <a href='/tds/howto/scripttorunarule.jsp'>this page</a> you can find the how's and why's with lots of 
colorful screenshots, so you can schedule the execution of your Rules.</p>
<p>(9-12-2014)</p>

<a name='N047'>&nbsp;</a>
<p class='question'>transformation to SAS</p>
<p>Transforming data from XML to SAS has always been difficult. Luckily for us, Linas Silvas created some 
.xsl files to do the job. You can find them on <a href='/tds/howto/transformtosas.jsp'>this page</a>, including an 
easy-to-use-script.</p>
<p>(14-11-2014)</p>

<a name='N046'>&nbsp;</a>
<p class='question'>showing items from other Events</p>
<p>With the release of OpenClinica 3.4, we have a whole new bunch of data to use in our CRFs: all data from other Events!
Read <a href='/tds/howto/itemsfromotherevents.jsp'>this page</a> and your OpenClinica-world will never be the same.</p>
<p>(11-10-2014)</p>

<a name='N043'>&nbsp;</a>
<p class='question'>OC 3.4</p>
<p>On <a href='/tds/howto/testoc34.jsp'>this page</a> you can find instructions on how to testdrive the new OpenClinica
version 3.4. Testing it before you decide on installing or not is a good idea: if you're happy with how your OpenClinica is performing right now and you have no 
plans for a new Study in the near future, you may well decide to stay with your current release.
If you can not wait to use the StudySubjectOID, go and upgrade.</p>
<p>(11-10-2014)</p>

<a name='N044'>&nbsp;</a>
<p class='question'>ShowAction for a Group</p>
<p><a href='/tds/howto/showrig.jsp'>This page</a> show you how extremely easy it is to write  a Rule-file using the ShowAction
that will display a RepeatingItemsGroup. Read all about the secrets of the DestinationProperty.</p>
<p>(15-8-2014)</p>

<a name='N043'>&nbsp;</a>
<p class='question'>OC 3.3</p>
<p>On <a href='/tds/howto/testoc33.jsp'>this page</a> you can find instructions on how to testdrive the new OpenClinica
version 3.3. Testing it before you decide on installing or not is a good idea: if you're happy with how your OpenClinica is performing right now and you have no 
plans for a new Study in the near future, you may well decide to stay with your current release.
If however you were desperately looking forward to schedule Events automatically: this is your day! </p>
<p>(24-6-2014)</p>

<a name='N042'>&nbsp;</a>
<p class='question'>who did what in your Study?</p>
<p>On <a href='/tds/howto/datalisting.jsp'>this page</a> you can find an updated version of our datalisting utility
that works with OC3.2 and higher. And as an extra, you can get a report per dataentry-person what he or she did 
in a given period, which can streamline your monitoring process.</p>
<p>(24-6-2014)</p>

<a name='N041'>&nbsp;</a>
<p class='question'>SPSS-syntax for check-boxes</p>
<p>Getting your data into SPPS is (kind of) easy, as we discussed <a href='/tds/howto/spss.jsp'>earlier</a>, but a check-box-item
may cause some problems. On 
<a href='/tds/howto/spsscheckbox.jsp'>this page</a> we discuss how to write SPSS-syntax for that and there's a link to a utility
that generates it. (And the utility can use REST!)</p>
<p>(22-4-2014)</p>

<a name='N040'>&nbsp;</a>
<p class='question'>difference in time fields</p>
<p>We've had a <a href='/tds/howto/usingregexpfortimefield.jsp'>page about time fields</a> for a long time. It shows how you can 
set the format and is enough if you want to compare times, i.e. is time A before time B. Things get complicated when you want to know the 
difference between two time-fields. And very complicated when those time fields are in a repeating-item-group. But on
<a href='/tds/howto/timediff.jsp'>this page</a> you can find two examples plus an explanation of how they work.</p>
<p>(4-4-2014)</p>

<a name='N039'>&nbsp;</a>
<p class='question'>OpenClinica 3.2</p>
<p>A completely new version has been released! But exactly how new? And should I install it? Can I test it first? 
Read the answers to these question on    
<a href='/tds/howto/testoc32.jsp'>this page</a>.</p>
<p>(2-4-2014)</p>

<a name='N038'>&nbsp;</a>
<p class='question'>the Event-date in your CRF</p>
<p>If you want to use the Event-date in a Validation, you can use java-script to copy it from the CRF-header. 
It's very straight-forward and with the instructions on our   
<a href='/tds/howto/eventdateincrf.jsp'>how-to-page</a> you will be able to make some great Validations.</p>
<p>(1-1-2014)</p>

<a name='N037'>&nbsp;</a>
<p class='question'>checking your StudySubjectID's with a regular expression</p>
<p>You can not check the format of the StudySubjectID's at creation, but they can be checked after, for example when you enter 
data in the first CRF. With just a bit of javascript we will copy the ID to a read-only CRF-item and on that item we can apply 
a regular expression. Go to our  
<a href='/tds/howto/regexpforstudysubjectid.jsp'>how-to-page</a> to see how.</p>
<p>(10-12-2013)</p>

<a name='N036'>&nbsp;</a>
<p class='question'>from OpenClinica to SPSS</p>
<p>Getting your data into SPSS is probably something of which you think "we'll cross that bridge when we come to it", but
it is a good thing to practice it already a bit in the designing phase of your Study. On our 
<a href='/tds/howto/spss.jsp'>how-to-page</a> we show you, with many many screenshots, how you can do it plus some caveats and tips.</p>
<p>(5-11-2013)</p>

<a name='N035'>&nbsp;</a>
<p class='question'>the number of days between two dates</p>
<p>Calculating the number of days between two dates is not so easy. Especially when you use i18n-files. But it can be done: this
<a href='/tds/howto/datediff.jsp'>how-to-page</a> tells you all you need to know.</p>
<p>(15-10-2013)</p>

<a name='N034'>&nbsp;</a>
<p class='question'>testing openclinica 3.1.4</p>
<p>Setting up a test environment for OpenClinica 3.1.4, based on your current production-instance, should not take you more than
an hour. Read our latest
<a href='/tds/howto/testoc314.jsp'>how-to-page</a> and evaluate if oc314 is the thing for you to install.</p>
<p>(4-8-2013)</p>

<a name='N033'>&nbsp;</a>
<p class='question'>translating</p>
<p>With the release of OpenClinica 3.1.4 we thought it was a perfect moment to redesign our utility for translating
the properties-files. On this 
<a href='/tds/howto/propertiesfiles.jsp'>page</a> you can read all about it, including our cool tool to generate unicode.</p>
<p>(14-7-2013)</p>

<a name='N032'>&nbsp;</a>
<p class='question'>a link to ICD 10</p>
<p>Because of the way the ICD10 site is built, it is quite easy to make a reference to a specific term. On our
latest 
<a href='/tds/howto/icd.jsp'>page</a> we use this to make a CRF with a link to the term entered.</p>
<p>(18-6-2013)</p>

<a name='N031'>&nbsp;</a>
<p class='question'>deselecting radiobuttons</p>
<p>Radio-buttons are nice little things and SimpleConditionalDisplay is a great feature, but the combination of those two
does not always work out right. Put in other words: sometimes you want to deselect a radio-button. Read
<a href='/tds/howto/deselectradio.jsp'>here</a> how to do that.</p>
<p>(1-6-2013)</p>

<a name='N030'>&nbsp;</a>
<p class='question'>capacity testing</p>
<p>If you would like to know if your OpenClinica configuration is up to the task once thousands
of Subjects have been enrolled, read this  <a href='/tds/howto/capacity.jsp'>how-to-page</a>.
In it we describe how, with the use of an MsAccess-utility and web-services, you can populate
your Study with real data.</p>
<p>(27-4-2013)</p>

<a name='N029'>&nbsp;</a>
<p class='question'>a visual analogue scale (VAS)</p>
<p>In this <a href='/tds/howto/vas.jsp'>how-to-page</a> we describe, with a lot of screen-shots, how to make your own visual analogue scale or VAS.
Two examples are given: one which can be implemented on any OpenClinica installation and one that uses extra images. 
And of course all is explained in detail</p>
<p>(2-4-2013)</p>

<a name='N028'>&nbsp;</a>
<p class='question'>aligning two columns</p>
<p>Having trouble aligning items in two columns? 
In this <a href='/tds/howto/twocolumns.jsp'>how-to-page</a> we describe, with a lot of screen-shots, how to make your life
easier, as far as columns are concerned.</p>

<p>(18-2-2013)</p>

<a name='N027'>&nbsp;</a>
<p class='question'>different CRF versions for different Sites</p>
<p>Most of the time when working with OpenClinica we use CRF-versions when we change something about a CRF. And throughout the Study
we generally use the same CRF-version. But it can be handy in some situations to have different versions of a CRF for different Sites.
In this <a href='/tds/howto/versionpersite.jsp'>how-to-page</a> we describe, with a lot of screen-shots, how to do this.</p>

<p>(3-1-2013)</p>
<a name='N026'>&nbsp;</a>
<p class='question'>test 3.1.3 first</p>
<p>30 November 2012 the release of OpenClinica 3.1.3 was announced. It's always a good idea to look before you leap, so
we composed this <a href='/tds/howto/testoc313.jsp'>how-to-page</a> with 8 simple steps to setup a 3.1.3 copy of your production 
instance. So you can take your time evaluating this new version, before upgrading.</p>
<p>(30-11-2012)</p>

<a name='N025'>&nbsp;</a>
<p class='question'>your database as a picture</p>
<p>For those of us who want to see every detail this <a href='/tds/howto/schemaspy.jsp'>how-to-page</a>
shows the result of SchemaSpy: an OpenSource-utility to make a graphical representation of the 
OpenClinica database.</p>
<p>(20-10-2012)</p>

<a name='N024'>&nbsp;</a>
<p class='question'>time-fields</p>
<p>There is no such thing as a Time-field in OpenClinica. We already saw a way to make one by using a regular expression
in combination with an <b>ST</b> field. But this has the disadvantage that you can not compare text-fields, 
so you can not make a Validation such as "Time B must be after Time A." In this <a href='/tds/howto/usingregexpfortimefield.jsp'>how-to-page</a>
we demonstrate a regular expression on a <b>REAL</b> field. <br />
But what about "Time B must be two and a half hours later than Time A": can we do that? Yes, this can be done, but with
some java-scripting.</p>
<p>(16-10-2012)</p>

<a name='N023'>&nbsp;</a>
<p class='question'>changing the layout of a CRF</p>
<p>We already had a way of modifying the stylesheet-element, but for some this was a bit too much, 
so we made this <a href='/tds/howto/layoutchanges.jsp'>how-to-page</a> to show you an alternative and easier way
to get exactly the same end-result.</p>
<p>(09-10-2012)</p>

<a name='N022'>&nbsp;</a>
<p class='question'>a backup-script to crontab</p>
<p>Is your backup plan in order? Are you running a backup-script with crontab every night? 
Or is this somewhere at the lower end of your priority-list? On our updated <a href='/tds/howto/backuprestore.jsp'>how-to-page</a> we show you a starting point
for a script to make nicely organised backups.</p>
<p>(02-10-2012)</p>

<a name='N021'>&nbsp;</a>
<p class='question'>all your work on paper</p>
<p>In our latest <a href='/tds/howto/datalisting.jsp'>how-to-page</a> we show you an MsAccess-utility with which you can
make a print of all items. The layout is a bit rough: just one long list, even for repeating-item-groups.
But if you need something on paper asap: this is your tool.</p>
<p>(27-07-2012)</p>

<a name='N020'>&nbsp;</a>
<p class='question'>creating subjects and scheduling events with web-services</p>
<p>In our latest <a href='/tds/howto/wsclient.jsp'>how-to-page</a> we describe how you can create (a lot) of Subjects by using web-services.
And also how you can schedule Events for them, all done using web-services. Difficult? Not at all.</p>
<p>(29-06-2012)</p>

<a name='N019'>&nbsp;</a>
<p class='question'>yet another place to put instructions in</p>
<p>If you want to add extra instructions in your CRF but still have it clean and tidy, have a look at
 this <a href='/tds/howto/instructionsintip.jsp'>how-to-page</a> on how to use the Tip-function for that. </p>
<p>(22-06-2012)</p>

<a name='N018'>&nbsp;</a>
<p class='question'>have a preview of the future of OC</p>
<p>Maybe you already read about what direction the OC-team wants to go: configurable user-privileges and
coding using MedRA are among the new goodies.<br /> 
This is all part of Aquamarine and you can have a look at that if you can spare 15 minutes
and follow the instructions on this <a href='/tds/howto/testaqua.jsp'>how-to-page</a>. </p>
<p>(09-12-2011)</p>
			
			<a name='N017'>&nbsp;</a>
			<p class='question'>setting default values in a repeating group</p>
			<p>Often we design CRFs with items in a repeating items, where we want to set defaults. Think 
			of table with scan results for several areas, that all must be completed. <br /> 
			How you can create just such a CRF is explained on this <a href='/tds/howto/defaultrepeatingitems.jsp'>how-to-page</a>
			where we use a combination of the ShowAction and the InsertAction.</p>
			<p>(29-11-2011)</p>

			<a name='N016'>&nbsp;</a>
			<p class='question'>transferring data to a new CRF version</p>
			<p>We all have experienced, or we will very soon, the situation where an extra item is added to a CRF that has been in use 
			for some time. And the Study-coordinator has told dataentry they should enter all these extra answers. But you must 
			use a new version for your CRF and retyping all the existing data is not an option.<br /> 
			On this <a href='/tds/howto/transferdatanewversion.jsp'>how-to-page</a> we show you:<br /> 
			1. how to export the existing data<br /> 
			2. make a new CRF version and delete the existing one<br />
			3. edit the exported data so that they can be imported into the new CRF version</p>
			<p>(1-9-2011)</p>

			<a name='N015'>&nbsp;</a>
			<p class='question'>setting the width of an input</p>
			<p>Wouldn't you love to change the width of your inputs? And not one size fits all, but different sizes? On this  
			new <a href='/tds/howto/setwidth.jsp'>how-to-page</a> we show you how it's done: add a little Java-script to your CRF
			and you're good to go.</p>
			<p>(7-7-2011)</p>

			<a name='N014'>&nbsp;</a>
			<p class='question'>displaying an item using a rule</p>
			<p>This new <a href='/tds/howto/showhidemulti.jsp'>how-to-page</a> shows you how to display an item in a CRF
			using a rule. This is totally different from the <a href='/tds/howto/showhideitems.jsp'>previous example</a>, 
			where SIMPLE_CONDITIONAL_DISPLAY was used.</p>
			<p>(6-7-2011)</p>

			<a name='N013'>&nbsp;</a>
			<p class='question'>a working example of getExternalValue</p>
			<p>This new <a href='/tds/howto/postmessage.jsp'>how-to-page</a> shows you how to pick an item of a controlled library
			and send it to your OpenClinciaForm.</p>
			<p>(23-5-2011)</p>

			<a name='N012'>&nbsp;</a>
			<p class='question'>musings on the ct-operator and a multi-option-item</p>
			<p>Because the CT-operator is not so well known, but at the same time can be very useful, we decided to dedicate a 
			<a href='/tds/howto/ctoperator.jsp'>how-to-page</a> to it.
			And we combined this with the very handy checkbox RESPONSE_TYPE. To top it of, we discuss an alternative way to define the 
			RESPONSE_VALUES_OR_CALCULATIONS. Have fun.</p>
			<p>(25-4-2011)</p>



			<a name='N011'>&nbsp;</a>
			<p class='question'>3.0.4.2 available</p>
			<p>The latest update of OpenClinica 3.0 is 3.0.4.2. This version was released on April 7 and you can download it  from the 
			<a href='https://community.openclinica.com/project/openclinica' target='_blank'>OpenClinica-site</a>.<br />
			Strangely enough you can't find this in "Features" or in the other documentation, but this release has a fix for bug 7660! 
			You can look up the details, but the bottomline is: <b>install this update</b>. <br />
			In short: </p>
			<ol>
			<li>make a dump of your postgres-database (just in case)</li>
			<li>make a tar of your openclincia.data folder and put it in a safe place (just in case)</li> 
			
			<li>copy the 3.0.4.1 OpenClinica.war to a safe place (just in case)</li> 
			<li>copy datainfo.properties to a safe place (absolutely necessary)</li> 
			<li>undeploy OpenClinica</li>
			<li>copy the OpenClinica.war to the webapps-folder</li> 
			<li>wait until you see in Tomcat-manager that OpenClinica could not start</li>
			<li>copy your previous datainfo.properties from it's safe place to the original location</li>
			<li>in Tomcat-manager start OpenClinica</li>
			</ol>
			<p>(12-4-2011)</p>

			<a name='N010'>&nbsp;</a>
			<p class='question'>Using a rule to send a mail</p>
			<p>On the latest <a href='/tds/howto/sendingmails.jsp'>how-to-page</a> 
			we explore the possibilities of sending an e-mail message, based on input on a CRF. Not so difficult to do, if you follow the steps.<br />
			(11-3-2011)</p>

			<a name='N009'>&nbsp;</a>
			<p class='question'>First how-to-page for OC 3.1: conditional display, including a video</p>
			<p>On the latest <a href='/tds/howto/showhideitems.jsp'>how-to-page</a> 
			you can find instructions on the use of the simple conditional display feature of OC 3.1. Which you can not use yet,
			because it is still in Beta-test, but it once more shows how easy life can get with OpenClinica. That is to say: datamanagement-life.
			As an extra we recorded the steps and put a <a href='http://www.youtube.com/watch?v=lkDgdUWl_hQ' target='_blank'>video</a> on Youtube. How 2011 is that?<br />
			(24-2-2011)</p>

			<a name='N008'>&nbsp;</a>
			<p class='question'>Tips for setting up a test-environment for OC 3.1. Beta</p>
			<p>Follow these <a href='/tds/howto/testoc31beta.jsp'>six steps</a> and set up a safe test-environment, so you can experiment with the OpenClinica 3.1 Beta.<br />
			(14-1-2011)</p>

			<a name='N007'>&nbsp;</a>
			<p class='question'>OpenClinica 3.0.4: install it!</p>
			<p>Normally I'm not so very quick with instaling new versions: it's a lot of work and it's not always clear what the benefits
			are (apart from security-updates, which are done asap). But I would advise everyone to install/upgrade to 3.0.4. The 
			reason being that the interface for testing rules has improved dramatically. Plus you can download the existing rules!
			Great enhancement, so go for it.<br />
			(16-09-2010)</p>

			<a name='N006'>&nbsp;</a>
			<p class='question'>the new OpenClinica: Amthyst</p>
			<p>Akaza research has announced that the next version of OpenClinica is available for testing. This version is 3.1
			and the name is Amethyst. I've downlaoded the Alpha-test version and I'm quite impressed with it. This version
			gives users the option to define rules to show or hide items on a CRF. One obvious example is: ask whether the 
			participant is male or female. If female, then ask about pregnancies.<br />
			Another feature of this release is that they have made the syntax for rules a bit simpler. You don't have to refer 
			to an item using StudyEvent, FormVersion and GroupID. Instead you can just use the ItemID and the validation will
			be applied to all occurrences. <br />  
			They expect this version to be released in October 2010. 
			<br />
			The Alpha can be found at: <a href='http://svn.akazaresearch.com/OpenClinica-3.1-distros/' target ='_blank'>
			http://svn.akazaresearch.com/OpenClinica-3.1-distros/</a> and some examples plus a database can be found at 
			<a href='https://www.openclinica.org/dokuwiki/doku.php?id=developerwiki:oc31alpha' target='_blank'>
			https://www.openclinica.org/dokuwiki/doku.php?id=developerwiki:oc31alpha</a>.<br />
			(14-07-2010)</p>
			
			<a name='N005'>&nbsp;</a>
			<p class='question'>uploaded CRF for SF-36</p>
			<p>On the page with <a href='/tds/CRFExamples'>sample CRF's</a> I added one for the SF36.<br />
			This is well known ad widely used questionnaire, that takes just a few minutes to complete.
			<br />
			(23-03-2010)</p>
			
			<a name='N004'>&nbsp;</a>
			<p class='question'>uploaded some sample CRF's</p>
			<p>Today I put some <a href='/tds/CRFExamples'>examples of CRF's</a> online. One is a sort of dummy CRF, which makes it instantly
			clear where all the items on your XL-sheet popup in your CRF. It's very straightforward and is meant to 
			get you started with designing your very own OpenClinica-CRF's.<br />
			The second one is designed to show you how a calculated field works. This is done with the BMI. Have a look at the screenshot 
			and download the CRF and things will become much clearer. 
			<br />
			(04-03-2010)</p>

			<a name='N003'>&nbsp;</a>
			<p class='question'>did the first upload of how-to-pages</p>
			<p>Today I started the <a href='/tds/howto'>how-to-pages</a>. On the website of 
			<a href='https://www.openclinica.org/dokuwiki/doku.php?id=publicwiki:faq' target='_blank'>OpenClinica</a> you have this FAQ, 
			which is useful but not very informative. I thought I'd make some nice screenshots, that might help you find your way.
			I think when you start using OpenClinica the amount of information on screen can be overwhelming. And added to that: 
			most of the functionality can be done in more than one way.<br />
			Just to stay on the open-source-side of the track, I installed <a href='http://www.gimp.org/' target='_blank'>GIMP</a>
			as editing tool for the images. That's another steep learning-curve.
			<br />
			(14-02-2010)</p>
			
			<a name='N002'>&nbsp;</a>
			<p class='question'>installed the latest version of Eclipse</p>
			<p>I installed the latest version of Eclipse, Galileo: Eclipse IDE for Java EE Developers	1.2.1.20090918-0703	epp.package.jee<br />
			Eclipse is a widely used tool for writing applications. It's open source software and it's very versatile and reliable.<br />
			It was some time since I had a look on the website, <a href='http://www.eclipse.org/' target='_blank'>http://www.eclipse.org/</a> and I
			was in for a nice surprise: Galileo, the Eclipse IDE for Java EE Developers, now comes with integrated Tomcat support.
			This makes life really easy for me: I can (and do) develop these pages in Eclipse, test and debug them. 
			Then I make a war and deploy it on this website, using the standard Tomcat-manager.<br />
			(21-01-2010)
			</p>
			
			<a name='N001'>&nbsp;</a>
			<p class='question'>installed OpenClinica 3.0.1 on Debian</p>
			<p>For two months I'd been fiddling around with OpenClinica on my trusted laptop and I felt the time had come to take the jump
			and install it on a server. On my laptop I had Redhat 5 installed, so I started with looking for hosting-companies offering servers
			with that OS. This turned out to be quite expensive. But surfing along I stumbled on 
			<a href='http://www.adix.nl/' target='_blank'>http://www.adix.nl/</a>, a company located in Groningen, Holland. 
			They offer a Virtual Private Server with Tomcat installed: the ideal environment for your Java-apps. And access to a Postgres-database.
			I had to change the installation-script just a tiny bit, mostly due to the fact that I have root-access. But it's up and running now
			and you're looking at the results.<br />
			To anyone interested in setting up OpenClinica with low monthly costs I would recommend this company.
			<br />
			(14-01-2010)</p>
			</div>
		</div>

	</div> <!-- /.main -->
	
	<hr />

<%@ include file="/includes/news.jsp" %>

	<div class="secondary"> <!-- /.photo -->
		<div class="mod">
		<img src='/tds/img/DoctorsGroup.jpg' border='0' width='100%' />
		</div>
	</div> <!-- /.secondary -->
	
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>

