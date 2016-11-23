<%-- 
    Document   : formulario_cadastro_medico
    Created on : Nov 23, 2016, 6:44:32 PM
    Author     : thiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<h1>Cadastro de M&eacute;dico</h1>

 <form method="post" action="confirmacao_cadastro_medico.jsp">
  <fieldset>
    <legend>Dados do m&eacute;dico:</legend>
    <br>Nome do m&eacute;dico:<br>
    <input type="text" name="nome"><br><br>
    Especialidade:<br>
    <input type="text" name="especialidade"><br><br>
    Telefone:<br>
    <input type="text" name="telefone"><br><br>
    CRM:<br>
    <input type="number" name="CRM"  min="1000" max="9999999999">
    <!--
    <select name="estado">
      <option value="AC">AC</option>
      <option value="AL">AL</option>
      <option value="AP">AP</option>
      <option value="AM">AM</option>
      <option value="BA">BA</option>
      <option value="CE">CE</option>
      <option value="DF">DF</option>
      <option value="ES">ES</option>
      <option value="GO">GO</option>
      <option value="MA">MA</option>
      <option value="MT">MT</option>
      <option value="MS">MS</option>
      <option value="MG">MG</option>
      <option value="PA">PA</option>
      <option value="PB">PB</option>
      <option value="PR">PR</option>
      <option value="PE">PE</option>
      <option value="PI">PI</option>
      <option value="RJ">RJ</option>
      <option value="RN">RN</option>
      <option value="RS">RS</option>
      <option value="RO">RO</option>
      <option value="RR">RR</option>
      <option value="SC">SC</option>
      <option value="SP">SP</option>
      <option value="SE">SE</option>
      <option value="TO">TO</option>
    </select><br><br>
    -->
    <!--
    Hospital: <br>
    <select name="hospital_trabalha">
      <option value="hospital1">Hospital 1</option>
      <option value="hospital2">Hospital 2</option>
      <option value="hospital3">Hospital 3</option>
      <option value="hospital4">Hospital 4</option>
    </select>
    -->
    <br><br>
    <br><input type="submit" value="Enviar">
  </fieldset>
</form> 

</body>
</html>