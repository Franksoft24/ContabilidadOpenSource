<%-- 
    Document   : consult
    Created on : Aug 5, 2015, 2:51:34 AM
    Author     : Frankmer
--%>

<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Contabilidad.DAO.ConsultaDAO" %>
<%@page import="Contabilidad.Consultas.EntradaContable" %>
<%@page import="java.util.List" %>
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
    <div class="responsive-form">
        <form method="post" action="">
            <div class="title">
                Modulo Contabilidad:
            </div>
            <div class="input">
                <select name="CuentaContable">
                    <%
                        List<CuentaContable> cuentasContables = CuentaContableDAO.SeleccionarCuentaInput();
                        for(CuentaContable cuentaContable:cuentasContables){
                            out.print("<option value="+cuentaContable.getIdCuentaContable()+">"+cuentaContable.getDescripcion()+"</option>");
                        }
                    %>
                </select>
            </div>
            <div class="title">
                Fecha Inicio:
            </div>
            <div class="input">
                <input type="text" name="FechaInicio" placeholder="yyyy-MM-dd"/>
            </div>
            <div class="title">
                Fecha Fin:
            </div>
            <div class="input">
                <input type="text" name="FechaFin" placeholder="yyyy-MM-dd"/>
            </div>
            <div class="input">
                <input type="submit" value="Buscar Entradas" class="button"/>
            </div>
        </form>
    </div>
    <table class="responsive-tab">
        <tr>
            <th>Cuenta Contable:</th>
            <th>#:</th>
            <th>Moneda:</th>
            <th>Origen:</th>
            <th>Modulo:</th>
            <th>Fecha:</th>
            <th>Monto:</th>
            <th>Estado:</th>
            <th>Usuario:</th>
        </tr>
        <%
            
            try{
                int Cuenta = Integer.parseInt(request.getParameter("CuentaContable"));
                Date FechaInicio=null;
                try{    
                    FechaInicio = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("FechaInicio"));
                }catch (ParseException ex){
                    ex.printStackTrace();
                }
                Date FechaFin=null;
                try{    
                    FechaFin = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("FechaFin"));
                }catch (ParseException ex){
                    ex.printStackTrace();
                }
                List<EntradaContable> entradasContables = ConsultaDAO.ConsultarEntrada(Cuenta, FechaInicio, FechaFin);
                for(EntradaContable entradaContable:entradasContables){
                    out.print("<tr>"
                            + "<td>"+entradaContable.getCodigoCuentaContable()+"-"+entradaContable.getCuentaContable()+"</td>"
                            + "<td>"+entradaContable.getIdEntrada()+"</td>"
                            + "<td>"+entradaContable.getMoneda()+"</td>"
                            + "<td>"+entradaContable.getOrigen()+"</td>"
                            + "<td>"+entradaContable.getModulo()+"</td>"
                            + "<td>"+entradaContable.getFecha()+"</td>"
                            + "<td>"+entradaContable.getMonto()+"</td>"
                            + "<td>"+entradaContable.getEstado()+"</td>"
                            + "<td>"+entradaContable.getUsuario()+"</td>"
                            + "</tr>");
                }
            }catch(Exception e){
                out.print("<td colspan='9'>No se encontraron registros.</td>");
            }
            /*
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
            }*/
        %>
    </table>
</section>
    
<jsp:include page="../Layout/footer.jsp" />
