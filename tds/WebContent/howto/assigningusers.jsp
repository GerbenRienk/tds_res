<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: assigning users to sites, why and how" /> 
<meta name="keywords" content="openclinica training open source software clinical trials datamanagement 
non-profit academic edc free gratis database medisch onderzoek ecrf assigning users to sites" /> 

<title>Trial Data Solutions: assigning users to sites, why and how</title>
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
<h3>Assigning users to sites, why and how</h3>
<p>Most of the OpenClinica users will start experimenting with OpenClinica on a stand-alone machine,
doing everything as "root". But as soon as things get serious and more users are involved an installation on 
a server is required. And different user-access-levels are what you want: you'll create some users as data-entry persons, 
some as Monitor, etc.<br />
All this is quite straight forward and we won't get into detail, but one thing is not so obvious: how do you assign 
users to sites? And first of all: why should you?</p>
<h3>Why assign users to sites?</h3>	
<p>That's an easy one: because you are required to do so. It is good clinical practice to limit what (trained) users can do
to the subjects they are responsible for. And the other way round: to ensure that only authorized people can
access and edit the data. Even if you're not very much interested in GCP: it is safer to limit user's access to their "own" 
subjects. And even if you're not interested in "safer": your sites will like it if they can be sure
others can't access or edit "their" data.</p>

<h3>How do you assign users to sites?</h3>
<p>In these instructions we will set up for study with "Unique Protocol ID" TDS005,
two data-entry-persons UserA and UserB for sites A (Amsterdam) and B (Barcelona). 
</p>

<p>Start with creating the sites. This is done in "Tasks"-"Build Study" menu option. In the 
Build-Study-screen this is task number 6 "Create sites". Just click on the plus-sign in the right column and fill 
in the details of the sites that will participate. It is not obligatory to fill in everything, but as usual, you must 
complete the items with an asterisk. (And it's convenient to give "Facility City:", because this is used as your default 
location when creating a new event.) <br />
Use for Site Name "TDS005 Amsterdam" and not just "Amsterdam" and use for the Unique Protocol ID "TDS005_A". Using your 
Study OID in the name of your site will help you, when you will look at your user-list later. 
And using it in the Protocol ID will make it easier to keep it unique.</p>

<p>
<img src='/tds/img/ImagesHowTo/UsersPerSite/SiteA.jpg' border='0'  class='photo'/><br />
fig. 1: Build Study: Sites, Site details 
</p>


<p>You may not have realized this, but the above steps can only be done if your "current study" is the study as a whole. 
"What else can it be?" you may think, but if you click the menu option in the top of your screen, left of the middle,
called "Change Study/Site".</p> 

<p>
<img src='/tds/img/ImagesHowTo/UsersPerSite/ChangeStudySite.jpg' border='0'  class='photo'/><br />
fig. 2: Change Study/Site
</p>		

<p>Here you'll get a choice of studies and under your current study you will see your two new sites
"TDS005 Amsterdam" and "TDS005 Barcelona". Choose site "TDS005 Amsterdam". 
You must now click the button labeled "Confirm study", which sounds odd, as you don't switch
to a study, but to a site. But to a very deep level <b>studies and sites are the same!</b> (We will not discuss the
 consequences here, but this means among other things that you can use different versions of a CRF as default for different
 sites. Or you can hide CRF's  for one site and show it to another. Or you can lock or freeze a site.)<br />
You'll now see "Confirm Changing Study You are choosing to switch to the study: TDS005 Amsterdam with a role of Study Director."
Click the button "Confirm". In the top of your screen you now see the name of your study, plus the name of your site.<br />
If you go to menu option "Tasks"-"Study Setup" the menu option "Build Study" has disappeared.
</p>
<p>
Next thing to do is create two users: UserA and UserB. You do this in menu-option "Tasks"-"Administration"-"Users" (and not in 
"Tasks"-"Study Setup"-"Users"). Create the two accounts and choose for "Active Study" not the whole study, but one site. Again: 
very easy.
</p> 
<p>If you want to assign <b>existing users</b> to new study-sites, this procedure is slightly different. If you did not already 
switch to "TDS005 Amsterdam" as described above, do so now. Then you use "Tasks"-"Administration"-"Users". 
The screen is titled "Manage All Users In TDS005 Amsterdam". Click on "Assign new user to current study" and notice that 
here again the term "study" is used and not "site". A list of all available users is displayed: scroll through the pages for your
user and choose as Role "Clinical Research Coordinator" (if you need a data-entry-person) and check the box in the column 
"selected".	Click button "Submit" and you're ready. To assign UserB to Barcelona, first switch Study/Site to "TDS005 Barcelona"
and repeat the other steps.</p>

<p>To see the results, go to menu option "Tasks"-"Administration"-"Users". In the list of users, you will see for 
UserA "TDS005 Amsterdam", among other studies and sites. If you're consequent in your naming of sites, 
you will have no difficulty in distinguishing between studies and sites.</p>

<p>
<img src='/tds/img/ImagesHowTo/UsersPerSite/Users.jpg' border='0'  class='photo'/><br />
fig. 3: List of users
</p>		

<h3>create a site Test&amp;Training</h3>
<p>While you're in the process of creating sites, also create a site called <b>Test&amp;Training</b>.
This gives you the option to train new Users in 100% the same Study as the production Study. If you're working according to GCP,
you should allow only qualified users to your production environment, so design a test for your users and only after they have
successfully completed this test in the Site Test&amp;Training they will get access to the "real" sites.
</p>

<p>More how-to-pages can be found <a href='/tds/howto/index.jsp#conducting'>here</a>.</p>			
		</div>

	</div> <!-- /.main -->
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
