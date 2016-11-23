<%-- 
    Document   : confirmacao_cadastro_medico
    Created on : Nov 20, 2016, 8:57:52 PM
    Author     : Thiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="medico" class="medico.Medico"></jsp:useBean> 
<jsp:setProperty property="*" name="medico"/> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% medico.salvarMedico(); %>
        <h1>Seja bem-vindo, <%= medico.getNome() %>. Seu cadastro foi incluido com sucesso!</h1> <br>
        <h1><a href="index.jsp"> Voltar </a></h1> <br>
    </body>
</html>
