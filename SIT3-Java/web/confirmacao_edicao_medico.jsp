<%-- 
    Document   : confirmação_edicao_medico
    Created on : Dec 6, 2016, 7:37:05 PM
    Author     : Pedro
--%>

<jsp:useBean id="medico" class="medico.Medico"></jsp:useBean> 
<jsp:useBean id="medicoPost" class="medico.MedicoDO"></jsp:useBean> 
<jsp:useBean id="medicoAntigo" class="medico.MedicoDO"></jsp:useBean> 
<jsp:useBean id="medicoNovo" class="medico.MedicoDO"></jsp:useBean> 
<jsp:setProperty property="*" name="medicoPost"/> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        
        medicoAntigo = medico.selecionarPorId(request.getParameter("medid"));
        String id;
        id = medico.PegaIdPorCRM(medicoAntigo.getCRM());
        
        if(medicoPost.getNome()== null){
            medicoNovo.setNome(medicoAntigo.getNome());
        } else {
            medicoNovo.setNome(medicoPost.getNome());
            
        }
        
        
        if(medicoPost.getTelefone()== null){
            medicoNovo.setTelefone(medicoAntigo.getTelefone());
        } else {
            medicoNovo.setTelefone(medicoPost.getTelefone());
            
        }
        
        
        if(medicoPost.getCRM()== null){
            medicoNovo.setCRM(medicoAntigo.getCRM());
        } else {
            medicoNovo.setCRM(medicoPost.getCRM());
            
        }
            
        
        if(medicoPost.getEspecialidade()== null){
            medicoNovo.setEspecialidade(medicoAntigo.getEspecialidade());
        } else {
            medicoNovo.setEspecialidade(medicoPost.getEspecialidade());
            
        }
            
            
            
        if(request.getParameter("action")!=null && request.getParameter("action").equals("edit")){
        medico.editar(id,medicoNovo.getNome(),medicoNovo.getTelefone(),medicoNovo.getCRM(),medicoNovo.getEspecialidade());
        
        }
        %>
        <h1>Edicao realizada!</h1>
        <h1><%=request.getParameter("medid")%> </h1>
        <h1><%=medicoNovo.getNome()%> </h1>
        <h1><%=medicoNovo.getTelefone()%> </h1>
        <h1><%=medicoNovo.getCRM()%> </h1>
        <h1><%=medicoNovo.getEspecialidade()%> </h1>
        <h1>id: <%=id%></h1>
    
    
        <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
        <h3><a href="index.jsp">Voltar</a></h3>
    
    </body>
</html>