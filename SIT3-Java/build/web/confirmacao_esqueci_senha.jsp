<%-- 
    Document   : confirmacao_esqueci_senha
    Created on : Dec 6, 2016, 7:40:15 PM
    Author     : mario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="usuario.Usuario"></jsp:useBean> 
<jsp:useBean id="usuarioDO" class="usuario.UsuarioDO"></jsp:useBean> 
<jsp:setProperty property="*" name="usuarioDO"/> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
        <%
        user.esqueciMinhaSenha(usuarioDO);
        usuarioDO = user.selecionarPorUsername(usuarioDO.getUsername());
        user.enviaEmail(usuarioDO);
        %>
        <a href='index.jsp'> Voltar ao menu inicial </a>
        </h1>
    </body>
</html>
