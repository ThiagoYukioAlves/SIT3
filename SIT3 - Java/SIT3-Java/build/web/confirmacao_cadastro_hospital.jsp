<%-- 
    Document   : confirmacao_cadastro_hospital
    Created on : Nov 28, 2016, 9:20:28 PM
    Author     : Gabriel
--%>

            <%@page import="hospitais.Hospital"%>
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

<jsp:useBean id="hospital" class="hospitais.Hospital"></jsp:useBean> 
<jsp:useBean id="hospitalDO" class="hospitais.HospitalDO"></jsp:useBean> 
<jsp:setProperty property="*" name="hospitalDO"/> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1><%= hospitalDO.getNome() %></h1>
        nome_plano<% if (hospital.incluir(hospitalDO)) { %>
        <h3>Hospital incluido com sucesso! </h3> 
        <h3>         - <a href='relacao_hospital_plano.jsp?hospid=<%= hospital.obterIdPorNome(hospitalDO.getNome()) %>'>Incluir planos de saúde para esse hospital </a> </h3>
        <h3>         - <a href='index.jsp'>Voltar</a> </h3>
        <% } %>
        <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>

    </body>
</html>
