function loadJSON(callback) {
	var xobj = new XMLHttpRequest();
 	xobj.overrideMimeType("application/json");
 	xobj.open('GET', 'parking-citation.json', true); 
 	xobj.onreadystatechange = function () {
	 	if (xobj.readyState == 4 && xobj.status == "200") {
	 		callback(JSON.parse(xobj.responseText));
	 	}
 	};
 	xobj.send(null); 
 	console.log(xobj);
 }


var map;
function initMap() {
	map = new google.maps.Map(document.getElementById('map'), {
	  zoom: 2,
	  center: new google.maps.LatLng(2.8,-187.3),
	  mapTypeId: 'terrain'
	});

	// Create a <script> tag and set the USGS URL as the source.
	var script = document.createElement('script');
	// This example uses a local copy of the GeoJSON stored at
	// http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_week.geojsonp
	script.src = 'https://developers.google.com/maps/documentation/javascript/examples/json/earthquake_GeoJSONP.js';
	document.getElementsByTagName('head')[0].appendChild(script);
}

loadJSON(function(jsn) { 

	for (var i = 0; i < jsn.results.length; i++) {
		// console.log(jsn.results[i].geometry.coordinates);
		var coords = jsn.results[i].geometry.coordinates;
		  var latLng = new google.maps.LatLng(coords[1],coords[0]);
		  var marker = new google.maps.Marker({
		    position: latLng,
		    map: map
		  });
	}

});

