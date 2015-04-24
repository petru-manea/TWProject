// Note: This example requires that you consent to location sharing when
// prompted by your browser. If you see a blank space instead of the map, this
// is probably because you have denied permission for location sharing.

var map;
var infowindow;
var pos;
var inputSearch;
var markersFound = [];
var popupClose;
var searchBox;
var CurentLat;
var CurentLong;

function initialize() {	
  var mapOptions = {
	  zoom: 14
  };

  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  // Try HTML5 geolocation
  if(navigator.geolocation) {
  
		navigator.geolocation.getCurrentPosition(function(position) {
		  pos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
      CurentLat = position.coords.latitude;
      CurentLong = position.coords.longitude;

      var myRadius = new google.maps.Circle({
      center: pos,
      radius: 2500,
      strokeColor: "gray",
      strokeOpacity:0.3,
      strokeWeight:1,
      fillColor:"gray",
      fillOpacity:0.1
      });
      myRadius.setMap(map);

		  var marker = new google.maps.Marker({
  			map: map,
  			position: pos,
  			content: 'My location',
        animation:google.maps.Animation.DROP
		  });

			google.maps.event.addListener(marker, 'click', function() {
				infowindow.setContent("Your location.");
				infowindow.open(map, this);
			});
      
		  map.setCenter(pos);

			inputSearch = document.getElementById('locationInput');

			searchBox = new google.maps.places.SearchBox(inputSearch);
			google.maps.event.addListener(searchBox, 'places_changed', searchLocations);

		}, function() {
		  handleNoGeolocation(true);
		});
		
  } else {
	 // Browser doesn't support Geolocation
	 handleNoGeolocation(false);
  }

}



function searchLocations() {
  var request = {
  location: pos,
  radius: 2000,     // 2000 m = 2 km !
  types: [inputSearch.value]
  };

  if(markersFound.length > 0){
    removeLocationMarkers();
  }

  infowindow = new google.maps.InfoWindow();
  var service = new google.maps.places.PlacesService(map);
  service.nearbySearch(request, callback);
}



function codeAddress() {
  var geocoder = new google.maps.Geocoder();
  var address = inputSearch.value;
  
  geocoder.geocode( { 'address': address}, function(results, status) {    
    if (status == google.maps.GeocoderStatus.OK) {
      for(var i =0; i< results.length; i++){          
        if(distance(results[i].geometry.location.lat(), results[i].geometry.location.lng(),CurentLat, CurentLong)<=2){
          map.setCenter(results[i].geometry.location);
          var marker = new google.maps.Marker({
          map: map,
          position: results[i].geometry.location
          });
          markersFound.push(marker);  
          var markerAddress = results[0].formatted_address;     

          google.maps.event.addListener(marker, 'click', function() {             
            infowindow.setContent("Location found:<br />"+markerAddress);
            infowindow.open(map,this);        
          });
        }
      }
    }  

    if(!status == google.maps.GeocoderStatus.OK || markersFound.length ==0) {
      clearTimeout(popupClose);
      $("#popupNoSearchResults").css("opacity", 1);
      $("#popupNoSearchResults").css("display", "block");
      popupClose = setTimeout(function(){
        $("#popupNoSearchResults").css("opacity", 0);
        $("#popupNoSearchResults").css("display", "none");
      }, 2000);
    }
  
  });
}



function distance(lat1,lon1,lat2,lon2) 
{
  var R = 6371; // Radius of the earth in km
  var dLat = deg2rad(lat2-lat1);  // deg2rad below
  var dLon = deg2rad(lon2-lon1); 
  var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2); 
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
  var d = R * c; 
  return d;   // Distance in km !!
}

function deg2rad(deg) {
  return deg * (Math.PI/180);
}



function removeLocationMarkers() {
    for(var i = 0; i < markersFound.length; i++) {
        markersFound[i].setMap(null);
    }
    markersFound = [];
}



function callback(results, status) {
    if (status == google.maps.places.PlacesServiceStatus.OK) {
      for (var i = 0; i < results.length; i++) {
        createMarker(results[i]);
      }
    } else {
      codeAddress();
    }
}




function createMarker(place) {
    var pinIcon = new google.maps.MarkerImage(
      place.icon,
      null, /* size is determined at runtime */
      null, /* origin is 0,0 */
      null, /* anchor is bottom center of the scaled image */
      new google.maps.Size(34, 34)
    );

    var marker = new google.maps.Marker({
      map: map,
      position: place.geometry.location,
      icon: pinIcon
    });

    markersFound.push(marker);

    google.maps.event.addListener(marker, 'click', function() {
      infowindow.setContent(place.name + "<br />" + "Address: " + place.vicinity + "<br />" + "Rating: " +place.rating);
      infowindow.open(map, this);
    });
}





function closePopupWindow() {
    clearTimeout(popupClose);
    $("#popupNoSearchResults").css("opacity", 0);
    $("#popupNoSearchResults").css("display", "none");
}




function handleNoGeolocation(errorFlag) {
  if (errorFlag) {
    var content = 'Error: The Geolocation service failed.';
  } else {
    var content = 'Error: Your browser doesn\'t support geolocation.';
  }

  var options = {
    map: map,
    position: new google.maps.LatLng(60, 105),
    content: content
  };

  var infowindow = new google.maps.InfoWindow(options);
  map.setCenter(options.position);
}

	
google.maps.event.addDomListener(window, 'load', initialize);
