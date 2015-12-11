/**
 * 
 */

function locationWriteMapToServer(root,locationForm){
	var sendData=locationForm.location_address1.value;
	var url ="https://maps.googleapis.com/maps/api/geocode/json?address="+sendData+ "&sensor=true";
	//alert(url);
	
	$.ajax({
		url : url,
		type : "get",
		dataType : "text",
		success : function(data) {
			//alert(data);
			process(data,locationForm);

		},
		error : function(xhr, status, errorMsg) {
			alert(xhr + "," + status + "," + errorMsg);
		}
	});
	
}

function process(data,locationForm){
	var obj = JSON.parse(data);
	var getLat = obj.results[0].geometry.location.lat;
	var getLng = obj.results[0].geometry.location.lng;

	var addTitle = obj.results[0].formatted_address;

	var getLatLng = {
		lat : getLat,
		lng : getLng
	};

	var myOptions = {
		zoom : 16,
		center : getLatLng,
		mapTypeId : google.maps.MapTypeId.ROADMAP
	}
	var geocoder = new google.maps.Geocoder();

	map = new google.maps.Map(document.getElementById("map"), myOptions);

	//클릭했을 때 이벤트
	var fullAddress;
	google.maps.event.addListener(map,'click',function(event) {
		geocoder.geocode({'latLng' : event.latLng},function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
			/*
				좌표를 주소로 변환 시키는 geocoder를 실행합니다.
				만약 성공적으로 변환이 되었다면, status라는 상태변수가 참이 되어 아래의 코드들이 실행됩니다.
			 */
				if (results[1]) {
					fullAddress = results[1].formatted_address;
					
					locationForm.address2Disp.value=fullAddress;
					locationForm.location_address2.value=fullAddress;
					locationForm.latLng.value=event.latLng;
					
					addMarker(event.latLng);
				}
			} else {
				alert("Geocoder failed due to: "+ status);//만약 geocoder가 실패시 알림창을 출력합니다.
			}
		});
		
		map.addListener('click', function(event) {
			deleteMarkers();
	  	});
		
	});
	//클릭 했을때 이벤트 끝
	
	//인포윈도우의 생성
	var infowindow = new google.maps.InfoWindow({
		content : addTitle,
		size : new google.maps.Size(50, 50),
		position : getLatLng
	});
	infowindow.open(map);
}

var map;
var markers = [];

// Adds a marker to the map and push to the array.
function addMarker(location) {
	var marker = new google.maps.Marker({
		position: location,
		map: map
	});
	markers.push(marker);
}

// Sets the map on all markers in the array.
function setMapOnAll(map) {
	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(map);
	}
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
	setMapOnAll(null);
}

// Shows any markers currently in the array.
function showMarkers() {
	setMapOnAll(map);
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers() {
	clearMarkers();
	markers = [];
}