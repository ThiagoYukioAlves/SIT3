<%-- 
    Document   : confirmacao_cadastro_usuario
    Created on : Nov 20, 2016, 8:57:52 PM
    Author     : Gabriel
--%>

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
        <% String mensagem;
            
            if (usuario.VerificarExistenciaUsername(usuarioDO.getUsername())){
                mensagem = "Este nome de usuario já está em uso. Por favor escolha outro!";
            } else     
            if (usuario.incluir(usuarioDO)) {
                mensagem = "Seja bem vindo, " + usuarioDO.getNome() + ". Seu cadastro foi incluido com sucesso!";
            }
            else {
                mensagem = "Alguma coisa saiu errado em seu cadastro. Por favor, tente de novo mais tarde!";
            }%>
        <h1> <%=mensagem%><br>
         
        <h1><a href="index.jsp"> Voltar </a></h1> <br>
        <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
    </body>
</html>
