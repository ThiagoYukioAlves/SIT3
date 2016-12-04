<%-- 
    Document   : formulario_cadastro_planodesaude
    Created on : 02/12/2016, 14:10:20
    Author     : leo
--%>


<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
<link type="text/css" rel="Stylesheet" href="style.css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    
    <%
        if (session.getAttribute("privilegio") == null || !session.getAttribute("privilegio").equals("1")) {
    %>
    
    <script>
        alert("Você não tem permissão para acessar essa página!");
        window.location.replace("index.jsp");
    </script>
   
    <% } 
     %>
    
    <h1>Cadastro de Plano de Sa&uacute;de</h1>

    <form method="post" action="confirmacao_cadastro_planodesaude.jsp">
     <fieldset>
       <legend>Dados:</legend>
       <br>Nome do plano de sa&uacute;de:<br>
       <input type="text" name="nome" required><br><br>
       
       <br><input type="submit" value="Continuar">
     </fieldset>
   </form> 

   </body>
</html>
