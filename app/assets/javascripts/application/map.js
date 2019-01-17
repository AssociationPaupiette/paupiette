/*global document, google, window */
var initMapMarker = function (markerData) {
    'use strict';
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(markerData.latitude, markerData.longitude),
        url: markerData.url !== null ? markerData.url : ''
    });

    if (markerData.url) {
        google.maps.event.addListener(marker, 'click', function () {
            window.location.href = this.url;
        });
    }
    return marker;
};

var initMapZone = function (markerData) {
    'use strict';
    var marker = new google.maps.Circle({
        strokeColor: '#631C32',
        strokeOpacity: 0.8,
        strokeWeight: 2,
        fillColor: '#631C32',
        fillOpacity: 0.35,
        center: new google.maps.LatLng(markerData.latitude, markerData.longitude),
        radius: 600
    });
    return marker;
};

var initMap = function () {
    'use strict';
    var mapElt = document.getElementById('map');
    if (!mapElt) {
        return;
    }

    var center = JSON.parse(mapElt.getAttribute('data-center')),
        zoom = Number(mapElt.getAttribute('data-zoom')),
        map = new google.maps.Map(mapElt, {
            zoom: zoom !== null ? zoom : 5.6,
            center: new google.maps.LatLng(center.latitude, center.longitude),
            zoomControl: true,
            disableDefaultUI: true
        }),
        markersData = JSON.parse(mapElt.getAttribute('data-markers')),
        i,
        marker;

    if (markersData !== null) {
        for (i = 0; i < markersData.length; i += 1) {
            marker = initMapMarker(markersData[i]);
            marker.setMap(map);
        }
    } else {
        marker = initMapZone(center);
        marker.setMap(map);
    }
};