<%-- 
    Document   : consulta_medicos
    Created on : Nov 23, 2016, 8:53:29 PM
    Author     : Thiago
--%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
<link type="text/css" rel="Stylesheet" href="style.css"/>
<jsp:useBean id="medico" class="medico.Medico"></jsp:useBean> 
<jsp:useBean id="medicoDO" class="medico.MedicoDO"></jsp:useBean> 
<jsp:useBean id="lista_medicos" class="database.DbCollection"></jsp:useBean>

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
        <%lista_medicos = medico.retornarTodosMedicos();%>
        
        <!--Cria uma tabela-->
        <table>
            <tr>   <!--Linhas com titulos-->
                <th>Medico</th>
                <th>Especialidade</th>
                <th>Telefone</th>
                <th>CRM</th>
            </tr>
            
            <%for(int i = 0; i < lista_medicos.size(); i++){%>
            <tr>   <!--Linhas com medico-->
                <th><%=lista_medicos.getItem(i).getItem(3)%></th>
                <th><%=lista_medicos.getItem(i).getItem(2)%></th>
                <th><%=lista_medicos.getItem(i).getItem(4)%></th>
                <th><%=lista_medicos.getItem(i).getItem(1)%></th>
            </tr>
            <%} %>
            
            
        </table>
 
    
  </body>
</html>