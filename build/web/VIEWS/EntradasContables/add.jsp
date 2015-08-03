<%-- 
    Document   : add
    Created on : Jul 9, 2015, 11:30:50 AM
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
<%@page import="Contabilidad.Model.CuentaContable" %>
<%@page import="java.util.List" %>
<jsp:include page="../Layout/header.jsp" />
<jsp:include page="../Layout/Nav.jsp"/>
<section>
    <form action="../../RegistrarEntrada" method="post">
        <div class="responsive-form">
            <div class="title">
                Descripción:
            </div>
            <div class="input">
                <input type="text" name="Descripcion" placeholder="compras ..." id="Descripcion" required>
            </div>
            <div class="title">
                Modulo de Contabilidad:
            </div>
            <div class="input">
                <input type="text" name="ModuloContabilidad" placeholder="GAS" id="ModuloContabilidad" required>
            </div>
            <div class="title">
                Monto:
            </div>
            <div class="input">
                <input type="text" name="MontoAsiento" placeholder="0.00" id="Monto" required>
            </div>
            
            <div class="title">
                Cuenta Contable debito:
            </div>
            <div class="input">
                <select name="IdCuentaContable">
                    <%
                        List<CuentaContable> cuentasContables = CuentaContableDAO.SeleccionarCuentaInput();
                        for(CuentaContable cuentaContable:cuentasContables){
                            out.print("<option value="+cuentaContable.getIdCuentaContable()+">"+cuentaContable.getDescripcion()+"</option>");
                        }
                    %>
                </select>
                <!--input type="text" name="ModuloContabilidad" placeholder="Modulo de Contabilidad" id="ModuloContabilidad" onkeyup="inputTitle('Modulo de Contabilidad:',1,'ModuloContabilidad')" required-->
            </div>
                
            <div class="title">
                Cuenta Contable credito:
            </div>
            <div class="input">
                <select name="IdCuentaContable">
                    <%
                        
                        for(CuentaContable cuentaContable:cuentasContables){
                            out.print("<option value="+cuentaContable.getIdCuentaContable()+">"+cuentaContable.getDescripcion()+"</option>");
                        }
                    %>
                </select>
                <!--input type="text" name="ModuloContabilidad" placeholder="Modulo de Contabilidad" id="ModuloContabilidad" onkeyup="inputTitle('Modulo de Contabilidad:',1,'ModuloContabilidad')" required-->
            </div>
            <div class="title">
                Origen:
            </div>
            <div class="input">
                <select name="Origen">
                    <option value="DB">Debito</option>
                    <option value="CR">Credito</option>
                </select>
            </div>
            <div class="title hidden">
                Estado:
            </div>
            <div class="input hidden">
                <select name="Estado">
                    <option value="A">Activa</option>
                    <option value="I">Inactiva</option>
                </select>
            </div>
            <div class="title">
                Moneda:
            </div>
            <div class="input">
                <select name="IdTipoMoneda">
                    <%
                        List<TipoMoneda> tiposMonedas = MonedaDAO.tiposMonedaForInput();
                        for(TipoMoneda tipoMoneda:tiposMonedas){
                            out.print("<option value="+tipoMoneda.getIdTipoMoneda()+">"+tipoMoneda.getDescripcion()+"</option>");
                        }
                    %>
                </select>
            </div>
            
            <div class="input">
                <input type="submit" value="Registrar" class="button b-green">
                <input type="hidden" name="FechaAsiento" placeholder="Fecha Asiento" id="getDateinput">
                <!--input type="hidden" name="Origen" placeholder="Origen" value="US"-->
                <input type="hidden" name="Usuario" placeholder="Usuario" value="${sessionScope.usrcodI}">
            </div>
        </div>
    </form>
</section>
                    <script type="text/javascript">
                        function getDateNow(){
                            var now = new Date();
                            document.getElementById('getDateinput').value = now.getFullYear()+"-"+(now.getMonth()+1)+"-"+now.getDate();
                        }
                        getDateNow();
                    </script>
<jsp:include page="../Layout/footer.jsp" />
