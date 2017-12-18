<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: deselecting a radio button" /> 
<meta name="keywords" content="openclinica 3.x training  open source software clinical trials datamanagement 
non-profit academic edc" /> 

<title>TrialDataSolutions: deselecting a radio button</title>
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
<script src="/tds/js/highlight.pack.js" type="text/javascript"></script>
<script>hljs.initHighlightingOnLoad();</script>
</head>

<body>

<%@ include file="/includes/headermenu.jsp" %>
<hr />

<div id="wrap" class="group">
  
  <div class="main">    
    
    <div class="entry group">

<h3>deselecting a radio button</h3>
      
<p>One of the nice features of OpenClinica is the SimpleConditionalDisplay. It's straightforward: for example if a user enters 
<b>Yes</b>, the Informed Consent was signed, then an item for the Consent date is shown. 
If the user then thinks 'that is not correct, the answer must be <b>No</b>' and he/she selects that, the item for Consent date is hidden again. 
And if the date has already been entered, then a warning is displayed, saying something like 'please remove the Consent date.' <br />
So far so good, but sometimes the items that are shown using SimpleConditionalDisplay are radio-buttons. You answer <b>Yes</b> and 
other items with radio-buttons are shown and you select them and only then you realise that the first answer should have been <b>No</b>
and now you're stuck. You want to save the CRF, but in order to do this you must deselect the radio-buttons, and that is not possible.</p>

<p><img src='/tds/img/ImagesHowTo/deselectradio/dr01.jpg' border='0'  class='photo'/><br />
fig. 1: example of a warning</p>

<h3>let's add some script</h3>
<p>In order to do this, we must add some java-script to our CRF, in the Right_Item_Text of the item with the radio-buttons. 
Below is the script plus an explanation of the workings, but
if you can't wait to see it in action, click <a href='/tds/CRFExamples/DeselectRadio.zip' target='_blank'>here</a> for the XL-file.</p>

<pre><code class="javascript">
&lt;img id="undoradio1" src="images/bt_Restore.gif"&gt;
&lt;script src="includes/jmesa/jquery.min.js"&gt;// for OC versions before 3.1.4, use jquery-1.3.2.min.js !&lt;/script&gt;
&lt;script lang="Javascript"&gt;
$.noConflict();
jQuery(document).ready(function($){
 $("#undoradio1").click(function (e) {
 for (i = 0; i &lt; radioGroup1.length; i++) { radioGroup1[i].checked = false;  }
 radioGroup1.change();
  });
 // identify the group radio buttons
 var radioGroup1 = $("#undoradio1").parent().parent().find("input");
});     
&lt;/script&gt;
</code></pre>

