<%-- 
    Document   : consulta_medicos
    Created on : Nov 23, 2016, 8:53:29 PM
    Author     : Thiago
--%>

<jsp:useBean id="bd" class="database.DbManager" scope="session"/>
<jsp:useBean id="medicos" class="medico.Medico" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Consulta Medicos</title>
    
  </head>
  <body>

        <%medico.db.query("SELECT * FROM medicos"); %>
        <%= medicos.RetornaSelect() %>
        
 
    
  </body>
</html>