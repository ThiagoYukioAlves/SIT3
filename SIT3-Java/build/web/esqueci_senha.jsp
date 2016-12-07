<%-- 
    Document   : esqueci_senha
    Created on : Dec 6, 2016, 5:59:45 PM
    Author     : mario
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link type="text/css" rel="Stylesheet" href="style.css"/>
<jsp:useBean id="usuario" class="usuario.Usuario"></jsp:useBean> 
<jsp:useBean id="usuarioDO" class="usuario.UsuarioDO"></jsp:useBean> 
<jsp:setProperty property="*" name="usuarioDO"/> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Esqueci minha senha</title>
    </head>
    <body>
        
    <form method="post" action="confirmacao_esqueci_senha.jsp">
     <fieldset>
       <br>Confirme o seu nome de usuário:<br>
       <input type="text" name="username" required><br><br>
       
       <br><input type="submit" value="Continuar">
     </fieldset>
   </form> 
        <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
    </body>
</html>
