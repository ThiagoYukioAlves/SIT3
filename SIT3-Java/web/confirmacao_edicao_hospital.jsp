<%-- 
    Document   : confirmacao_edicao_hospital
    Created on : 06/12/2016, 20:58:15
    Author     : leo
--%>

<jsp:useBean id="hospital" class="hospitais.Hospital"></jsp:useBean> 
<jsp:useBean id="hospitalDO" class="hospitais.HospitalDO"></jsp:useBean>  
<jsp:useBean id="hospitalPost" class="hospitais.HospitalDO"></jsp:useBean> 
<jsp:useBean id="hospitalAntigo" class="hospitais.HospitalDO"></jsp:useBean> 
<jsp:useBean id="hospitalNovo" class="hospitais.HospitalDO"></jsp:useBean>
<jsp:setProperty property="*" name="hospitalPost"/> 


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        if(hospitalPost.getNome()== null){
            hospitalNovo.setNome(hospitalAntigo.getNome());
        } else {
            hospitalNovo.setNome(hospitalPost.getNome());
            
        }
        
        
        if(hospitalPost.getTelefone()== null){
            hospitalNovo.setTelefone(hospitalAntigo.getTelefone());
        } else {
            hospitalNovo.setTelefone(hospitalPost.getTelefone());
            
        }
        
        
        if(hospitalPost.getEndereco()== null){
            hospitalNovo.setEndereco(hospitalAntigo.getEndereco());
        } else {
            hospitalNovo.setEndereco(hospitalPost.getEndereco());
            
        }
        if(request.getParameter("action")!=null && request.getParameter("action").equals("edit")){
        hospital.editar(request.getParameter("hospid"),hospitalNovo.getNome(), hospitalNovo.getTelefone(), hospitalNovo.getEndereco());
        
        }
        %>
        <h1>Edicao realizada!</h1>
        <h1><%=request.getParameter("hospid")%> </h1>
        <h1><%=hospitalNovo.getNome()%> </h1>
        <h1><%=hospitalNovo.getEndereco()%> </h1>
        <h1><%=hospitalNovo.getTelefone()%> </h1>
    </body>
</html>