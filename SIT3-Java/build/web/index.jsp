<%-- 
    Document   : index
    Created on : Nov 9, 2016, 9:24:41 PM
    Author     : Gabriel e thiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="plano" class="planosdesaude.PlanoDeSaude" scope="session"/>
<jsp:useBean id="planoDO" class="planosdesaude.PlanoDeSaudeDO" scope="session"/>
<link type="text/css" rel="Stylesheet" href="style.css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hospiways</title>
    </head>
    <body>
        <h1>HOSPIWAYS</h1>
       
        <% if ( request.getParameter("action") != null && request.getParameter("action").equals("logout")) {
            session.setAttribute("username", null);
            session.setAttribute("nome", null);
            session.setAttribute("privilegio", null);
            session.setAttribute("idPlano", null);
           }
           
        %>
        
        <% if (session.getAttribute("username") == null || session.getAttribute("username").equals("null")) { %>
        <h2> Você não está logado! Por favor, <a href = 'formulario_cadastro_usuario.jsp'>cadastre-se</a>, ou faça o login abaixo: </h2>
            
        
        <form method="post" action="login.jsp">
         <fieldset>
        
            Username:<br>

           <input type="text" name="username" required><br><br>

           Senha:<br>

           <input type="password" name="senha" required><br><br>
           
           <a href = 'esqueci_senha.jsp'>Esqueci minha senha</a><br>

           <br><input type="submit" value="Enviar">

       </fieldset>

       </form> 

        
        <% } else { 
         
         planoDO = plano.selecionarPorId(String.valueOf(session.getAttribute("idPlano")));
        %> 
        <h3>Seja bem vindo, <%= session.getAttribute("nome") %>      (<a href='index.jsp?action=logout'> Logout </a>)</h3>
        <h3>Plano de saúde: <%= planoDO.getNome() %></h3>
        
        <% if (session.getAttribute("privilegio").equals("1")) {%> 
        
        <h4> Menu de administrador: </h4>
               
        <div>
            <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
            <div>
                <a style="display: inline" href='formulario_cadastro_medico.jsp'>Cadastro médico</a>
            </div>
            <div>
                <a style="display: inline" href='consulta_medicos.jsp'>Consulta médicos</a>
            </div>
            <div>
                <a style="display: inline" href='formulario_cadastro_hospital.jsp'>Cadastro Hospitais</a>
            </div>
            <div>
                <a href='formulario_cadastro_medico.jsp'>Cadastro médico</a>
            </div>
            <div>
                <a style="display: inline" href='formulario_cadastro_planos.jsp'>Cadastro Planos de Saúde</a>
            </div>
            <div>
                <a style="display: inline" href='consulta_planos.jsp'>Consulta Planos de Saúde</a>
            </div>
            <div>
                <a style="display: inline" href='alterar_senha.jsp'>Alterar Senha</a>
            </div>
        </div>    
        
        <% 
        } //menu administrador
        
        else { // menu usuario comum
            %>
                
                <div>
            <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
            <div>
                <a style="display: inline" href='busca_emergencia.jsp'>Busca melhor emergência!</a>
            </div>
            <div>
                <a style="display: inline" href='index.jsp#'>Alterar dados cadastrais</a>
            </div>
            <div>
                <a style="display: inline" href='marcar_consulta.jsp#'>Marcar Consulta</a>
            </div>
            <div>
                <a style="display: inline" href='desmarcar_consulta.jsp#'>Desmarcar Consultas</a>
            </div>            
            <div>
                <a style="display: inline" href='alterar_senha.jsp'>Alterar Senha</a>
            </div>
            
        </div>    
            
            <%
            
        } // menu usuario comum
            
        } // logado%>
         <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
            
         
        
    </body>
</html>
