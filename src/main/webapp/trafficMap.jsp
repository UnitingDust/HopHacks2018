<script>

var map;
var point_markers = [];
var area_markers = [];
function initMap() {
	map = new google.maps.Map(document.getElementById('map'), {
	  zoom: 12,
	  center: new google.maps.LatLng(39.319,-76.607),
	  mapTypeId: 'terrain'
	});
	
	drawPoints(${hotspots});
	drawAreas(${hotspots});
	// displayPoints(${hotspots});

	// loadJSON(function(jsn) { 

	// });
}

$(document).ready(function() {
	displayFilters();
	$('#points').html("<p class='no-points'>There are no points selected<p>");
});

function updateMap(hotspots) {
	for (var i = 0; i < point_markers.length; i++) {
		point_markers[i].setMap(null);
	}

	for (var i = 0; i < area_markers.length; i++) {
		area_markers[i].setMap(null);
	}

	point_markers = [];
	area_markers = [];
	drawPoints(hotspots);
	drawAreas(hotspots);

}

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
 	//console.log(xobj);
 }

function drawPoints(hotspots) {
	for (var i = 0; i < hotspots.length; i++) {
		var hotspot = hotspots[i];
		for (var j = 0; j < hotspot.incidents.length; j++) {
			var incidents = hotspot.incidents[j];
			//console.log(incidents);
			// console.log(jsn.results[i].geometry.coordinates);
			var coords = incidents.coordinate;
			var latLng = new google.maps.LatLng(coords.y,coords.x);
			var marker = new google.maps.Marker({
				position: latLng,
				map: map,
				obj: hotspot.incidents[j],
				animation: google.maps.Animation.DROP
			});

			marker.addListener('click', function() {
				displayPoints([this.obj], "Point");
			});

			point_markers.push(marker);
		}
	}
}

function drawAreas(hotspots) {
	for (var i = 0; i < hotspots.length; i++) {
		var loc = hotspots[i].location
		var latLng = new google.maps.LatLng(loc.y, loc.x);
		var marker = new google.maps.Marker({
			position: latLng,
			map: map,
			incidents: hotspots[i].incidents,
			numIncidents: hotspots[i].numofIncidents,
			icon: {
				path: google.maps.SymbolPath.CIRCLE,
				fillColor: 'red',
				fillOpacity: 0.2,
				scale: 20,
				strokeColor: 'white',
				strokeWeight: .5
			}
		});

		marker.addListener('click', function() {
			displayPoints(this.incidents, "Area");
		});

		area_markers.push(marker);
	}
}

// k. change implementation to accept area object instead
function displayPoints(points, point_type) {
	if (point_type === "Area" ) {
		var participle = points.length > 1 ? 'cases' : 'case';
		$('#header h2').text('Incidents (' + points.length + ' ' + participle + ')');
	} else {
		$('#header').html('<h2>Incident</h2>');
	}


	$('#points').html(""); // k. clears the html in #points
	var point_class = "point_icon";
	for (var i = 0; i < points.length; i++) {
		console.log(points[i]);
		$('#points').append('<span class="point_container"><div class=' + point_class + '></div>' + 
			'<span class="p_info_container"><p class="p_info"><b>Coordinates</b>' + points[i].coordinate.x+', '+points[i].coordinate.y+'</p>' +
			'<p class="p_info"><b>Address</b>' + points[i].address + '</p>' +
			'<p class="p_info"><b>Notes</b>' + points[i].notes + '</p>' +
			'<p class="p_info"><b>Manufacturer</b>' + points[i].manufacturer + '</p>' +
			'<p class="p_info"><b>Plate</b>' + points[i].plate + '</p>' +
			'<p class="p_info"><b>Date</b>' + points[i].cleanDate + '</p></span>' +
			'</span>');
	}
}

// HELPER FUNCTIONS

function getCircle(magnitude) {
	return {
		path: google.maps.SymbolPath.CIRCLE,
		fillColor: 'red',
		fillOpacity: .2,
		scale: Math.pow(2, magnitude) / 2,
		strokeColor: 'white',
		strokeWeight: .5
	}
}

