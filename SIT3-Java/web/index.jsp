<%-- 
Teste de commit

    Document   : index
    Created on : Nov 9, 2016, 9:24:41 PM
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="maps" class="googlemaps.TravelTimeDistance" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <div>
            <a href='formulario_cadastro_medico.jsp'>Cadastro médico</a><br>
            <a href='consulta_hospitais.jsp'>Consulta Hospitais</a><br>
            <a href='formulario_cadastro_usuario.jsp'>Cadastra usuario</a><br>
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
        <div class="form-group">
          <label class="col-md-4 control-label" for="button"></label>
          <div class="col-md-4">
            <button id="button" name="button" class="btn btn-primary">Enviar</button>
          </div>
        </div>

        </fieldset>
        </form>
           
           
        

        </div>
    </body>
</html>
