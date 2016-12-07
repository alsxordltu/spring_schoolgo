<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<style>
html, body {
   height: 100%;
   margin: 0;
   padding: 0;
}

#map {
   height: 100%;
}

.controls {
   margin-top: 10px;
   border: 1px solid transparent;
   border-radius: 2px 0 0 2px;
   box-sizing: border-box;
   -moz-box-sizing: border-box;
   height: 32px;
   outline: none;
   box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
}

#pacinput {
   background-color: #fff;
   font-family: Roboto;
   font-size: 15px;
   font-weight: 300;
   padding: 0 11px 0 13px;
   text-overflow: ellipsis;
   width: 300px;
}

@media screen and (max-width: 736px) {
   #pacinput {
      background-color: #fff;
      font-family: Roboto;
      font-size: 15px;
      font-weight: 300;
      padding: 0 11px 0 13px;
      text-overflow: ellipsis;
      width: 160px;
   }
}

#pac-button {
   background-color: #fff;
   font-family: Roboto;
   font-size: 15px;
   font-weight: 300;
   margin-left: 12px;
   padding: 0 11px 0 13px;
   text-overflow: ellipsis;
   width: 70px;
}

#pacinput:focus {
   border-color: #4d90fe;
}

.pac-container {
   font-family: Roboto;
}

#type-selector {
   color: #fff;
   background-color: #4d90fe;
   padding: 5px 11px 0px 11px;
}

#type-selector label {
   font-family: Roboto;
   font-size: 13px;
   font-weight: 300;
}
</style>
<title>Places Searchbox</title>
<style>
#target {
   width: 345px;
}
</style>
</head>
<body>
   <form id="form1" action="getlocation2" method="get">
      <input type="text" id="pacinput" name="pacinput" class="controls"
         placeholder="Search Box"> <input id="pac-button"
         class="controls" type="button" value="확인" onclick="movenextpage()">
      <input type="hidden" id="resultstring2" name="resultstring2"
         placeholder="Search Box2"> <input type="hidden"
         id="resultstring" name="resultstring"> <input type="hidden"
         id="lat" name="lat"> <input type="hidden" id="lng" name="lng">
   </form>
   <div id="map"></div>
    <script src = "http://code.jquery.com/jquery.js"></script>
   
   <script>
      // This example adds a search box to a map, using the Google Place Autocomplete
      // feature. People can enter geographical searches. The search box will return a
      // pick list containing a mix of places and predicted search terms.

      function initAutocomplete() {
         var map = new google.maps.Map(document.getElementById('map'), {
            center : {
               lat : 37.566535,
               lng : 126.9779692
            },
            zoom : 13,
            mapTypeId : google.maps.MapTypeId.ROADMAP
         });

         // Create the search box and link it to the UI element.
         var input = document.getElementById("pacinput");
         var button = document.getElementById("pac-button");
         var searchBox = new google.maps.places.SearchBox(input);

         map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
         map.controls[google.maps.ControlPosition.TOP_LEFT].push(button);

         // Bias the SearchBox results towards current map's viewport.
         map.addListener('bounds_changed', function() {
            searchBox.setBounds(map.getBounds());
         });

         var markers = [];
         // [START region_getplaces]
         // Listen for the event fired when the user selects a prediction and retrieve
         // more details for that place.
         searchBox.addListener('places_changed', function() {
            var places = searchBox.getPlaces();

            if (places.length == 0) {
               return;
            }

            // Clear out the old markers.
            markers.forEach(function(marker) {
               marker.setMap(null);
            });
            markers = [];

            // For each place, get the icon, name and location.
            var bounds = new google.maps.LatLngBounds();
            places.forEach(function(place) {
               var icon = {
                  url : place.icon,
                  size : new google.maps.Size(71, 71),
                  origin : new google.maps.Point(0, 0),
                  anchor : new google.maps.Point(17, 34),
                  scaledSize : new google.maps.Size(25, 25)
               };

               // Create a marker for each place.
               markers.push(new google.maps.Marker({
                  map : map,
                  icon : icon,
                  title : place.name,
                  position : place.geometry.location
               }));

               if (place.geometry.viewport) {
                  // Only geocodes have viewport.
                  bounds.union(place.geometry.viewport);
               } else {
                  bounds.extend(place.geometry.location);
               }
            });
            map.fitBounds(bounds);
         });
         // [END region_getplaces]
      }
      
/*        function movenextpage(){
            
            var input = document.getElementById("pacinput").value;
            document.getElementById('resultstring2').value = input;   
            document.getElementById('form1').submit();
         }
        */
       function movenextpage() {

         var input = document.getElementById("pacinput").value;
         /* var url = "https://maps.googleapis.com/maps/api/geocode/json?address="
               + input + "&key=AIzaSyDMyDmCjogn6vLLZcCM-ZMCpNtk2BZoO5Y"; */
         var url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + input + "&key=AIzaSyAx6uOyFrFC3s6Ccx9Uo4r8qtlr7VTE6jw";
         document.getElementById('resultstring').value = url;
         document.getElementById('resultstring2').value = input;
         getlocation(url);
         document.getElementById('form1').submit();
      }

      function getlocation(input) {
         var url = input;
         $.ajax({
            url : url,
            type : "get",
            async : false,
            success : function(responseTxt) {
               var items = responseTxt.results;
               $.each(items, function(index, item) {
                  var lat = item.geometry.location.lat;
                  var lng = item.geometry.location.lng;
                  console.log(lat, lng);
                  document.getElementById('lat').value = lat;
                  document.getElementById('lng').value = lng;
               });
            },
            error : function(xhr, status, error) {
               alert("fail: " + error);
            }
         });
      } 
   </script>
   <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAx6uOyFrFC3s6Ccx9Uo4r8qtlr7VTE6jw&libraries=places&callback=initAutocomplete"
      async defer></script>
</body>
</html>