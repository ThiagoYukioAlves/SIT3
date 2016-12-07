

<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
<link type="text/css" rel="Stylesheet" href="style.css"/>
<jsp:useBean id="hospital" class="hospitais.Hospital"></jsp:useBean> 
<jsp:useBean id="hospitalDO" class="hospitais.HospitalDO"></jsp:useBean> 
<jsp:useBean id="lista_hospitais" class="database.DbCollection"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>Listagem de hospitais</h1>
        <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
        
        <%
            if (session.getAttribute("privilegio") == null || !session.getAttribute("privilegio").equals("1")) {
        %>

        <script>
            alert("Você não tem permissão para acessar essa página!");
            window.location.replace("index.jsp");
        </script>
   
    <% 
       }
       
       if (request.getParameter("action") != null && request.getParameter("action").equals("remove")){
           hospital.remover(request.getParameter("hospid"));
       }
            
       lista_hospitais = hospital.retornarTodosHospitais();
       int i = 0;
       while (i < lista_hospitais.size()) {
           %>
           <h3><%= lista_hospitais.getItem(i).getItem(1)%> - <a href="relacao_hospital_plano.jsp?hospid=<%=lista_hospitais.getItem(i).getItem(0)%>">[Planos]</a>
           <a href="consulta_hospitais.jsp?action=remove&hospid=<%=lista_hospitais.getItem(i).getItem(0)%>">[Excluir]</a><a href='editar_hospital.jsp?hospid=<%=lista_hospitais.getItem(i).getItem(0)%>&action=edit'>[Editar]</a></h3>
           <%
           i++;
       }
    %>
        
        <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
        <h3><a href="index.jsp">Voltar</a></h3>
    </body>
    
</html>
