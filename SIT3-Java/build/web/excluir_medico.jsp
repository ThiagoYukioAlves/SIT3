<%-- 
    Document   : consulta_medico
    Created on : Dec 4, 2016, 8:19:37 PM
    Author     : Pedro
--%>


<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
<link type="text/css" rel="Stylesheet" href="style.css"/>
<jsp:useBean id="medico" class="medico.Medico"></jsp:useBean> 
<jsp:useBean id="medicoDO" class="medico.MedicoDO"></jsp:useBean> 
<jsp:useBean id="lista_medico" class="database.DbCollection"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>Listagem de medicos</h1>
        <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
        
        <%
            if (session.getAttribute("privilegio") == null || !session.getAttribute("privilegio").equals("1")) {
        %>

        <script>
            alert("Voc� n�o tem permiss�o para acessar essa p�gina!");
            window.location.replace("index.jsp");
        </script>
   
    <% 
       }
       
       if (request.getParameter("action") != null && request.getParameter("action").equals("remove")){
           medico.remover(request.getParameter("medid"));
       }
            
       lista_medico = medico.retornarTodosMedicos();
       int i = 0;
       while (i < lista_medico.size()) {
           %>
           <h3><%= lista_medico.getItem(i).getItem(1)%> - <%= lista_medico.getItem(i).getItem(3)%> - <a href="excluir_medico.jsp?action=remove&medid=<%=lista_medico.getItem(i).getItem(0)%>">[Excluir]</a></h3>
           <%
           i++;
       }
    %>
        
        <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
        <h3><a href="index.jsp">Voltar</a></h3>
    </body>
    
</html>
