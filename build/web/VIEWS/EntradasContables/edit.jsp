<%-- 
    Document   : edit
    Created on : Jul 9, 2015, 1:17:34 PM
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
<%@page import="Contabilidad.Model.EntradaContable" %>
<%@page import="Contabilidad.DAO.EntradaContableDAO" %>
<%@page import="java.util.List" %>
<%
    String Descripcion = null;
    String ModuloContabilidad =null, Estado = null, Origen =null;
    int ID = 0, IdCuentaContable =0, IdTipoMoneda =0; 
    double MontoAsiento = 0.00;
    try{
        int IdEntradasContable = Integer.parseInt(request.getParameter("ID"));
        List<EntradaContable> entradasContables = EntradaContableDAO.SeleccionarEntradaContable(IdEntradasContable);
        
        for(EntradaContable entradaContable:entradasContables){
            Descripcion = entradaContable.getDescripcion();
            ModuloContabilidad= entradaContable.getModuloContabilidad();
            Estado = entradaContable.getEstado();
            Origen = entradaContable.getOrigen();
            ID= entradaContable.getIdEntradaContable();
            IdCuentaContable = entradaContable.getCuentaContable();
            IdTipoMoneda=entradaContable.getTipoMoneda();
            MontoAsiento = entradaContable.getMontoAsiento();
        }
    }catch(Exception e){
        response.sendRedirect("List.jsp");
    }
%>
<jsp:include page="../Layout/header.jsp" />
<jsp:include page="../Layout/Nav.jsp"/>
<section>
    <form action="../../EditarEntrada" method="post">
        <div class="responsive-form">
            <div class="title">
                Descripción:
            </div>
            <div class="input">
                <input type="text" name="Descripcion" placeholder="Descripcion" value="<% out.print(Descripcion); %>" required>
            </div>
            <div class="title">
                Modulo de Contabilidad:
            </div>
            <div class="input">
                <input type="text" name="ModuloContabilidad" placeholder="Modulo Contabilidad" value="<% out.print(ModuloContabilidad); %>" required>
            </div>
            <div class="title">
                Monto:
            </div>
            <div class="input">
                <input type="text" name="MontoAsiento" placeholder="Monto Asiento"  value="<% out.print(MontoAsiento); %>" required>
            </div>
            
            <div class="title">
                Cuenta Contable:
            </div>
            <div class="input">
                <select name="IdCuentaContable" id="IdCuentaContable">
                    <%
                        List<CuentaContable> cuentasContables = CuentaContableDAO.ListarCuentas();
                        for(CuentaContable cuentaContable:cuentasContables){
                            out.print("<option value="+cuentaContable.getIdCuentaContable()+">"+cuentaContable.getDescripcion()+"</option>");
                        }
                    %>
                </select>
            </div>
            <!--div class="title">
                Origen:
            </div>
            <div class="input">
                <select name="Origen">
                    <option value="DB">Debito</option>
                    <option value="CR">Credito</option>
                </select>
            </div-->
            <div class="title">
                Estado:
            </div>
            <div class="input">
                <select name="Estado" id="Estado">
                    <option value="A">Activa</option>
                    <option value="I">Inactiva</option>
                </select>
            </div>
            <div class="title">
                Moneda:
            </div>
            <div class="input">
                <select name="IdTipoMoneda" id="IdTipoMoneda">
                    <%
                        List<TipoMoneda> tiposMonedas = MonedaDAO.tiposMonedaForInput();
                        for(TipoMoneda tipoMoneda:tiposMonedas){
                            out.print("<option value="+tipoMoneda.getIdTipoMoneda()+">"+tipoMoneda.getDescripcion()+"</option>");
                        }
                    %>
                </select>
            </div>
            
            <div class="input">
                <input type="submit" value="Modificar" class="button">
                <input type="hidden" name="FechaAsiento" placeholder="Fecha Asiento" id="getDateinput">
                <input type="hidden" name="Origen" placeholder="Origen" value="US">
                <input type="hidden" name="IdEntradaContable" value="<%out.print(ID);%>">
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
                        function asignvalues(){
                            document.getElementById('Estado').value = "<%out.print(Estado);%>";
                            document.getElementById('IdCuentaContable').value = <%out.print(IdCuentaContable);%>;
                            document.getElementById('IdTipoMoneda').value = <%out.print(IdTipoMoneda);%>;
                        }
                        getDateNow();
                        asignvalues();
                    </script>
<jsp:include page="../Layout/footer.jsp" />

