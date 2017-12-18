<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="How to's in OpenClinica" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc free gratis database medisch onderzoek ecrf" /> 

<title>TrialDataSolutions: how to's in OpenClinica</title>
<link rel="stylesheet" type="text/css" media="screen, projection" href="/tds/css/screen.css" />
<script src="/tds/js/jquery-1.2.6.min.js" type="text/javascript"></script>
<script type="text/javascript">
	
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
<h3>How to's in OpenClinica</h3>
<div class="entry-body">
<p>Here is a page with some <a href='/tds/CRFExamples'>examples of CRF's</a> and here is another one  
with our <a href='/tds/howto/top5pages.jsp'>top 5 pages</a> of this section.</p>
<p>We put some pages together to show you how easy it is to use OpenClinica. 
Most OpenClinica-screens have extra descriptive messages on the left, under <b>"Instructions"</b>. 
Some have links to extended help, indicated by a large questionmark.
<img src='/tds/img/ImagesHowTo/BigQuestionMark.jpg' /> </p>
<p>Use the following links for a description of the basic functionality of 
OpenClinica and some more advanced topics: </p>
<a name='events' />

			<h3>Events/Visits</h3>
			<ul>			
				<li><a href='createeventdefinition.jsp'>create a new Event Definition</a></li>
				<li><a href='assignacrftoastudy.jsp'>assign a CRF to a study</a></li>
			</ul>
			<a name='crfs' />
			<h3>CRF's</h3>
			<ul>
			<li><a href='createanewcrf.jsp'>create a new CRF</a></li>
			<li><a href='createanewversionofacrf.jsp'>create a new version of an existing CRF</a></li>
			
			<li><a href='transferdatanewversion.jsp'>transfer existing data to a a new version of a CRF</a></li>
			
			<li><a href='versionpersite.jsp'>one version of a CRF for one site, another version for another site</a></li> 
			<li><a href='instructionsintip.jsp'>using Tip to display instructions</a></li>
			<li><a href='crfwithfile.jsp'>a CRF with a file</a></li>
			<li><a href='crfwithimage.jsp'>a CRF with an image</a></li>
			<li><a href='usingregexpfortimefield.jsp'>3 methods to create a time field</a></li>
			<li><a href='timediff.jsp'>the number of minutes between two time fields</a></li>
			
			<li><a href='datediff.jsp'>the number of days between two date fields</a></li>
			
			<li><a href='postmessage.jsp'>getExternalValue, postMessage and controlled vocabularies</a></li>
			
			<li><a href='layoutchanges.jsp'>changing the layout of a CRF</a></li>
			<li><a href='twocolumns.jsp'>aligning two columns</a></li>
			
			<li><a href='deleteyellow.jsp'>getting rid of the yellow comment-fields in the XL-sheet</a></li>
			<li><a href='showhideitems.jsp'>showing or hiding items on a CRF, based on the input of another item </a> (SimpleConditionalDisplay)</li>
			<li><a href='showhidemulti.jsp'>showing or hiding items on a CRF using a rule </a></li>
			
			<li><a href='defaultrepeatingitems.jsp'>setting defaults for repeating items using the insertaction </a></li>		
			
			<li><a href='charcount.jsp'>displaying the number of characters left</a></li>
			<li><a href='vas.jsp'>a visual analogue scale or VAS</a></li>
			<li><a href='warning.jsp'>a warning in a CRF</a></li>
			<li><a href='icd.jsp'>a link to the ICD10 site in a CRF</a></li>
			<li><a href='deselectradio.jsp'>deselecting a radio-button</a></li>
			<li><a href='regexpforstudysubjectid.jsp'>a regular expression for the StudySubjectID</a></li>
			<li><a href='eventdateincrf.jsp'>the Event-date in your CRF</a></li>
			<li><a href='itemsfromotherevents.jsp'>using items from other Events</a></li>
			<li><a href='rownumber.jsp'>an automatic rownumber in a repeating-item-group</a></li>
<!-- 			
			SPSS en checkbox utility
			pagina over concat van twee items
			Rule alleen op MarkedComplete
			
			iets met StudyParameters
			datum tussen twee visites en _CURRENT_DATE
			iets met aggregate functies
			iets over datainfo.properties o.a. de welkomtekst RSS
			regexp voor tijd met AM/PM
			regexp voor datum validatie, bijv. voor 2010
			
			herschrijven ctoperator.jsp; uitbreiden met Rule voor none
			
			DECODE en POW: decode voor indeling in ranges
			insertaction 3x: waarde, ander item, in ander crf
			iets over UNK en NA
			iets over par en log-settings
			
			checkbox en SCD en DiscrAction
			video van user toekennen aan site
			
			data-wdsl en status:initial data entry
			
			grid en autonumber
			
			setting available versions
			
			iets met RESTful URLs https://docs.openclinica.com/3.1/technical-documents/openclinica-restful-urls
			iets met snel data van 1 item:
			select ss.label, se.date_start, id.value from
