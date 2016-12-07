<%-- 
    Document   : editar_medico
    Created on : Dec 6, 2016, 7:22:33 PM
    Author     : Pedro
--%>

<jsp:useBean id="medico" class="medico.Medico"></jsp:useBean> 
<jsp:useBean id="medicoDO" class="medico.MedicoDO"></jsp:useBean> 



<% 
    if(request.getParameter("medid")!= null){
    medicoDO = medico.selecionarPorId(request.getParameter("medid"));

    }


%>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Editar Medico</h1> <br>
        <h2>Infos do Medico:</h2> <br>
        <h3>Nome -<%=medicoDO.getNome()%> </h3> <br>
        <h3>Tel -<%=medicoDO.getTelefone()%> </h3> <br>
        <h3>CRM -<%=medicoDO.getCRM()%> </h3> <br>
        <h3>Especialidade -<%=medicoDO.getEspecialidade()%> </h3> <br>
       
        
        
        <form method="post" action="confirmacao_edicao_medico.jsp?medid=<%=request.getParameter("medid")%>&action=edit">
     <fieldset>
       <legend>Alterar:</legend>
       
       <br>Nome :<br>
       <input type="text" name="nome" size=45 maxlength=45 ><br><br>
       
       <br>Tel :<br>
       <input type="text" name="telefone" size=10 maxlength=10 ><br><br>
       
       <br>CRM :<br>
       <input type="text" name="CRM" size=10 maxlength=10 ><br><br>
       
       <br>Especialidade :<br>
       <input type="text" name="especialidade" size=45 maxlength=45 ><br><br>
       
       <br><input type="submit" value="Continuar">
     </fieldset>
     </form> 
     
     
     
        <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
        <h3><a href="index.jsp">Voltar</a></h3>
        
    </body>
</html>

