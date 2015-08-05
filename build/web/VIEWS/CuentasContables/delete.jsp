<%-- 
    Document   : delete
    Created on : Jul 9, 2015, 2:21:42 PM
    Author     : Frankmer
--%>

<%
    int rol = 100;
    if(session.getAttribute("rol")!=null){
        rol = (Integer) session.getAttribute("rol");
    }
    if(session.getAttribute("usrcodI")==null||session.getAttribute("rol")==null){
        response.sendRedirect("../Login");
    }else if(session.getAttribute("usrcodI")!=null&&rol>1){
        response.sendRedirect("List.jsp");
    }
%>
<%@page import="Contabilidad.DAO.CuentaContableDAO" %>
<%@page import="Contabilidad.Model.CuentaContable" %>
<%@page import="Contabilidad.Model.TipoCuenta" %>
<%@page import="Contabilidad.DAO.TipoCuentaDAO" %>
<%@page import="java.util.List" %>
<%
    String Descripcion = null, TipoCuenta_=null, PermiteTransacciones=null, CuentaMayor = null, Estado = null;
    int Nivel = 0, ID =0;
    double Balance = 0.00;
    try{
        int IdCuentaContable = Integer.parseInt(request.getParameter("ID"));
        List<CuentaContable> cuentasContables = CuentaContableDAO.SeleccionarCuenta(IdCuentaContable);
        for(CuentaContable cuentaContable:cuentasContables){
            Descripcion = cuentaContable.getDescripcion();
            List<TipoCuenta> tipoCuentas = TipoCuentaDAO.seleccionarCuentaForInput(cuentaContable.getTipoCuenta());
            for(TipoCuenta tipoCuenta:tipoCuentas){
                TipoCuenta_ = tipoCuenta.getDescripcion();
            }
            PermiteTransacciones = cuentaContable.getPermiteTransacciones();
            Estado = cuentaContable.getEstado();
            Nivel = cuentaContable.getNivel();
            Balance = cuentaContable.getBalance();
            ID = cuentaContable.getIdCuentaContable();
            List<CuentaContable> cuentasMayor = CuentaContableDAO.SeleccionarCuenta(cuentaContable.getCuentaMayor());
            for(CuentaContable cuentaMayor:cuentasMayor){
                CuentaMayor = cuentaMayor.getDescripcion();
            }
            if(cuentaContable.getNivel()<3){
                response.sendRedirect("List.jsp");
            }
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
        <div class="identificador">Tipo de Cuenta: <span class="contenido"><% out.print(TipoCuenta_); %></span></div>
        <div class="identificador">Permite Transacciones: <span class="contenido"><% out.print(PermiteTransacciones); %></span></div>
        <div class="identificador">Nivel: <span class="contenido"><% out.print(Nivel); %></span></div>
        <div class="identificador">Cuenta Mayor: <span class="contenido"><% out.print(CuentaMayor); %></span></div>
        <div class="identificador">Balance: <span class="contenido"><% out.print(Balance); %></span></div>
        <div class="identificador">Estado: <span class="contenido"><% out.print(Estado); %></span></div>
        <a href="../../DeleteCuentaC?ID=<% out.print(ID); %>" class="link"><button class="button b-red" style="width: 30%;
float: left;">Eliminar</button></a>
    </div>
</section>
                    
<jsp:include page="../Layout/footer.jsp" />