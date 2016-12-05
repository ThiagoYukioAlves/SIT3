<%-- 
    Document   : confirmacao_agenda_hospital
    Created on : 04/12/2016, 20:39:46
    Author     : samue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="agenda_medico" class="medico.Medico" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% agenda_medico.marcarConsulta(request.getParameter("id_usuario"), request.getParameter("id_consulta")); %>
        <h3>Consulta Marcada! <a href='index.jsp'> Clique aqui</a> para ir para sua página.</h3>
    </body>
</html>
