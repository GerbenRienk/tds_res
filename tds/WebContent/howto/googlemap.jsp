<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="OpenClinica: using a Google map in your CRF" /> 
<meta name="keywords" content="openclinica 3.1 training  open source software clinical trials datamanagement 
non-profit academic edc datefield calculation Google map" /> 

<title>TrialDataSolutions: using a Google map in your CRF</title>
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
<div class="entry group">
		
		
		

<h1>a clickable Google map: cool!</h1>
			
<p>It is not often, but you may find yourself in a position where the only sensible thing to do is use a clickable Google map.
Not because it is fun to do it, not because it looks cool, no: because it is user-friendly when you are asking for a location. (But it does look cool.) <br />
Whatever you may think of Google in general and maps in particular: it is used on a huge scale, which means that you can find plenty of examples
and that the api will most likely be supported for the duration of your study. Let's see how we can get a CRF like the one listed below.
It has just one item and the map. When you click the map, the coordinates are copied to the CRF-item. When you save the CRF and open it again, a marker
is placed.</p>
<p>If that's all you're looking for and you can't wait to start using it: 
<a href='/tds/CRFExamples/CRFWithClickableGoogleMap.zip'>here's the CRF</a>.</p>


<p><img src='/tds/img/ImagesHowTo/googlemap/gm01.PNG' border='0'  class='photo'/><br />
fig. 1: what we want </p>

<h1>tell me more</h1>
<p>The script is of course a bit different from our usual scripts, but it's quite understandable. </p>
<p>(Below is the script as used in the downloadable CRF, but with comments. We are
pushing the OpenClinica-limits somewhat by using almost 2000 characters in the right_item_text. So if you want to
copy and paste the script from this page, remove all comments and all spaces!)</p>


<pre><code>&lt;div id="map_canvas" style="width: 400px; height: 250px"&gt;&lt;/div&gt;

&lt;script src="includes/jmesa/jquery.min.js"&gt;&lt;/script&gt;
&lt;script type="text/javascript" src="https://maps.google.com/maps/api/js?"&gt;&lt;/script&gt; 
&lt;script lang="Javascript"&gt; 
$.noConflict();
jQuery(document).ready(function($){
  //find the CRF item with the coordinates
  var fldCoord = $("#map_canvas").parent().parent().find("input");
  //we will need a map
  var map = null;
  //and a marker, which is the red pin to mark the location
  var marker = null;
  var d_array;
  var d_lat;
  var d_lng;
  var coord;
  //the info window is used to provide extra information about the location
  var infowindow = new google.maps.InfoWindow( {  size: new google.maps.Size(150,50) });

  //define what happens when a marker is created
  function createMarker(latlng, name, html) {
    var marker = new google.maps.Marker({
      position: latlng,
      map: map,
      zIndex: Math.round(latlng.lat()*-100000)&lt;&lt;5
      });
    //start listening the marker is clicked and then do the following
    google.maps.event.addListener(marker, 'click', function() {
      infowindow.setContent(html); 
      infowindow.open(map,marker);
    });
    //once you have created a new marker, click it also, because we want to see the info window
    google.maps.event.trigger(marker, 'click'); 
    return marker;
    }

  function initMap() {
    //are the coordinates already in the CRF?
    if (fldCoord.val()){
      //if so, then use these to set the center of the map that we will draw
      var sc = fldCoord.val();
      sc = sc.substring(1, sc.length -1);
      d_array = sc.split(",");
      d_lat = parseFloat(d_array[0]);
      d_lng = parseFloat(d_array[1]);
      coord = new google.maps.LatLng(d_lat, d_lng);
    }else{
      //no coordinates yet, so take the default: Amsterdam
      coord = new google.maps.LatLng(52.34147481539552, 4.904078543186188);
    }
    //now define all the aptions for the map ad put them in one array
    var myOptions = {
      zoom: 12,
      center: coord,
      mapTypeControl: true,
      mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DROPDOWN_MENU},
      navigationControl: true,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    //now draw the map in the div with id map_canvas and use the options we defined in the array
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
 
    //start listening if the map is clicked and if so, do the following
    google.maps.event.addListener(map, 'click', function(event) {
      if (marker) {
        //if there is already a marker, remove it
        marker.setMap(null);
        marker = null;
      }
      //create a new marker ...
      marker = createMarker(event.latLng, "name", "&lt;b&gt;New location&lt;/b&gt;&lt;br&gt;"+event.latLng);
      //... and write the coordinates to the CRF-item
      fldCoord.val(""+event.latLng);
      fldCoord.change();
    });
  } // end of initMap()
  
  //draw the map
  initMap();
  //if we have coordinates, create a marker
  if (fldCoord.val()){
    createMarker(coord, "name", "&lt;b&gt;Saved location&lt;/b&gt;");
  }
})
&lt;/script&gt; 
</code></pre>

<h1>please explain</h1>
<p>In order to be able to use a map, we must include the api from google<br />
<b>script type="text/javascript" src="https://maps.google.com/maps/api/js?"</b><br />
Note the <b>https</b>: you can not include an http-file in an otherwise https-page.<br />
The place, or <b>div</b>, for the map is defined at the top. Then we include jquery and we define what variables we will use, like 
<b>var fldCoord</b>, <b>var map</b>, etc. Next we define two functions: <b>initMap()</b> and <b>createMarker()</b>.</p>
<p>Now everything is in place, so we draw the map by calling <b>initMap();</b>. And we create a marker, if the CRF-item has coordinates.<br />
<b>if (fldCoord.val()){<br />
&nbsp;&nbsp;createMarker(coord, "name", "<b>Saved location</b>");<br />
&nbsp;}</b></p>
<p>In this example we treated the coordinates as one item: but of course they are two variables of type <b>long</b>. The conversion from string to two longs
is done by first taking the actual value in the CRF-item, for example <b>(52.34147481539552, 4.904078543186188)</b> and storing it in a variable called <b>sc</b>
. Then we chop of the first and last character with <b>sc = sc.substring(1, sc.length -1);</b> so that makes <b>52.34147481539552, 4.904078543186188</b>.
Then we transform this string into an array, by splitting it at the comma: <b>d_array = sc.split(",");</b>. And now we can use the first and the second
element of this array as the latitude and longitude of a location.</p> 


<h1>want more?</h1>
<p>Other how-to-pages can be found <a href='/tds/howto/index.jsp#crfs'>here</a>.<br />
More about java-script can be found <a href='/tds/workshop_javascript/index.jsp'>here</a>.</p>
<p class='pagereviewdate'>this page was last reviewed January 2016</p>
		

	
	
<%@ include file="/includes/footerhowto.jsp" %>
	<hr />
<%@ include file="/includes/footer.jsp" %>
</div>
</div> <!-- /wrap -->

<!-- c(~) -->
</body>
</html>
