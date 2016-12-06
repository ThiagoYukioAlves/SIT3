<%-- 
    Document   : alterar_usuario_admin
    Created on : Dec 5, 2016, 12:50:10 AM
    Author     : Pedro
--%>


<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
<link type="text/css" rel="Stylesheet" href="style.css"/>
<jsp:useBean id="planos" class="planosdesaude.PlanoDeSaude" scope="session"/>
<jsp:useBean id="usuario" class="usuario.Usuario"></jsp:useBean> 
<jsp:useBean id="usuarioDO" class="usuario.UsuarioDO"></jsp:useBean> 
<jsp:useBean id="lista_usuario" class="database.DbCollection"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>Alterar Formul&aacute;rio</h1>
        
<%        
        lista_usuario = usuario.selecionarPorId();
%>

        <form method="post" action="confirmacao_cadastro_usuario.jsp">
         
           <legend>Dados pessoais:</legend>

       Nome:<br>

       <input type="text" name="nome" required><br><br>

     
       Data de nascimento:<br>

       <input type="date" name="dataDeNascimento" required><br><br>

       Voc&ecirc; &eacute portador de alguma defici&ecirc;ncia?<br>

       <input type="radio" name="portadorDeDeficiencia" value="1" required> Sim<br>

       <input type="radio" name="portadorDeDeficiencia" value="0" required> N&atilde;o<br><br>

       Plano de sa&uacute;de:
           <%= planos.retornaSelectDePlanos() %>
           <br><br>



       Telefone:<br>

       <input type="tel" name="telefone" onkeypress='return event.charCode >= 48 && event.charCode <= 57' required><br><br>

       Endere&ccedil;o:<br>

       <input type="text" value="<%=lista_usuario.getItem(1)%>" name="endereco" required><br><br>
       
       <br><input type="submit" value="Enviar">

       

       </form> 
    </body>
</html>