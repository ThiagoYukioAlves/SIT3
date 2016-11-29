<%-- 
    Document   : consulta_medicos
    Created on : Nov 23, 2016, 8:53:29 PM
    Author     : Thiago
--%>

<jsp:useBean id="bd" class="database.DbManager" scope="session"/>
<jsp:useBean id="medico" class="medico.Medico" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Consulta Medicos</title>
    
  </head>
  <body>
        <h1>Consulta de médicos</h1>
        <!--Pega toda tabela medicos no banco de dados-->
        <%DbCollection listaMedicos = medico.consultaMedicos();%>
        
        <!--Cria uma tabela-->
        <table>
            <tr>   <!--Linhas com titulos-->
                <th>Medico</th>
                <th>Especialidade</th>
                <th>Telefone</th>
                <th>CRM</th>
            </tr>
            <tr>   <!--Linhas com medico-->
                <th>Medico</th>
                <th>Especialidade</th>
                <th>Telefone</th>
                <th>CRM</th>
            </tr>
            
            
        </table>
 
    
  </body>
</html>