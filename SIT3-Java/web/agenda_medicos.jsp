<%-- 
    Document   : agenda_medicos
    Created on : 04/12/2016, 18:41:33
    Author     : samue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link type="text/css" rel="Stylesheet" href="style.css"/>
<jsp:useBean id="agenda_medico" class="medico.Medico" scope="session"/>
<jsp:useBean id="dados_usuario" class="database.DbCollection" scope="session"/>
<jsp:useBean id="usuarios" class="usuario.Usuario" scope="session"/>
<jsp:useBean id="agenda" class="database.DbCollection" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           String id;
           int k = 0;
           id = agenda_medico.obterIdPorNome(request.getParameter("medico"));
           agenda = agenda_medico.retornarAgendaMedico(id);
        %>
<table>
<style>
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
  <tr>
    <th>Data</th>
    <th>Horário</th>
    <th>Duração</th>
    <th>Consulta</th>
  </tr>
  <%
      dados_usuario = usuarios.SelecionarIdUsuario(String.valueOf(session.getAttribute("username")));
      while (k < agenda.size()) {
      %>
  <tr>
    <td> <%= agenda.getItem(k).getItem(3) %> </td>
    <td> <%= agenda.getItem(k).getItem(4) %> </td>
    <td> <%= agenda.getItem(k).getItem(5) %> </td>
    <td><a href='confirmacao_agenda_hospital.jsp?id_usuario=<%=dados_usuario.getItem(0).getItem(0)
        %>&id_consulta=<%=agenda.getItem(k).getItem(0)%>'> Marcar Consulta</a></td>
  </tr>
  <% k++; } %>
    </body>
</html>
