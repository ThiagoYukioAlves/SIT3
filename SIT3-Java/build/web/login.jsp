<%-- 
    Document   : login
    Created on : Nov 28, 2016, 7:32:46 PM
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <% if (usuario.VerificarUsuarioSenha(usuarioDO) == true) {
            usuarioDO = usuario.selecionarPorUsername(usuarioDO.getUsername());
            session.setAttribute("username", usuarioDO.getUsername());
            session.setAttribute("nome", usuarioDO.getNome());
            session.setAttribute("privilegio", usuarioDO.getPrivilegio());
            session.setAttribute("idPlano", usuarioDO.getIdPlano());
        %>
            <h3>Bem vindo, <%= usuarioDO.getUsername() %>. <a href='index.jsp'> Clique aqui</a> para ir para a pagina inicial</h3>
        <% } else { %>
        <h3>Usuario ou senha incorretos! <a href='index.jsp'> Tente novamente </a></h3>
        <% } %>
        <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
    </body>
</html>
