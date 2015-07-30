<%-- 
    Document   : add
    Created on : Jul 9, 2015, 3:01:07 PM
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
<jsp:include page="../Layout/header.jsp" />
<jsp:include page="../Layout/Nav.jsp"/>
<section>
    <form action="../../RegistrarMonedas" method="post">
        <div class="responsive-form">
            <div class="title">
                Nombre:
            </div>
            <div class="input">
                <input type="text" name="Descripcion" placeholder="Euro, Peso, Do..." id="Descripcion" required>
            </div>
            <div class="title">
                Tasa:
            </div>
            <div class="input">
                <input type="text" name="Tasa" placeholder="0.00" id="Monto" required>
            </div>
            <div class="title">
                Estado:
            </div>
            <div class="input">
                <select name="Estado">
                    <option value="A">Activa</option>
                    <option value="I">Inactiva</option>
                </select>
            </div> 
            <div class="input">
                <input type="submit" value="Registrar" class="button b-green">
            </div>
        </div>
    </form>
</section>
<jsp:include page="../Layout/footer.jsp" />