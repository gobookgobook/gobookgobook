/**
 * 
 */

var map;
var geocoder;

function initMap(count) {
	map = new google.maps.Map(document.getElementById('map'), {
		zoom : 7,
		center : {
			lat : 35.8240220,
			lng : 127.9265940,
		}
	});
	
	geocoder = new google.maps.Geocoder();
	
	for(var i=0;i<count;i++){
		geocodeAddress(document.getElementById('add_'+i).value);
	}
	
}

function geocodeAddress(locationAddress) {
	var address = locationAddress;
	var resultsMap=map;

	geocoder.geocode({
		'address' : address
	}, function(results, status) {
		if (status === google.maps.GeocoderStatus.OK) {
				var marker = new google.maps.Marker({
				map : resultsMap,
				position : results[0].geometry.location,
				title: address
			});
			
			marker.addListener('click', function() {
				map.setZoom(16);
				map.setCenter(marker.getPosition());
			});
		} else {
			alert('Geocode was not successful for the following reason: '+ status);
		}
	});
}
