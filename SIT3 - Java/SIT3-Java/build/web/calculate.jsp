<%-- 
    Document   : calculate
    Created on : Nov 9, 2016, 9:26:16 PM
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="maps" class="googlemaps.TravelTimeDistance" scope="session"/>

<jsp:useBean id="bd" class="database.DbManager" scope="session"/>
<jsp:useBean id="collection" class="database.DbCollection" scope="session"/>
<jsp:setProperty name="maps" property="*"/>

<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World</h1>
        <h1>O tempo entre (<%= maps.getOrigem() %>) e (<%= maps.getDestino() %>) eh de <%= maps.evaluate_distance() %> </h1>
        <% 
           
            //bd.execute("INSERT INTO agenda(nome, sobrenome, email, sexo) VALUES ('legallll','VALOR','VALOR','VALORRR')"); 
            
            //collection = bd.query("SELECT * FROM agenda");
            //collection.print();
        
        %>
        
    </body>
</html>
