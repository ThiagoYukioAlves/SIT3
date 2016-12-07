<%-- 
    Document   : confirmacao_alteracao_senha
    Created on : Dec 4, 2016, 5:41:02 PM
    Author     : mario
--%>


<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
<link type="text/css" rel="Stylesheet" href="style.css"/>

<jsp:useBean id="user" class="usuario.Usuario" scope="session"></jsp:useBean> 
<jsp:useBean id="usuarioDO" class="usuario.UsuarioDO" scope="session"></jsp:useBean> 
<jsp:useBean id="usuarioDO2" class="usuario.UsuarioDO" scope="session"></jsp:useBean> 
<jsp:useBean id="usuarioData" class="usuario.UsuarioData" scope="session"></jsp:useBean> 
<jsp:setProperty property="*" name="usuarioDO"/> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h2><%
            
        System.out.println(usuarioDO.getSenha());
        System.out.println(String.valueOf(session.getAttribute("username")));
        usuarioDO2 = user.selecionarPorUsername(String.valueOf(session.getAttribute("username")));
            
        if (usuarioDO2.getSenha().equals(usuarioDO.getSenha()))
        {
            user.alterarSenha(usuarioDO,usuarioDO.getSenhaNova());
            session.setAttribute("senha", usuarioDO.getSenhaNova());
        }
        else{
        %> Houve um erro. <%
        }
           
            
        %>
        <a href ='index.jsp'> Voltar para página inicial </a>
        
        </h2>
        <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>

    </body>
</html>