function displayFilters () {
	for (var i = 0; i < uniqueNotes.length; i++) {
		$('#notes_select').append('<option value=' + uniqueNotes[i].split(" ").join("_") + '>' + uniqueNotes[i] + '</option>');
	}
}

function filterPointsByNotes() {
	$('#points').html("<p class='no-points'>There are no points selected<p>"); // k. clear the displayed points
	$.ajax({
		  type: 'POST',
		  url: "/main",
		  data: {
			  value_notes: $('#notes_select').val(),
			  value_date: $('#date_select').val()
		  },
		  success: function( data ) {
		  	updateMap(JSON.parse(data));
		  }
		 });
}

function filterPointsByDate () {
	$('#points').html("<p class='no-points'>There are no points selected<p>");  // k. clear the displayed points
	$.post("/main", {
		value_notes: $('#notes_select').val(),
		value_date: $('#date_select').val()
	}, function( data ) {
		updateMap(JSON.parse(data));
	});
}

function filterPointsByVisibility () {
	var val = $('#visibility_select').val();
	console.log(val);
	if (val === "areas") {
		// k. wipe point markers
		for (var i = 0; i < point_markers.length; i++) {
			point_markers[i].setMap(null);
		}

		// k. show area markers
		for (var i = 0; i < area_markers.length; i++) {
			area_markers[i].setMap(map);
		}
	} else if (val === "points") {
		// k. wipe area markers
		for (var i = 0; i < area_markers.length; i++) {
			area_markers[i].setMap(null);
		}

		// k. show point markers
		for (var i = 0; i < point_markers.length; i++) {
			point_markers[i].setMap(map);
		}
	} else {
		// k. show point markers
		for (var i = 0; i < point_markers.length; i++) {
			point_markers[i].setMap(map);
		}

		// k. show area markers
		for (var i = 0; i < area_markers.length; i++) {
			area_markers[i].setMap(map);
		}
	}
}

// HARDCODED VARIABLES

var uniqueNotes = ['All Violations', 'Red Light Violation', 'Right on Red',
                     'All Other Parking Meter Violations', 'Expired Tags',
                     'Mobile Speed Camera', 'Fixed Speed Camera',
                     'Residential Parking Permit Only',
                     'No Stopping/Standing Not Tow-Away Zone',
                     'No Stop/Park Street Cleaning',
                     'Obstruct/Impeding Movement of Pedestrian',
                     'All Other Stopping or Parking Violations',
                     'Less Than 15 feet from Fire Hydrant',
                     'No Stopping/Standing Tow Away Zone',
                     'No Parking/Standing In Transit Stop', 'Passenger Loading Zone',
                     'No Stopping//Parking Stadium Event Camden',
                     'Obstruct/Impeding Flow of Traffic', 'No Stop/Park Handicap',
                     'Exceeding 48 Hours', 'Commercial Veh/Residence under 20,000 lbs',
                     'Abandonded Vehicle', 'Fire Lane/Handicapped Violation',
                     'No Parking/Standing In Bus Stop/Bus Lane',
                     'No Parking/Standing In Bike Lanes',
                     'Commercial Veh/Residence over 20,000 lbs',
                     'Old Fixed Speed Camera',
                     'Obstructing/Imped Traffic Xwalk/inter/school',
                     'Blocking Garage or Driveway',
                     'Commercial Vehicle Obstruct/Imped Traffic Flow',
                     'Less 30\x92 from Intersection', 'In Taxicab Stand',
                     'No Stop/Stand/Park Cruising',
                     'No Parking/Stand Motor Home/Campr/Travel Trailer',
                     'No Stopping or No Parking Pimlico Event',
                     'No Parking/Standing Vendor Truck',
                     'Unlawful Dumping/Waste Hauler w/o Permit',
                     'Snow Emergency Route Violation', 'Res. Park Permit 4th Offense',
                     'No Stopping/Parking Stadium Event \x96 33rd']   
                     
 </script>