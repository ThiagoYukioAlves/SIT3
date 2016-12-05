<%-- 
    Document   : excluir_usuario
    Created on : Dec 4, 2016, 10:15:43 PM
    Author     : Pedro
--%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
<link type="text/css" rel="Stylesheet" href="style.css"/>
<jsp:useBean id="usuario" class="usuario.Usuario"></jsp:useBean> 
<jsp:useBean id="usuarioDO" class="usuario.UsuarioDO"></jsp:useBean> 
<jsp:useBean id="lista_usuario" class="database.DbCollection"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>Listagem de usuarios</h1>
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
           usuario.remover(request.getParameter("userid"));
       }
            
       lista_usuario = usuario.retornarTodosUsuarios();
       int i = 0;
       while (i < lista_usuario.size()) {
           %>
           <h3><%= lista_usuario.getItem(i).getItem(1)%> - <%= lista_usuario.getItem(i).getItem(3)%> - <%= lista_usuario.getItem(i).getItem(9)%> - <a href="excluir_usuario.jsp?action=remove&userid=<%=lista_usuario.getItem(i).getItem(0)%>">[Excluir]</a></h3>
           <%
           i++;
       }
    %>
        
        <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
        <h3><a href="index.jsp">Voltar</a></h3>
    </body>
    
</html>