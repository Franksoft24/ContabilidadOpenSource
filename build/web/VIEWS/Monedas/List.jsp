<%-- 
    Document   : List
    Created on : Jul 9, 2015, 3:01:02 PM
    Author     : Frankmer
--%>
<%@page import="Contabilidad.DAO.MonedaDAO" %>
<%@page import="Contabilidad.Model.TipoMoneda" %>
<%@page import="java.util.List" %>

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
<jsp:include page="../Layout/header.jsp" />
<jsp:include page="../Layout/Nav.jsp"/>
<section>
    <table class="responsive-tab">
        <tr>
            <th>Tipo de Moneda:</th>
            <th>Ultima Tasa:</th>
            <th>Estado:</th>
            <th><a href="add.jsp" class="link b-green">Agregar moneda</a></th>
        </tr>
        <%
            List<TipoMoneda> tiposMonedas = MonedaDAO.ListarMonedas();
            for(TipoMoneda tipoMoneda:tiposMonedas){
                out.print("<tr>"
                        + "<td>"+tipoMoneda.getDescripcion()+"</td>"
                        + "<td>"+tipoMoneda.getUltimaTasa()+"</td>"
                        + "<td>"+tipoMoneda.getEstado()+"</td>"
                        + "<td><a href=\"details.jsp?ID="+tipoMoneda.getIdTipoMoneda()+"\" class=\"link b-blue\">Detalles</a> "
                        + "<a href=\"edit.jsp?ID="+tipoMoneda.getIdTipoMoneda()+"\" class=\"link b-yellow\">Editar</a> "
                        + "<a href=\"delete.jsp?ID="+tipoMoneda.getIdTipoMoneda()+"\" class=\"link b-red\">Eliminar</a></td>"
                        + "</tr>");
            }
        %>
    </table>
</section>
    
<jsp:include page="../Layout/footer.jsp" />
