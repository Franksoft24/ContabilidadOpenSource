<%-- 
    Document   : edit
    Created on : Jul 9, 2015, 2:21:10 PM
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
<%
    String Descripcion = null, PermiteTransacciones=null, Estado = null;
    int Nivel = 0, CuentaMayor = 0, ID =0, TipoCuenta_=0;
    double Balance = 0.00;
    try{
        int IdCuentaContable = Integer.parseInt(request.getParameter("ID"));
        List<CuentaContable> cuentasContables = CuentaContableDAO.SeleccionarCuenta(IdCuentaContable);
        for(CuentaContable cuentaContable:cuentasContables){
            Descripcion = cuentaContable.getDescripcion();
            TipoCuenta_ = cuentaContable.getTipoCuenta();
            PermiteTransacciones = cuentaContable.getPermiteTransacciones();
            Estado = cuentaContable.getEstado();
            Nivel = cuentaContable.getNivel();
            Balance = cuentaContable.getBalance();
            ID = cuentaContable.getIdCuentaContable();
            CuentaMayor = cuentaContable.getCuentaMayor();
            
        }
    }catch(Exception e){
        response.sendRedirect("List.jsp");
    }
%>
<jsp:include page="../Layout/header.jsp" />
<jsp:include page="../Layout/Nav.jsp"/>
<section>
    <form action="../../EditarCuentaC" method="post">
        <div class="responsive-form">
            <div class="title">
                Descripción:
            </div>
            <div class="input">
                <input type="text" name="Descripcion" placeholder="Banco Dominicano..." id="Descripcion" value="<% out.print(Descripcion); %>" required>
            </div>
            <div class="title">
                Tipo de Cuenta:
            </div>
            <div class="input">
                <select name="TipoCuenta" id="TipoCuenta">
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
                <select name="PermiteTransacciones" id="PermiteTransacciones">
                    <option value="SI">SI</option>
                    <option value="NO">NO</option>
                </select>
            </div>
            
            <div class="title">
                Nivel:
            </div>
            <div class="input">
                <select name="Nivel" id="Nivel">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                </select>
            </div>
            <div class="title">
                Cuenta Mayor:
            </div>
            <div class="input">
                <select name="CuentaMayor" id="CuentaMayor">
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
                <input type="text" name="Balance" placeholder="0.00" value="<% out.print(Balance); %>" readonly="true">
            </div>
            <!--div class="title">
                Estado:
            </div>
            <div class="input">
                <select name="N/A" id="Estado">
                    <option value="A">Activa</option>
                    <option value="I">Inactiva</option>
                </select>
            </div-->
            <div class="input">
                <input type="submit" value="Registrar" class="button">
                <input type="hidden" name="CuentaContableID" value="<%out.print(ID);%>">
            </div>
        </div>
    </form>
</section>
                    <script type="text/javascript">
                        function asignvalues(){
                            //document.getElementById('Estado').value = "<%out.print(Estado);%>";
                            document.getElementById('CuentaMayor').value = <%out.print(CuentaMayor);%>;
                            document.getElementById('TipoCuenta').value = <%out.print(TipoCuenta_);%>;
                            document.getElementById('PermiteTransacciones').value="<%out.print(PermiteTransacciones);%>";
                            document.getElementById('Nivel').value=<%out.print(Nivel);%>;
                        }
                        asignvalues();
                    </script>
<jsp:include page="../Layout/footer.jsp" />
