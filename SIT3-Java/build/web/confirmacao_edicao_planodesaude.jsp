<%-- 
    Document   : confirmacao_edicao_planodesaude
    Created on : 05/12/2016, 02:34:39
    Author     : leo
--%>
<jsp:useBean id="plano" class="planosdesaude.PlanoDeSaude"></jsp:useBean> 
<jsp:useBean id="planoDO" class="planosdesaude.PlanoDeSaudeDO"></jsp:useBean> 
<jsp:setProperty property="*" name="planoDO"/> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        if(request.getParameter("action")!=null && request.getParameter("action").equals("edit")){
        plano.editar(request.getParameter("planoid"),planoDO.getNome());
        
        }
        %>
        <h1>Edicao realizada!</h1>
        <h1><%=request.getParameter("planoid")%> </h1>
        <h1><%=planoDO.getNome()%> </h1>
    </body>
</html>
