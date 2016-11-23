<%-- 
    Document   : cadastra_usuario
    Created on : Nov 20, 2016, 8:20:23 PM
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="planos" class="planosdesaude.PlanoDeSaude" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>Formul&aacute;rio</h1>

        <form method="post" action="confirmacao_cadastro_usuario.jsp">
         <fieldset>
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

       <input type="tel" name="telefone" required><br><br>

       Endere&ccedil;o:<br>

       <input type="text" name="endereco" required><br><br>
       
        Username:<br>

       <input type="text" name="username" required><br><br>

       Senha:<br>

       <input type="password" name="senha" required><br><br>

       <br><input type="submit" value="Enviar">

       </fieldset>

       </form> 
    </body>
</html>
