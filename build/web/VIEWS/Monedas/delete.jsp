<%-- 
    Document   : delete
    Created on : Jul 9, 2015, 3:01:20 PM
    Author     : Frankmer
--%>
<%
    int rol = 100;
    if(session.getAttribute("rol")!=null){
        rol = (Integer) session.getAttribute("rol");
    }
    if(session.getAttribute("usrcodI")==null||session.getAttribute("rol")==null){
        response.sendRedirect("../Login");
    }else if(session.getAttribute("usrcodI")!=null&&rol>2){
        response.sendRedirect("List.jsp");
    }
%>
<%@page import="Contabilidad.DAO.MonedaDAO" %>
<%@page import="Contabilidad.Model.TipoMoneda" %>
<%@page import="java.util.List" %>
<%
    String Descripcion = null, Estado = null;
    Double Tasa=0.00;
    int ID = 0; 
    try{
        int IdMoneda = Integer.parseInt(request.getParameter("ID"));
        List<TipoMoneda> Monedas = MonedaDAO.SeleccionarMoneda(IdMoneda);
        for (TipoMoneda Moneda:Monedas){
            Descripcion = Moneda.getDescripcion();
            Estado = Moneda.getEstado();
            Tasa = Moneda.getUltimaTasa();
            ID = Moneda.getIdTipoMoneda();
        }
        
    }catch(Exception e){
        response.sendRedirect("List.jsp");
    }
%>
<jsp:include page="../Layout/header.jsp" />
<jsp:include page="../Layout/Nav.jsp"/>
<section>
    <div class="responsive-dataShow">
        <div class="identificador">Codigo: <span class="contenido"><% out.print(ID); %></span></div>
        <div class="identificador">Nombre: <span class="contenido"><% out.print(Descripcion); %></span></div>
        <div class="identificador">Ultima Tasa: <span class="contenido"><% out.print(Tasa); %></span></div>
        <div class="identificador">Estado: <span class="contenido"><% out.print(Estado); %></span></div>
        <a href="../../DeleteMoneda?ID=<% out.print(ID); %>" class="link"><button class="button b-red" style="width: 30%;
float: left;">Eliminar</button></a>
    </div>
</section>
                    
<jsp:include page="../Layout/footer.jsp" />
