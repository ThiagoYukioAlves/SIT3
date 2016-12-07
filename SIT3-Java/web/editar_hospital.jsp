<%-- 
    Document   : editar_hospital
    Created on : 06/12/2016, 20:52:23
    Author     : leo
--%>
<jsp:useBean id="hospital" class="hospitais.Hospital"></jsp:useBean> 
<jsp:useBean id="hospitalEdit" class="hospitais.HospitalDO"></jsp:useBean> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    if(request.getParameter("hospid")!= null){
    hospitalEdit = hospital.selecionarPorId(request.getParameter("hospid"));

    }


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Editar Hospital</h1> <br>
        <h2>Infos do Hospital:</h2> <br>
        <h3>Nome -<%=hospitalEdit.getNome()%> </h3>
 
     <form method="post" action="confirmacao_edicao_hospital.jsp?hospid=<%=request.getParameter("hospid")%>&action=edit">
     <fieldset>
       <legend>Alterar:</legend>
       <br>Nome do Hospital:<br>
       <input type="text" name="nome" required><br><br>
       
       <br>Telefone do Hospital:<br>
       <input type="text" name="telefone" required><br><br>
       
       <br>Endereco do Hospital:<br>
       <input type="text" name="endereco" required><br><br>
       
       <br><input type="submit" value="Continuar">
     </fieldset>
     </form> 
        
    </body>
</html>
