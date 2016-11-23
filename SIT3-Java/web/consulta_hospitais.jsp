<%-- 
    Document   : consulta_hospitais
    Created on : Nov 10, 2016, 4:53:29 PM
    Author     : Gabriel
--%>

<jsp:useBean id="bd" class="database.DbManager" scope="session"/>
<jsp:useBean id="mapa_emergencia" class="hospitais.MapaEmergencia" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Directions service</title>
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 60%;
      }
#floating-panel {
  position: absolute;
  top: 10px;
  left: 25%;
  z-index: 5;
  background-color: #fff;
  padding: 5px;
  border: 1px solid #999;
  text-align: center;
  font-family: 'Roboto','sans-serif';
  line-height: 30px;
  padding-left: 10px;
}

table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}
td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}
tr:nth-child(even) {
    background-color: #dddddd;
}

    </style>
  </head>
  <body>
    <div id="floating-panel">
       <b>Escolha: </b>
    <%           
                     
           mapa_emergencia.ConsultaBanco("SELECT * FROM hospitais");      
        
        %>
        
        <%= mapa_emergencia.RetornaSelect() %>
        <br>
        <%= request.getParameter("id")%>
    </div>
    <div id="map"></div>

        <%= mapa_emergencia.RetornaTabela() %>
    <script>
    
        
    var latlon = "";

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition, showError);
    } else {
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}

function showPosition(position) {
    latlon = position.coords.latitude + "," + position.coords.longitude;
    alert(latlon);

}

function showError(error) {
    switch(error.code) {
        case error.PERMISSION_DENIED:
            x.innerHTML = "User denied the request for Geolocation."
            break;
        case error.POSITION_UNAVAILABLE:
            x.innerHTML = "Location information is unavailable."
            break;
        case error.TIMEOUT:
            x.innerHTML = "The request to get user location timed out."
            break;
        case error.UNKNOWN_ERROR:
            x.innerHTML = "An unknown error occurred."
            break;
    }
}   
    
        
        
function initMap() {
  getLocation();
  var directionsService = new google.maps.DirectionsService;
  var directionsDisplay = new google.maps.DirectionsRenderer;
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 7,
    center: {lat: -23.541953, lng: -46.730070}
  });
  directionsDisplay.setMap(map);

  var onChangeHandler = function() {
    calculateAndDisplayRoute(directionsService, directionsDisplay);
  };
  //document.getElementById('start').addEventListener('change', onChangeHandler);
  document.getElementById('end').addEventListener('change', onChangeHandler);
}

function calculateAndDisplayRoute(directionsService, directionsDisplay) {

  directionsService.route({
    origin: latlon,
    destination: document.getElementById('end').value,
    travelMode: google.maps.TravelMode.DRIVING
  }, function(response, status) {
    if (status === google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    } else {
      window.alert('Directions request failed due to ' + status);
    }
  });
}

    </script>
    
   
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHhMko0xpBmWRLZAD30IVCCmnxtgQVfrQ&signed_in=true&callback=initMap"
        async defer></script>
  </body>
</html>