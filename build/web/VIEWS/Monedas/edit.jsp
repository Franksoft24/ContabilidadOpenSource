<%-- 
    Document   : edit
    Created on : Jul 9, 2015, 3:01:14 PM
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
<%@page import="java.util.List" %>
<%
    String Descripcion = null, Estado = null;
    Double Tasa=0.00;
    int ID = 0; 
    try{
        int IdMoneda = Integer.parseInt(request.getParameter("ID"));
        List<TipoMoneda> Monedas = MonedaDAO.SeleccionarMoneda(IdMoneda);
        for (TipoMoneda Moneda:Monedas){
            Descripcion = Moneda.getDescripcion();
            Estado = Moneda.getEstado();
            Tasa = Moneda.getUltimaTasa();
            ID = Moneda.getIdTipoMoneda();
        }
        
    }catch(Exception e){
        response.sendRedirect("List.jsp");
    }
%>
<jsp:include page="../Layout/header.jsp" />
<jsp:include page="../Layout/Nav.jsp"/>
<section>
    <form action="../../EditarMonedas" method="post">
        <div class="responsive-form">
            <div class="title">
                Nombre:
            </div>
            <div class="input">
                <input type="text" name="Descripcion" placeholder="Euro, Peso, Do..." id="Descripcion" value="<% out.print(Descripcion); %>" required>
            </div>
            <div class="title">
                Tasa:
            </div>
            <div class="input">
                <input type="text" name="Tasa" placeholder="0.00" id="Monto" value="<% out.print(Tasa); %>" required>
            </div>
            <div class="title">
                Estado:
            </div>
            <div class="input">
                <select name="Estado" id="Estado">
                    <option value="A">Activa</option>
                    <option value="I">Inactiva</option>
                </select>
            </div> 
            <div class="input">
                <input type="submit" value="Registrar" class="button b-green">
                <input type="hidden" value="<% out.print(ID); %>" name="MonedaID">
            </div>
        </div>
    </form>
</section>
                <script type="text/javascript">
                        
                        function asignvalues(){
                            document.getElementById('Estado').value = "<%out.print(Estado);%>";
                        }
                        asignvalues();
                    </script>
<jsp:include page="../Layout/footer.jsp" />
