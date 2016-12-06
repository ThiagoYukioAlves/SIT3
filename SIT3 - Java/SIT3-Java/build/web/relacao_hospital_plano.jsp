<%-- 
    Document   : relacao_hospital_plano
    Created on : Nov 28, 2016, 10:50:13 PM
    Author     : Gabriel
--%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
<link type="text/css" rel="Stylesheet" href="style.css"/>

            <%
                if (session.getAttribute("privilegio") == null || !session.getAttribute("privilegio").equals("1")) {
            %>

            <script>
                alert("Você não tem permissão para acessar essa página!");
                window.location.replace("index.jsp");
            </script>

            <% } %>

<jsp:useBean id="hospital" class="hospitais.Hospital"></jsp:useBean> 
<jsp:useBean id="plano" class="planosdesaude.PlanoDeSaude"></jsp:useBean>     
<jsp:useBean id="hospitalDO" class="hospitais.HospitalDO"></jsp:useBean> 
<jsp:useBean id="listaPlanosAceitos" class="database.DbCollection"></jsp:useBean> 
<jsp:useBean id="listaPlanosNaoAceitos" class="database.DbCollection"></jsp:useBean> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <% 
                
       if (request.getParameter("action")!=null && request.getParameter("action").equals("remove")){
           plano.removerRelacaoHospitalPlano(request.getParameter("hospid"), request.getParameter("pid"));
       } else if (request.getParameter("action")!=null && request.getParameter("action").equals("add")){
           plano.incluirRelacaoHospitalPlano(request.getParameter("hospid"), request.getParameter("pid"));
       }
       
       hospitalDO = hospital.selecionarPorId(request.getParameter("hospid")); 
       listaPlanosAceitos = plano.retornarPlanosAceitosHospital(request.getParameter("hospid"));
       listaPlanosNaoAceitos = plano.retornarPlanosNaoAceitosHospital(request.getParameter("hospid"));
       
      
    %>
    
    <h1>Gerenciamento de planos aceitos por <%=hospitalDO.getNome() %> </h1>
    <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
    
    <h2>Planos aceitos:</h2>
    
    <%
     int i = 0;
       while (i < listaPlanosAceitos.size()){
        %>
        <h3> <%=listaPlanosAceitos.getItem(i).getItem(1)%> <a href='relacao_hospital_plano.jsp?hospid=<%=request.getParameter("hospid")%>&action=remove&pid=<%=listaPlanosAceitos.getItem(i).getItem(0)%>'>[Remover]</a> <h3>
        <%
        i++;
       }
     %>
     <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
     
     <h2>Planos não aceitos:</h2>
    
    <%
     i = 0;
       while (i < listaPlanosNaoAceitos.size()){
        %>
        <h3> <%=listaPlanosNaoAceitos.getItem(i).getItem(1)%> <a href='relacao_hospital_plano.jsp?hospid=<%=request.getParameter("hospid")%>&action=add&pid=<%=listaPlanosNaoAceitos.getItem(i).getItem(0)%>'>[Adicionar]</a> <h3>
                
        <%
        i++;
       }
     %>
     <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
     <h3><center><a href='index.jsp'>Voltar ao Início</a>  |  <a href='consulta_hospitais.jsp'>Listar hospitais</a></center></h3>
    
    </body>
</html>
