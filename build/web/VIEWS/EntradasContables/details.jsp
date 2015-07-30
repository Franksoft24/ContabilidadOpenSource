<%-- 
    Document   : details
    Created on : Jul 9, 2015, 1:17:07 PM
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
<%@page import="Contabilidad.DAO.CuentaContableDAO" %>
<%@page  import="Contabilidad.Model.CuentaContable" %>
<%@page import="Contabilidad.Model.EntradaContable" %>
<%@page import="Contabilidad.DAO.EntradaContableDAO" %>
<%@page import="Contabilidad.Model.Usuario" %>
<%@page import="Contabilidad.DAO.UsuarioDAO" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.List" %>
<%
    String Descripcion = null;
    String ModuloContabilidad =null, Estado = null, Origen =null, Moneda=null, Cuenta = null, Usuario=null;
    int ID = 0; 
    double MontoAsiento = 0.00;
    Date FechaAsiento = null;
    try{
        int IdEntradasContable = Integer.parseInt(request.getParameter("ID"));
        List<EntradaContable> entradasContables = EntradaContableDAO.SeleccionarEntradaContable(IdEntradasContable);
        for(EntradaContable entradaContable:entradasContables){
            List<TipoMoneda> tiposMonedas = MonedaDAO.SeleccionarMoneda(entradaContable.getTipoMoneda());
            for(TipoMoneda tipoMoneda:tiposMonedas){
                Moneda = tipoMoneda.getDescripcion();
            }
            List<CuentaContable> cuentasContables = CuentaContableDAO.SeleccionarCuenta(entradaContable.getCuentaContable());
            for(CuentaContable cuentaContable:cuentasContables){
                Cuenta= cuentaContable.getDescripcion();
            }
            List<Usuario> usuarios = UsuarioDAO.selectUser(entradaContable.getUsuario());
            for(Usuario usuario:usuarios){
                Usuario = usuario.getNickName();
            }
            Descripcion = entradaContable.getDescripcion();
            ModuloContabilidad= entradaContable.getModuloContabilidad();
            Estado = entradaContable.getEstado();
            Origen = entradaContable.getOrigen();
            ID= entradaContable.getIdEntradaContable();
            MontoAsiento = entradaContable.getMontoAsiento();
            FechaAsiento = entradaContable.getFechaAsiento();
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
        <div class="identificador">Descripción: <span class="contenido"><% out.print(Descripcion); %></span></div>
        <div class="identificador">Modulo Contable: <span class="contenido"><% out.print(ModuloContabilidad); %></span></div>
        <div class="identificador">Cuenta Contable: <span class="contenido"><% out.print(Cuenta); %></span></div>
        <div class="identificador">Origen: <span class="contenido"><% out.print(Origen); %></span></div>
        <div class="identificador">Usuario: <span class="contenido"><% out.print(Usuario); %></span></div>
        <div class="identificador">Fecha del asiento: <span class="contenido"><% out.print(FechaAsiento); %></span></div>
        <div class="identificador">Monto del Asiento: <span class="contenido"><% out.print(MontoAsiento); %></span></div>
        <div class="identificador">Estado: <span class="contenido"><% out.print(Estado); %></span></div>
        <div class="identificador">Tipo de moneda: <span class="contenido"><% out.print(Moneda); %></span></div>
    </div>
</section>
                    
<jsp:include page="../Layout/footer.jsp" />
