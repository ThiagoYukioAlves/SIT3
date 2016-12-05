<%-- 
    Document   : formulario_cadastro_hospital
    Created on : Nov 28, 2016, 9:00:16 PM
    Author     : Gabriel
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
    
    <h1>Cadastro de Hospital</h1>

    <form method="post" action="confirmacao_cadastro_hospital.jsp">
     <fieldset>
       <legend>Dados:</legend>
       <br>Nome do hospital:<br>
       <input type="text" name="nome" required><br><br>
       Telefone:<br>
       <input type="tel" name="telefone" onkeypress='return event.charCode >= 48 && event.charCode <= 57' required><br><br>
       Endere&ccedil;o:<br>
       <input type="text" name="endereco" required><br><br>
       
       <br><input type="submit" value="Continuar">
     </fieldset>
   </form> 

   </body>
</html>
