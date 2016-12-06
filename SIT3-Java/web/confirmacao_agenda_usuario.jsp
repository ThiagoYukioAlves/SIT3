<%-- 
    Document   : confirmacao_agenda_usuario
    Created on : 04/12/2016, 22:56:26
    Author     : samue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="agenda_usuario" class="usuario.Usuario" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% agenda_usuario.desmarcarConsulta(request.getParameter("id_usuario"),request.getParameter("id_consulta")); %>
        <%= request.getParameter("id_usuario")%>
        <%= request.getParameter("id_consulta")%>
        <h3>Consulta Desmarcada! <a href='index.jsp'> Clique aqui</a> para ir para sua página.</h3>
    </body>
</html>
