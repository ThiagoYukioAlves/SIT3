<%-- 
    Document   : relacao_plano_hospital
    Created on : 04/12/2016, 18:35:58
    Author     : leo
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
<jsp:useBean id="planoDO" class="planosdesaude.PlanoDeSaudeDO"></jsp:useBean>     
<jsp:useBean id="hospitalDO" class="hospitais.HospitalDO"></jsp:useBean> 
<jsp:useBean id="listaHospitaisAceitos" class="database.DbCollection"></jsp:useBean> 
<jsp:useBean id="listaHospitaisNaoAceitos" class="database.DbCollection"></jsp:useBean> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <% 
     
       planoDO = plano.selecionarPorId(request.getParameter("planoid")); 
       listaHospitaisAceitos = hospital.retornarHospitaisAceitamPlano(request.getParameter("planoid"));
       listaHospitaisNaoAceitos = hospital.retornarHospitaisNaoAceitamPlano(request.getParameter("planoid"));
       
       
       if (request.getParameter("action")!=null && request.getParameter("action").equals("add")){
           plano.incluirRelacaoHospitalPlano(request.getParameter("hospid"), request.getParameter("planoid"));
           
       } else if (request.getParameter("action")!=null && request.getParameter("action").equals("delete")) {
           plano.removerRelacaoHospitalPlano(request.getParameter("hospid"), request.getParameter("planoid"));
           
       }
    %>
    
    <h1>Gerenciamento de hospitais aceitos no plano <%=planoDO.getNome() %> </h1>
    <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
    
    <h2>Hospitais aceitos:</h2>
    
    <%
     int i = 0;
       while (i < listaHospitaisAceitos.size()){
        %>
        <h3> <%=listaHospitaisAceitos.getItem(i).getItem(1)%>  <a href='relacao_plano_hospital.jsp?planoid=<%=request.getParameter("planoid")%>&action=delete&hospid=<%=listaHospitaisAceitos.getItem(i).getItem(0)%>'>[Remover]</a><h3>
        <%
        i++;
       }
     %>
     <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
     
     <h2>Hospitais Nao aceitos:</h2>
    
    <%
     int j = 0;
       while (j < listaHospitaisNaoAceitos.size()){
        %>
        <h3> <%=listaHospitaisNaoAceitos.getItem(j).getItem(1)%> <a href='relacao_plano_hospital.jsp?planoid=<%=request.getParameter("planoid")%>&action=add&hospid=<%=listaHospitaisNaoAceitos.getItem(j).getItem(0)%>'>[Adicionar]</a><h3>
        <%
        j++;
       }
     %>
     <hr style="height:2px; border:none; color:#000; background-color:#000; margin-top: 0px; margin-bottom: 0px;"/>
     
     <h3><center><a href='index.jsp'>Voltar ao Início</a>  |  <a href='consulta_hospitais.jsp'>Listar hospitais</a></center></h3>
    

    </body>
</html>
