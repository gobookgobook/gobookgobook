/**
 * 
 */

var map;
function initMap(latlngList) {
	var arr = latlngList.split(",");
	var latlngArr = new Array();
	
	for(var i=0; i<arr.length;i++){
		latlngArr[i]=arr[i].trim();
	}
	
	for(var i=0; latlngArr[i].length;i++){
		alert(latlngArr[i]);
	}
	
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom : 7,
		center : {
			lat : 35.8240220,
			lng : 127.9265940,
		}
	});

	setMarkers(map);
}

// Data for the markers consisting of a name, a LatLng and a zIndex for the
// order in which these markers should display on top of each other.


var beaches = [ [ 'Bondi Beach', -33.890542, 151.274856, 4 ],
		[ 'Coogee Beach', -33.923036, 151.259052, 5 ],
		[ 'Cronulla Beach', -34.028249, 151.157507, 3 ],
		[ 'Manly Beach', -33.80010128657071, 151.28747820854187, 2 ],
		[ 'Maroubra Beach', -33.950198, 151.259302, 1 ] ];

function setMarkers(map) {
	// Adds markers to the map.
	for (var i = 0; i < beaches.length; i++) {
		var beach = beaches[i];
		var marker = new google.maps.Marker({
			position : {
				lat : beach[1],
				lng : beach[2]
			},
			map : map,
			title : beach[0],
			zIndex : beach[3]
		});
	}
}