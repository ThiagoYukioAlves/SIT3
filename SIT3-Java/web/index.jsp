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
        
        <div style="border: 2px solid red" >
            <div>
                <a style="display: inline" href='formulario_cadastro_medico.jsp'>Cadastro médico</a>
            </div>
            <div>
                <a style="display: inline" href='consulta_hospitais.jsp'>Consulta Hospitais</a>
            </div>
            <div>
                <a style="display: inline" href='consulta_medicos.jsp'>Consulta Medicos</a>
            </div>
            <div>
                <a style="display: inline" href='formulario_cadastro_usuario.jsp'>Cadastra usuario</a>
            </div>
        </div>    
            
        <form class="appnitro"  method="post" action="calculate.jsp">
        <fieldset>

        <!-- Form Name -->
        <legend>Form Name</legend>
        
        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="origem">Origem</label>  
          <div class="col-md-4">
          <input id="origem" name="origem" type="text" placeholder="" class="form-control input-md" id="origem">

          </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="destino">Destino</label>  
          <div class="col-md-4">
          <input id="destino" name="destino" type="text" placeholder="" class="form-control input-md" id="destino">

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
