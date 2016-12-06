<%-- 
    Document   : desmarcar_consulta
    Created on : 04/12/2016, 21:52:28
    Author     : samue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="agenda_usuario" class="usuario.Usuario" scope="session"/>
<jsp:useBean id="agenda" class="database.DbCollection" scope="session"/>
<jsp:useBean id="id" class="database.DbCollection" scope="session"/>
<jsp:useBean id="hospitais" class="database.DbCollection" scope="session"/>
<jsp:useBean id="usuarios" class="usuario.Usuario" scope="session"/>
<jsp:useBean id="hospital" class="hospitais.Hospital" scope="session"/>
<jsp:useBean id="medicos" class="medico.Medico" scope="session"/>
<jsp:useBean id="dados_medico" class="medico.MedicoDO" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  int i = 0;
            id = usuarios.SelecionarIdUsuario(String.valueOf(session.getAttribute("username")));
            agenda = agenda_usuario.retornarAgendaUsuario(id.getItem(0).getItem(0));
         if (agenda == null){ %>
        <h1>Você não tem consultas marcadas!</h1>
        <% }%>
        <% if (agenda != null){ %>
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
    <th>Médico</th>
    <th>Hospital</th>
    <th>Consulta</th>
  </tr>
        <% while (i < agenda.size()){%>
         <tr>
    <td> <%= agenda.getItem(i).getItem(3) %> </td>
    <td> <%= agenda.getItem(i).getItem(4) %> </td>
    <td> <%= agenda.getItem(i).getItem(5) %> </td>
    <td> <%  dados_medico = medicos.selecionarPorId(agenda.getItem(i).getItem(2)); %> 
         <%= dados_medico.getNome() %>  </td>
    <td> <%  hospitais = hospital.retornarHospitaisComMedicos(agenda.getItem(i).getItem(2));%> 
         <%= hospitais.getItem(0).getItem(1) %> </td>
    <td> <a href='confirmacao_agenda_usuario.jsp?id_usuario=<%=agenda.getItem(i).getItem(1)%>&id_consulta=<%=agenda.getItem(i).getItem(0)%>'> Desmarcar Consulta</a> </td>
        <% i++; }}%>
    </body>
</html>