item_data id,
item i,
event_crf ec,
study_event se,
study_subject ss
where id.item_id=i.item_id and
id.event_crf_id=ec.event_crf_id and
se.study_event_id=ec.study_event_id and
se.study_subject_id=ss.study_subject_id
and i.name='Descr';

kapotte index repareren:
CREATE TABLE dupfinder_audit_user_login AS SELECT ctid AS tid, id FROM audit_user_login;
select id, count(id) from dupfinder_audit_user_login group by id  having count(id)>1 ;
select * from dupfinder_audit_user_login where id=32763;
delete from audit_user_login where ctid='(292,12)' and id=32763;

pagina over users en roles uitbreiden met overzicht van Arithmos

- using the role of the user
- making a reminder i.c.m. PushSchedule

 -->
</ul>
<a name='conducting' />
<h3>Conducting a study</h3>
<ul>
		<li><a href='usersroles.jsp'>A practical introduction into Users and Roles</a></li>
<!-- deze hierboven nog uitwerken met hoe e.e.a. te doen en aangeven wat er teruggedraaid kan worden -->
		<li><a href='assigningusers.jsp'>Assigning users to sites: why and how</a></li>
</ul>
			
<a name='rules' />
<h3>Rules</h3>
<ul>
	<li><h3>General</h3></li>			 
	<li><a href='findingoids.jsp'>finding OID's for creating a rule</a></li>
	<li><a href='scripttorunarule.jsp'>a script for scheduling a rule</a></li>
	
	<!-- <li><a href='statusofcrf.jsp'>using the status of the CRF in your expression</a></li> -->
	
	<li><h3>DiscrepancyNoteAction</h3></li>		 
	<li><a href='createverysimplerule.jsp'>a simple rule with two items</a></li>


	<li><a href='ctoperator.jsp'>the ct-operator for a rule with a multi-option-item</a></li>
	<li><h3>EMailAction</h3></li>	
	<li><a href='sendingmails.jsp'>using a rule to send a mail</a></li>
	
	<li><h3>ShowAction</h3></li>	
	<li><a href='showhidemulti.jsp'>showing or hiding items on a CRF using a rule</a></li>
	<li><a href='showrig.jsp'>showing a RepeatingItemsGroup</a></li>


	<li><h3>InsertAction</h3></li>	
	<li><a href='defaultrepeatingitems.jsp'>setting defaults for repeating items using the insertaction</a></li>	

</ul>
			
<a name='other' />
<h3>Other</h3>
<ul>
	<li><a href='spss.jsp'>getting the data into SPSS</a></li>
	<li><a href='spsscheckbox.jsp'>checkboxes and multi-selects in SPSS</a></li>
	<li><a href='transformtosas.jsp'>getting the data into SAS</a></li>
	<li><a href='selfsignedcertificate.jsp'>a self-signed certificate for tomcat</a></li>
	<li><a href='testoc36.jsp'>testing OpenClinica 3.12</a></li>
	<li><a href='propertiesfiles.jsp'>properties-files, i18n and translating</a></li>
	<li><a href='backuprestore.jsp'>backup and restore of OpenClinca</a></li>
	<li><a href='restartingtomcat.jsp'>restarting a completely stuck tomcat</a></li>
	<li><a href='settingupatestenvironment.jsp'>setting up a test environment</a></li>

	<li><a href='tomcat6and7.jsp'>running both tomcat 6 and 7</a></li>
	
	<li><a href='createrootalike.jsp'>create a technical administrator, or a root-alike</a></li>
	<li><a href='postgresutils.jsp'>some Postgres-commands that can come in handy</a></li>
	<li><a href='schemaspy.jsp'>SchemaSpy: a graphical representation of the database</a></li>
	<li><a href='datalisting.jsp'>datalisting</a>, or making a paper printout of your data (MsAccess)</li>
	<li><a href='manuals.jsp'>two manuals</a> for your end-users, if you're short of time</li>
	<li>the <a href='/tds/workshop_javascript/index.jsp'>workshop java-script</a> as given on the OC15</li>
			
<!-- 
			<li><a href='.jsp'>logging OpenClinica and Tomcat</a>
			see <Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"  
               prefix="localhost_access_log." suffix=".txt" pattern="common" resolveHosts="false"/>
               in server.xml and lgging.properties</li>
            iets over validaties op 3 nivo's: bijv int of width, in xl en met rules
			<li><a href='.jsp'>making a connector for IIS to Tomcat</a></li>
			<li><a href='.jsp'>setting the maximum memory size</a></li>
			<li><a href='.jsp'>setting the run-at startup parameter</a></li>
 -->
			</ul>
<a name='webservices' />
<h3>Web-services</h3>
<ul>
<li><a href='wssetup.jsp'>get those services running</a></li>
<li><a href='wsclient.jsp'>using web-services to add subjects and schedule events</a></li>
<li><a href='capacity.jsp'>using web-services to test the capacity of OpenClinica</a></li>
<!-- 

 -->
</ul>
			
			<p>A lot of the information here was also submitted to the <a href='http://en.wikibooks.org/wiki/OpenClinica_User_Manual'target='_blank'>
			WikiBook OpenClinica User Manual</a>. </p>

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

<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
