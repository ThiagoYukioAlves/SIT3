<%-- 
    Document   : confirmacao_alteracao_senha
    Created on : Dec 4, 2016, 5:41:02 PM
    Author     : mario
--%>


            <%@page import="usuario.Usuario"%>
            <%
                if (session.getAttribute("privilegio") == null || !session.getAttribute("privilegio").equals("1")) {
            %>

            <script>
                alert("Você não tem permissão para acessar essa página!");
                window.location.replace("index.jsp");
            </script>

            <% } %>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
<link type="text/css" rel="Stylesheet" href="style.css"/>

<jsp:useBean id="usuario" class="usuario.Usuario"></jsp:useBean> 
<jsp:useBean id="usuarioDO" class="usuario.UsuarioDO"></jsp:useBean> 
<jsp:setProperty property="*" name="usuarioDO"/> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1><%= usuarioDO.getNome() %></h1>
        <% if (usuario.alterarSenha(usuarioDO, usuarioDO.getsenhaNova())) { %>
        <h3>Senha alterada com sucesso! </h3> 
        <h3>         - <a href='index.jsp'>Voltar</a> </h3>
        <% } %>
        <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>

    </body>
</html>
