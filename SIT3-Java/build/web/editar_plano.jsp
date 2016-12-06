<%-- 
    Document   : editar_plano
    Created on : 05/12/2016, 01:39:16
    Author     : leo
--%>
<jsp:useBean id="planos" class="planosdesaude.PlanoDeSaude"></jsp:useBean> 
<jsp:useBean id="planoEdit" class="planosdesaude.PlanoDeSaudeDO"></jsp:useBean> 
<jsp:useBean id="planosDO" class="planosdesaude.PlanoDeSaudeDO"></jsp:useBean> 
<jsp:useBean id="planoedit" class="database.DbCollection"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
    if(request.getParameter("planoid")!= null){
    planoedit = planos.selecionarPorId(request.getParameter("planoid"));

    }


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Editar plano</h1> <br>
        <h2>Infos do plano:</h2> <br>
        <h3>Nome -<%=planoedit.getItem(0).getItem(1)%> </h3>
        
     <form method="post" action="confirmacao_edicao_planodesaude.jsp?planoid=<%=request.getParameter("planoid")%>&action=edit">
     <fieldset>
       <legend>Alterar:</legend>
       <br>Nome do plano de sa&uacute;de:<br>
       <input type="text" name="nome" required><br><br>
       
       <br><input type="submit" value="Continuar">
     </fieldset>
     </form> 
        
    </body>
</html>
