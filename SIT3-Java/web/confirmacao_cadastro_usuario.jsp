<%-- 
    Document   : confirmacao_cadastro_usuario
    Created on : Nov 20, 2016, 8:57:52 PM
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="usuario.Usuario"></jsp:useBean> 
<jsp:setProperty property="*" name="user"/> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% user.salvarUsuario(); %>
        <h1>Seja bem-vindo, <%= user.getNome() %>. Seu cadastro foi incluido com sucesso!</h1> <br>
        <h1><a href="index.jsp"> Voltar </a></h1> <br>
    </body>
</html>
