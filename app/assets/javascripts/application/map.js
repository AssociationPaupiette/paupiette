/*global document, google, window */
var initMapMarker = function (markerData) {
    'use strict';
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(markerData.latitude, markerData.longitude),
        url: markerData.url
    });

    google.maps.event.addListener(marker, 'click', function () {
        window.location.href = this.url;
    });

    return marker;
};

var initMap = function () {
    'use strict';
    var mapElt = document.getElementById('map');
    if (!mapElt) {
        return;
    }

    var center = JSON.parse(mapElt.getAttribute('data-center'));
    var map = new google.maps.Map(mapElt, {
        zoom: 5.6,
        center: new google.maps.LatLng(center.latitude, center.longitude),
        zoomControl: true,
        disableDefaultUI: true
    });

    var markersData = JSON.parse(mapElt.getAttribute('data-markers'));

    var i, marker;
    for (i = 0; i < markersData.length; i += 1) {
        marker = initMapMarker(markersData[i]);
        marker.setMap(map);
    }
};