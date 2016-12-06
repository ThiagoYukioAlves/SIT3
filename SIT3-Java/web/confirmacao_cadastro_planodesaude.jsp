<%-- 
    Document   : confirmacao_cadastro_planodesaude
    Created on : 02/12/2016, 14:15:26
    Author     : leo
--%>

            <%@page import="planosdesaude.PlanoDeSaude"%>
            <%
                if (session.getAttribute("privilegio") == null || !session.getAttribute("privilegio").equals("1")) {
            %>8u

            <script>
                alert("Você não tem permissão para acessar essa página!");
                window.location.replace("index.jsp");
            </script>

            <% } %>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
<link type="text/css" rel="Stylesheet" href="style.css"/>

<jsp:useBean id="plano" class="planosdesaude.PlanoDeSaude"></jsp:useBean> 
<jsp:useBean id="planoDO" class="planosdesaude.PlanoDeSaudeDO"></jsp:useBean> 
<jsp:setProperty property="*" name="planoDO"/> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1><%= planoDO.getNome() %></h1>
        <% if (plano.incluir(planoDO)) {%>
        <h3>Plano de sa&uacute;de incluido com sucesso! </h3> 
        <h3>         - <a href='relacao_hospital_plano.jsp?hospid=<%= plano.obterIdPorNome(planoDO.getNome()) %>'>Incluir planos de saúde para esse hospital </a> </h3>
        <h3>         - <a href='index.jsp'>Voltar</a> </h3>
        <% } %>
        <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>

    </body>
</html>

