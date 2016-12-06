<%-- 
    Document   : marcar_consulta
    Created on : 04/12/2016, 15:42:27
    Author     : samue
--%>

<%-- 
    Document   : marcar_consulta
    Created on : 02/12/2016, 14:30:52
    Author     : somewhere
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link type="text/css" rel="Stylesheet" href="style.css"/>
<jsp:useBean id="hospital" class="hospitais.Hospital" scope="session"/>
<jsp:useBean id="medicos" class="medico.Medico" scope="session"/>
<jsp:useBean id="medic" class="medico.MedicoDO" scope="session"/>
<jsp:useBean id="hospitalDO" class="hospitais.HospitalDO" scope="session"/>
<jsp:useBean id="lista_hospitais" class="database.DbCollection" scope="session"/>
<jsp:useBean id="lista_medicos" class="database.DbCollection" scope="session"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Marcar Consulta</h1>
        

        <%           
           String idPlano = (String)session.getAttribute("idPlano");           
           lista_hospitais = hospital.retornarHospitaisAceitamPlano(idPlano);
        
        %>
        
        <%
                int i =0;
                int j =0;
                int b =0;
                if (lista_hospitais.size() == 0){
                    %>
                    <h3>Infelizmente, nenhum hospital cadastrado no sistema aceita seu plano de saúde!</h3>
                    <%
                }
                while (i < lista_hospitais.size()){
                    %>
                    <h3>
                        
                        <a href='marcar_consulta.jsp?hospid=<%=lista_hospitais.getItem(i).getItem(0)%>'><%=lista_hospitais.getItem(i).getItem(1)%> </a>
    
                    </h3>
                    <%
                    i++;
                }
        
        %>
        
                      <%
          if (request.getParameter("hospid") != null) {
          lista_medicos = medicos.retornarHospitaisAceitamPlano(request.getParameter("hospid"));
      %>
      
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
        <%
                if (lista_medicos.size() == 0){
                    %>
                    <h3>Infelizmente, não há medicos!</h3>
                    <%
                }
                while (j < lista_medicos.size()){
                    %>
                    <h3>
                        
                    <a href='marcar_consulta.jsp?hospid=<%=request.getParameter("hospid")%>&tipoplano=<%=lista_medicos.getItem(j).getItem(2)%>'><%= lista_medicos.getItem(j).getItem(2) %> </a>
                     
                    </h3>
                     
                     <% j++; }}
                     if (request.getParameter("tipoplano") != null) {
                        medic.setEspecialidade(request.getParameter("tipoplano"));
                           %>
                           <%=medic.getEspecialidade()%>
                        <table>
  <tr>
    <th>CRM</th>
    <th>Especialidade</th>
    <th>Nome</th>
    <th>Telefone</th>
  </tr>
                        <%while (b < lista_medicos.size()) {
                               if (lista_medicos.getItem(b).getItem(2).equals(medic.getEspecialidade() )){
                        %>
  <tr>
    <td> <%= lista_medicos.getItem(b).getItem(1) %> </td>
    <td> <%= lista_medicos.getItem(b).getItem(2) %> </td>
    <td> <a href='agenda_medicos.jsp?medico=<%= lista_medicos.getItem(b).getItem(3) %>'><%= lista_medicos.getItem(b).getItem(3) %> </a></td>
    <td> <%= lista_medicos.getItem(b).getItem(4) %> </td>
  </tr>

  <% }b++; }}%>
</table>
        
    </body>
</html>

