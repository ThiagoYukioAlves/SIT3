<%-- 
    Document   : consulta_plano
    Created on : 04/12/2016, 20:48:04
    Author     : leo
--%>


<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
<link type="text/css" rel="Stylesheet" href="style.css"/>
<jsp:useBean id="planos" class="planosdesaude.PlanoDeSaude"></jsp:useBean> 
<jsp:useBean id="planoEdit" class="planosdesaude.PlanoDeSaudeDO"></jsp:useBean> 
<jsp:useBean id="planosDO" class="planosdesaude.PlanoDeSaudeDO"></jsp:useBean> 
<jsp:useBean id="lista_planos" class="database.DbCollection"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>Listagem de Planos</h1>
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
            
       lista_planos = planos.retornarTodosPlanos();

       if(request.getParameter("action")!=null && request.getParameter("action").equals("delete")){
            planos.remover(request.getParameter("planoid"));
            lista_planos = planos.retornarTodosPlanos();
       } 
       int i = 0;
       while (i < lista_planos.size()) {
           %>
           <h3><%= lista_planos.getItem(i).getItem(1)%> <a href='consulta_planodesaude.jsp?planoid=<%=lista_planos.getItem(i).getItem(0)%>&action=delete'>[Excluir]|</a><a href='editar_plano.jsp?planoid=<%=lista_planos.getItem(i).getItem(0)%>&action=edit'>[Editar]</a></h3>
           <%
           i++;
       }
    %>
        
        <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
        <h3><a href="index.jsp">Voltar</a></h3>
    </body>
    
</html>