<p>As you can see we first put an icon in the Right_Item_Text and for this we use the default 'undo'-icon of the OpenClinica interface.
We give this icon an ID, <b>undoradio1</b> and we use this to make a reference to the group with the radio-buttons:
<b>var radioGroup1 = $("#undoradio1").parent().parent().find("input");</b>.<br />
We then define what to do when the undo-icon is clicked, namely: loop through all the elements of the radio-group and set them to 
not chosen: <b>for (i = 0; i &lt; radioGroup1.length; i++) { radioGroup1[i].checked = false;</b>. <br />
As a last step we set the change-status of the radio-group, which activates the red and yellow icon on the CRF that indicates there 
are unsaved data: <b>radioGroup1.change();</b>.</p>

<h3>must I repeat that for each and every radio group?</h3>
<p>If you want to be able to deselect more than one radio-group, you can copy the above code and change <b>undoradio1</b>
to <b>undoradio2</b>, <b>undoradio3</b>, etc. but that looks messy. Thomas Kissner modified the code, so that you can make
a function of the deselecting and call that function, every time an image of a certain class is clicked. Sounds difficult?
Look at the code. First the part in the RIGHT_ITEM_TEXT: <br />
<b>&lt;img class="undoradio_for_all_img" title="Click to deselect entry" alt="Click to deselect entry" src="images/bt_Restore.gif"&gt;</b>.<br /> 
That is more or less the same as we saw before: add the image. But as an extra, we add a class to the image.
Now we can use that for our function and because we want to define that just once, we put it in the instructions part of
our CRF:</p>
<pre><code class="javascript">&lt;script src="includes/jmesa/jquery.min.js"&gt;// for OC versions before 3.1.4, use jquery-1.3.2.min.js !&lt;/script&gt;
&lt;script&gt;
$.noConflict();
jQuery(document).ready(function($) {
 $("img.undoradio_for_all_img").each(function () {
  $(this).click(function (e) {
   var radiogroup = $(this).parent().parent().find("input");
   for (i = 0; i &lt; radiogroup.length; i++) { 
    radiogroup[i].checked = false;
   }
  });
  }); 
});
&lt;/script&gt;</code></pre>
<p>Many thanks, Thomas Kissner.</p>

<h3>but I need this in a repeating item group</h3>
<p>What puzzled me for a long time was: how do I apply this in a RepeatingItemGroup? The problem is that you cannot place an 
undo-button, or any other object for that matter, somewhere in the table that is used for the RIG. I thought. But again Thomas came to the rescue!
He made a script that used the function <b>.after</b>, which does more or less what it promises: it places something after an object. 
Together we came up with the following:</p>

<pre><code class="javascript">
&lt;div id="UndoRadio_Col"&gt;&lt;/div&gt;
&lt;script type="text/JavaScript" language="JavaScript" src="includes/jmesa/jquery.min.js"&gt;&lt;/script&gt;
&lt;script&gt;
$.noConflict();
jQuery(document).ready(function($){
  function Display_Undo_Buttons_In_Column(ColNo){
    $('#UndoRadio_Col').parent().parent().parent().parent().find('tbody &gt; tr:visible').each(function(i){
      // only add the undo image, if it doesn't exist
      if ($(this).children('td:nth-child('+ColNo+')').find('.undoradio').length == 0){
        //if the radio's are vertical, then br-tags exist, so put the undo button after the last br
        if ($(this).children('td:nth-child('+ColNo+')').children('br').length != 0){
          $(this).children('td:nth-child('+ColNo+')').children('br').last().after("&lt;img class='undoradio' title='Click to deselect entry' alt='Click to deselect entry' src='images/bt_Restore.gif'&gt;"); 
        }
        else{
          //if the radio's are horizontal, add the undobutton after the last radio-button of the group
          $(this).children('td:nth-child('+ColNo+')').children('input[type=radio]').last().after("&lt;img class='undoradio' title='Click to deselect entry' alt='Click to deselect entry' src='images/bt_Restore.gif'&gt;"); 
        }
      }
    });
  };
  function UndoRadio(){
    $("img.undoradio").each(function (){
      $(this).click(function (e){
        var groupName = $(this).parent().find('input[type=radio]').attr('name');
        var radioGroup1 = $(this).parent().parent().find('input[name="'+groupName+'"]');
        for (i = 0; i &lt; radioGroup1.length; i++){ 
          radioGroup1[i].checked = false;
        }
        radioGroup1.change();
      });
    });
  }; 
  //repeat the procedure when the add-button is clicked
  $('.button_search').click(function(){
    Display_Undo_Buttons_In_Column(3);
    Display_Undo_Buttons_In_Column(5);
    Display_Undo_Buttons_In_Column(7);
    UndoRadio();
  });
  //and run the procedure when the doc is loaded
  Display_Undo_Buttons_In_Column(3);
  Display_Undo_Buttons_In_Column(5);
  Display_Undo_Buttons_In_Column(7);
  UndoRadio();
});
&lt;/script&gt;

</code></pre>
<p>Neat, isn't it?</p>
<p>First of all a word of warning: if you copy this code and paste it into your XL you may run out of space, as the limit is
2000 characters. To get (just) under this, replace all two spaces with one.</p><p>
I'm sure you would like to have some subtitles with that.<br /> The main thing in the script is the function <b>Display_Undo_Buttons_In_Column(ColNo)</b> 
which takes as parameter the column-number. First you loop through all the rows of the table with 
<b>find('tbody &gt; tr:visible').each(function(i)</b> and in each row you go to the column with index ColNo: <b>$(this).children('td:nth-child('+ColNo+')')</b>.
Then you first check if there is already an undo-button, or rather: you check if anything of class <b>.undoradio</b> exists in that column.
(Don't worry, we'll explain later when this is the case.)<br />
Now we have two options: the radio buttons are horizontal or vertical.
If they are vertical, then each option ends with a <b>br</b> so we place our undo-button after the last one:
<b>children('br').last().after</b>. If on the other hand the radio's are horizontal, then we go looking for the last radio and place
the undo-button there: <b>children('input[type=radio]').last().after</b><br />
Once we have the buttons, we must tell what to do when one is clicked and this is done in the same way as described above, using
<b>function UndoRadio()</b>. Or: almost the same way. This time we capture the name of the radio button and then uncheck all radio's
with that same name.</p>
<p>Of course in most cases we do not know how many rows there will be, because of the Add-button. The click-event of this button already has 
script assigned to it, but fortunately this button also has a class, <b>.button_search</b>, so what we in fact do is say:
everytime an object of class .button_search is clicked, then please add undo-buttons. And that is the reason why we had to check first if there
was already an undo-button. </p>

<p><img src='/tds/img/ImagesHowTo/deselectradio/dr06.jpg' border='0'  class='photo'/><br />
fig. 2: deselecting in a group</p>


<h3>does it really, really work?</h3>

<p>You may ask 'does it really work?' and the answer is of course: 'implement it and watch the radio-buttons in your CRF' 
but that is probably not what you mean. You want to know if all these activities are stored correctly. 
Well, let's have a look at the audit-trail. In the next screenshot you see the trail after entering data in the CRF and then
marking it complete.</p>

<p><img src='/tds/img/ImagesHowTo/deselectradio/dr02.jpg' border='0'  class='photo'/><br />
fig. 3: audit trail after initial entry</p>

<p>Now we realize our mistake and we open the CRF again and deselect the radio-groups 2 and 3. Before changing the first answer,
we click Save and then we're prompted to give a ReasonForChange. We provide this by (manually) creating Discrepancies in the normal way.
Then we change the value of the first question and then we click Save and we're prompted one last time for a ReasonForChange-Discrepancy.</p>

<p><img src='/tds/img/ImagesHowTo/deselectradio/dr03.jpg' border='0'  class='photo'/><br />
fig. 4: making changes</p>

<p>And the audit-trail records all these activities correctly:</p>

<p><img src='/tds/img/ImagesHowTo/deselectradio/dr04.jpg' border='0'  class='photo'/><br />
fig. 5: audit trail after changes</p>


<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#crfs'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed April 2015</p>
    </div>

  </div> <!-- /.main -->
  
<%@ include file="/includes/footerhowto.jsp" %>
  <hr />
<%@ include file="/includes/footer.jsp" %>

</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
