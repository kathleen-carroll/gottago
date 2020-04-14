var map;
var marker;
function initMap(lat, long) {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: lat , lng: long },
    zoom: 13
  });
  var image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
  var marker = new google.maps.Marker({
     position: {lat: lat , lng: long },
     map: map,
     draggable: true,
     animation: google.maps.Animation.DROP,
     icon: image,
     title: 'You are here'
   });
 marker.setMap(map);
 marker.addListener('click', toggleBounce);
}
function toggleBounce() {
   if (marker.getAnimation() !== null) {
     marker.setAnimation(null);
   } else {
     marker.setAnimation(google.maps.Animation.BOUNCE);
   }
 }
