<%-- 
    Document   : add
    Created on : Jul 9, 2015, 2:21:01 PM
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
<%@page import="Contabilidad.DAO.MonedaDAO" %>
<%@page import="Contabilidad.Model.TipoMoneda" %>
<%@page import="Contabilidad.DAO.CuentaContableDAO" %>
<%@page import="Contabilidad.Model.CuentaContable" %>
<%@page import="Contabilidad.Model.TipoCuenta" %>
<%@page import="Contabilidad.DAO.TipoCuentaDAO" %>
<%@page import="java.util.List" %>
<jsp:include page="../Layout/header.jsp" />
<jsp:include page="../Layout/Nav.jsp"/>
<section>
    <form action="../../RegistrarCuentaC" method="post">
        <div class="responsive-form">
            <div class="title">
                Descripción:
            </div>
            <div class="input">
                <input type="text" name="Descripcion" placeholder="Banco Dominicano..." id="Descripcion" required>
            </div>
            <div class="title">
                Tipo de Cuenta:
            </div>
            <div class="input">
                <select name="TipoCuenta">
                    <%
                        List<TipoCuenta> tipoCuentas = TipoCuentaDAO.TiposCuentaForInput();
                        for(TipoCuenta tipoCuenta:tipoCuentas){
                            out.print("<option value="+tipoCuenta.getIdTipoCuenta()+">"+tipoCuenta.getDescripcion()+"</option>");
                        }
                    %>
                </select>
            </div>
            <div class="title">
                Permite Transacciones:
            </div>
            <div class="input">
                <select name="PermiteTransacciones">
                    <option value="SI">SI</option>
                    <option value="NO">NO</option>
                </select>
            </div>
            
            <div class="title">
                Nivel:
            </div>
            <div class="input">
                <select name="Nivel">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                </select>
            </div>
            <div class="title">
                Cuenta Mayor:
            </div>
            <div class="input">
                <select name="CuentaMayor">
                    <option value="0">-</option>
                    <%
                        List<CuentaContable> cuentasContables = CuentaContableDAO.ListarCuentas();
                        for (CuentaContable cuentaContable:cuentasContables){
                            out.print("<option value="+cuentaContable.getIdCuentaContable()+">"+cuentaContable.getDescripcion()+"</option>");
                        }
                    %>
                </select>
            </div>
            <div class="title">
                Balance:
            </div>
            <div class="input">
                <input type="text" name="Balance" placeholder="0.00" required>
            </div>
            <!--div class="title">
                Estado:
            </div>
            <div class="input">
                <select name="N/A">
                    <option value="A">Activa</option>
                    <option value="I">Inactiva</option>
                </select>
            </div-->
            <div class="input">
                <input type="submit" value="Registrar" class="button b-green">
            </div>
        </div>
    </form>
</section>
                    <script type="text/javascript">
                        
                    </script>
<jsp:include page="../Layout/footer.jsp" />
