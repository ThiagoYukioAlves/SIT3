<%-- 
    Document   : consulta_hospitais
    Created on : Nov 10, 2016, 4:53:29 PM
    Author     : Gabriel
--%>

<jsp:useBean id="hospital" class="hospitais.Hospital" scope="session"/>
<jsp:useBean id="hospitalDO" class="hospitais.HospitalDO" scope="session"/>
<jsp:useBean id="lista_hospitais" class="database.DbCollection" scope="session"/>
<jsp:useBean id="maps" class="googlemaps.TravelTimeDistance" scope="session"/>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>

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
        height: 75%;
      }
#floating-panel {
  position: absolute;
  top: 5px;
  left: 0%;
  z-index: 5;
  background-color: #fff;
  padding: 5px;
  border: 1px solid #999;
  text-align: center;
  font-family: 'Roboto','sans-serif';
  font-size: 13px;
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
   
      
      <%  String origin = "-23.553361, -46.728079";
          if (request.getParameter("hospid") != null) {
          hospitalDO = hospital.selecionarPorId(request.getParameter("hospid"));
          
      %>
    <div id="floating-panel">
       <b><h2><%=hospitalDO.getNome()%> </h2></b> 
       <b>Tel:</b> <%=hospitalDO.getTelefone()%> <br>
       <b>Endereço:</b> <%=hospitalDO.getEndereco()%> <br>
       <b>Tempo de sua localização até o hospital:</b> <%=maps.evaluate_distance(origin, maps.getCoordinates(request.getParameter("dest"))) %> (tempo calculado pelo GoogleMaps, dirigindo)
    </div>
    <%}%>
       
    <%           
           String idPlano = (String)session.getAttribute("idPlano");           
           lista_hospitais = hospital.retornarHospitaisAceitamPlano(idPlano);
        
        %>
        
    
    <div id="map"></div>

        <%
                int i =0;
                if (lista_hospitais.size() == 0){
                    %>
                    <h3>Infelizmente, nenhum hospital cadastrado no sistema aceita seu plano de saúde!</h3>
                    <%
                }
                while (i < lista_hospitais.size()){
                    %>
                    <h3><a href='busca_emergencia.jsp?dest=<%=maps.getCoordinates(lista_hospitais.getItem(i).getItem(2))%>&hospid=<%=lista_hospitais.getItem(i).getItem(0)%>'><%=lista_hospitais.getItem(i).getItem(1)%> </a>
                     - Tempo: <%=maps.evaluate_distance(origin, lista_hospitais.getItem(i).getItem(2)) %> </h3>
                    <%
                    i++;
                }
        
        %>
         <a href ="index.jsp">Voltar</a>
    <script>
    
    function getParameterByName(name, url) {
    if (!url) {
      url = window.location.href;
    }
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}
    
        
    var latlon = "";
    var dest = getParameterByName("dest");

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition, showError);
    } else {
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}

function showPosition(position) {
    latlon = position.coords.latitude + "," + position.coords.longitude;
//    alert(latlon);

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
  //document.getElementById('end').addEventListener('change', onChangeHandler);
  
  window.onload = function(){
    calculateAndDisplayRoute(directionsService, directionsDisplay);
    
   }
     
}

function calculateAndDisplayRoute(directionsService, directionsDisplay) {
 
  directionsService.route({
    origin: latlon,
    destination: dest,
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