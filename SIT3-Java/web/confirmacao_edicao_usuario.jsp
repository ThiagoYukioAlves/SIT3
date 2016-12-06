<%-- 
    Document   : confirmacao_edicao_usuario
    Created on : 06/12/2016, 17:49:38
    Author     : leo
--%>

<jsp:useBean id="usuario" class="usuario.Usuario"></jsp:useBean> 
<jsp:useBean id="usuarioPost" class="usuario.UsuarioDO"></jsp:useBean> 
<jsp:useBean id="usuarioAntigo" class="usuario.UsuarioDO"></jsp:useBean> 
<jsp:useBean id="usuarioNovo" class="usuario.UsuarioDO"></jsp:useBean> 
<jsp:setProperty property="*" name="usuarioPost"/> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        
        usuarioAntigo = usuario.selecionarPorUsername(request.getParameter("username"));
        String id;
        id = usuario.PegaIdPorUsername(request.getParameter("username"));
        
        if(usuarioPost.getNome()== null){
            usuarioNovo.setNome(usuarioAntigo.getNome());
        } else {
            usuarioNovo.setNome(usuarioPost.getNome());
            
        }
        
        
        if(usuarioPost.getTelefone()== null){
            usuarioNovo.setTelefone(usuarioAntigo.getTelefone());
        } else {
            usuarioNovo.setTelefone(usuarioPost.getTelefone());
            
        }
        
        
        if(usuarioPost.getDataDeNascimento()== null){
            usuarioNovo.setDataDeNascimento(usuarioAntigo.getDataDeNascimento());
        } else {
            usuarioNovo.setDataDeNascimento(usuarioPost.getDataDeNascimento());
            
        }
            
            
            
        if(request.getParameter("action")!=null && request.getParameter("action").equals("edit")){
        usuario.editar(id,usuarioNovo.getNome(),usuarioNovo.getTelefone(),usuarioNovo.getDataDeNascimento());
        
        }
        %>
        <h1>Edicao realizada!</h1>
        <h1><%=request.getParameter("username")%> </h1>
        <h1><%=usuarioNovo.getNome()%> </h1>
        <h1><%=usuarioNovo.getTelefone()%> </h1>
        <h1><%=usuarioNovo.getDataDeNascimento()%> </h1>
        <h1>id: <%=id%></h1>
    </body>
</html>