<%-- 
    Document   : List
    Created on : Jul 9, 2015, 2:20:55 PM
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
<%@page import="Contabilidad.DAO.CuentaContableDAO" %>
<%@page  import="Contabilidad.Model.CuentaContable" %>
<%@page  import="java.util.List"%>
<jsp:include page="../Layout/header.jsp" />
<jsp:include page="../Layout/Nav.jsp"/>
<section>
    <table class="responsive-tab">
        <tr>
            <th>Descripcion:</th>
            <th>Permite Transacciones:</th>
            <th>Nivel:</th>
            <th>Balance:</th>
            <th><a href="add.jsp" class="link b-green">+ Nueva cuenta</a></th>
        </tr>
        <%
            List<CuentaContable> cuentasContables = CuentaContableDAO.ListarCuentas();
            for (CuentaContable cuentaContable:cuentasContables){
                out.print("<tr>"
                        + "<td>"+cuentaContable.getDescripcion()+"</td>"
                        + "<td>"+cuentaContable.getPermiteTransacciones()+"</td>"
                        + "<td>"+cuentaContable.getNivel()+"</td>"
                        + "<td>"+cuentaContable.getBalance()+"</td>"
                        + "<td><a href=\"details.jsp?ID="+cuentaContable.getIdCuentaContable()+"\" class=\"link b-blue\">Detalles</a> "
                        + "<a href=\"edit.jsp?ID="+cuentaContable.getIdCuentaContable()+"\" class=\"link b-yellow\">Editar</a> "
                        + "<a href=\"delete.jsp?ID="+cuentaContable.getIdCuentaContable()+"\" class=\"link b-red\">Eliminar</a></td>"
                        + "</tr>");
            }
        %>
    </table>
</section>
    
<jsp:include page="../Layout/footer.jsp" />