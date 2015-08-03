<%-- 
    Document   : List
    Created on : Jul 9, 2015, 10:51:37 AM
    Author     : Frankmer
--%>
<%@page import="Contabilidad.DAO.EntradaContableDAO" %>
<%@page import="Contabilidad.Model.EntradaContable" %>
<%@page import="java.util.List" %>
<%@page import="Contabilidad.DAO.MonedaDAO" %>
<%@page import="Contabilidad.Model.TipoMoneda" %>
<%@page import="Contabilidad.DAO.CuentaContableDAO" %>
<%@page  import="Contabilidad.Model.CuentaContable" %>

<%
    if(session.getAttribute("usrcodI")==null){
        response.sendRedirect("../Login");
    } 
%>
<jsp:include page="../Layout/header.jsp" />
<jsp:include page="../Layout/Nav.jsp"/>
<section>
    <table class="responsive-tab">
        <tr>
            <th>Descripcion:</th>
            <!--th>Modulo:</th-->
            <th>Cuenta contable:</th>
            <th>Fecha:</th>
            <th>Origen:</th>
            <th>Monto:</th>
            <!--th>Estado:</th-->
            <!--th>Tipo Moneda</th-->
            <th><a href="add.jsp" class="link b-green">&nbsp;&nbsp;+ Nueva entrada &nbsp;&nbsp;</a></th>
        </tr>
        <%
            List<EntradaContable> entradasContables = EntradaContableDAO.MostrarEntradasContables();
            for(EntradaContable entradaContable:entradasContables){
                List<TipoMoneda> tiposMonedas = MonedaDAO.SeleccionarMoneda(entradaContable.getTipoMoneda());
                for(TipoMoneda tipoMoneda:tiposMonedas){
                    List<CuentaContable> cuentasContables = CuentaContableDAO.SeleccionarCuenta(entradaContable.getCuentaContable());
                    for(CuentaContable cuentaContable:cuentasContables){
                        out.print("<tr>"
                            + "<td>"+entradaContable.getDescripcion()+"</td>"
                            + "<td>"+cuentaContable.getDescripcion()+"</td>"
                            + "<td>"+entradaContable.getFechaAsiento()+"</td>"
                            + "<td>"+entradaContable.getOrigen()+"</td>"
                            + "<td>"+entradaContable.getMontoAsiento()+" "+tipoMoneda.getDescripcion()+"</td>"
                            + "<!--td>"+tipoMoneda.getDescripcion()+"</td-->"
                            + "<td><a href=\"details.jsp?ID="+entradaContable.getIdEntradaContable()+"\" class=\"link b-blue\"> ... Detalles </a>&nbsp;"
                            + "<a href=\"edit.jsp?ID="+entradaContable.getIdEntradaContable()+"\" class=\"link b-yellow\"> * Editar </a>&nbsp;"
                            + "<a href=\"delete.jsp?ID="+entradaContable.getIdEntradaContable()+"\" class=\"link b-red\"> - Eliminar</a></td>"
                            + "</tr>");
                    }
                }
            }
        %>
    </table>
</section>
    
<jsp:include page="../Layout/footer.jsp" />
