<%-- 
    Document   : index
    Created on : Nov 9, 2016, 9:24:41 PM
    Author     : Gabriel e thiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="maps" class="googlemaps.TravelTimeDistance" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hospiwaze</title>
    </head>
    <body>
        
        <div style="border-bottom: 1px solid black; padding: 5px; background-color: #B5D3E7" >
            <div style="display: inline; margin: 5px; font-size: 2em; padding: 5px;">
                <a href='index.jsp'>Hospiwaze</a>
            </div>
            <div style="display: inline; margin: 5px; border: 1px solid black; padding: 5px; padding-bottom: 2px;">
                <a href='formulario_cadastro_medico.jsp'>Cadastro médico</a>
            </div>
            <div style="display: inline; margin: 5px; border: 1px solid black; padding: 5px; padding-bottom: 2px;">
                <a href='consulta_hospitais.jsp'>Consulta Hospitais</a>
            </div>
            <div style="display: inline; margin: 5px; border: 1px solid black; padding: 5px; padding-bottom: 2px;">
                <a href='consulta_medicos.jsp'>Consulta Medicos</a>
            </div>
            <div style="display: inline; margin: 5px; border: 1px solid black; padding: 5px; padding-bottom: 2px;">
                <a href='formulario_cadastro_usuario.jsp'>Cadastra usuario</a>
            </div>
        </div>    
            
        <form  method="post" action="calculate.jsp" style="background-color: #D2E0F4; margin: 20px;">
        <fieldset>

        <!-- Form Name -->
        <legend>Form Name</legend>
        
        <!-- Text input-->
        <div>
          <labelfor="origem">Origem</label>  
          <div>
          <input id="origem" name="origem" type="text" placeholder="Endereco origem">

          </div>
        </div>

        <!-- Text input-->
        <div>
          <label>Destino</label>  
          <div>
          <input id="destino" name="destino" type="text" placeholder="Endereco destino">

          </div>
        </div>

        <!-- Button -->
        <div>
            <button type="button">Enviar</button>
        </div>

        </fieldset>
        </form>
           
           
        
    </body>
</html>
