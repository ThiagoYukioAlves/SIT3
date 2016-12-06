<%-- 
    Document   : editar_usuario
    Created on : 06/12/2016, 17:15:04
    Author     : leo
--%>
<jsp:useBean id="usuario" class="usuario.Usuario"></jsp:useBean> 
<jsp:useBean id="usuarioDO" class="usuario.UsuarioDO"></jsp:useBean> 



<% 
    if(request.getParameter("username")!= null){
    usuarioDO = usuario.selecionarPorUsername(request.getParameter("username"));

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
        <h1>Editar Usuario</h1> <br>
        <h2>Infos do Usuario:</h2> <br>
        <h3>Nome -<%=usuarioDO.getNome()%> </h3> <br>
        <h3>Tel -<%=usuarioDO.getTelefone()%> </h3> <br>
        <h3>Data de Nascimento -<%=usuarioDO.getDataDeNascimento()%> </h3> <br>
       
        
        
        <form method="post" action="confirmacao_edicao_usuario.jsp?username=<%=request.getParameter("username")%>&action=edit">
     <fieldset>
       <legend>Alterar:</legend>
       
       <br>Nome :<br>
       <input type="text" name="nome" ><br><br>
       
       <br>Tel :<br>
       <input type="text" name="telefone" ><br><br>
       
       <br>Data :<br>
       <input type="text" name="dataDeNascimento" ><br><br>
       <br>Data :<br>
       <input type="text" name="dataDeNascimento" ><br><br>
       <br>Data :<br>
       <input type="text" name="dataDeNascimento" ><br><br>
       <br>Data :<br>
       <input type="text" name="dataDeNascimento" ><br><br>
       <br>Data :<br>
       <input type="text" name="dataDeNascimento" ><br><br>
       <br>Data :<br>
       <input type="text" name="dataDeNascimento" ><br><br>
       <br>Data :<br>
       <input type="text" name="dataDeNascimento" ><br><br>
       <br><input type="submit" value="Continuar">
     </fieldset>
     </form> 
        
    </body>
</html>

