<%-- 
    Document   : index
    Created on : Jul 7, 2015, 12:04:06 AM
    Author     : Frankmer
--%>
<%
    if(session.getAttribute("usrcodI")==null){
        response.sendRedirect("../Login");
    } 
%>
<%@page import="Contabilidad.DAO.MonedaDAO" %>
<%@page import="Contabilidad.Model.TipoMoneda" %>
<%@page import="java.util.List" %>
<jsp:include page="../Layout/header.jsp" />
<!--jsp:include page="../Layout/gestorusr.jsp" /-->
<jsp:include page="../Layout/Nav.jsp"/>
<section>
    <div class="responsive-content flat-blue">
        <h3>${sessionScope.NNuser}</h3>
        <img alt="user-icon.png" src="../../resources/IMG/users-icon.png" height="200px" width="200px">
        <p>
            <a class="link" href="#">ver mi perfil >></a>
        </p>
    </div>
    
    <div class="responsive-content flat-green">
        <h3>Tasas de monedas:</h3>
        <p>
            <%
                List<TipoMoneda> tiposMonedas = MonedaDAO.SeleccionarMonedaActiva();
                for(TipoMoneda tipoMoneda:tiposMonedas){
                    out.print(tipoMoneda.getDescripcion()+": "+tipoMoneda.getUltimaTasa()+"<br />");
                }
            %>
            <a class="link" href="#">Calculadora de tasas >></a>
        </p>
    </div>
    <div class="responsive-content flat-orange">
        <h3>Un empleado motivado</h3>
        <img alt="user-icon.png" src="../../resources/IMG/content.jpg" height="200px" width="200px">
        <p>
            La motivación es la  clave para tener empleados<br> con sueños de superación, que busquen aprovechar<br> el tiempo y que alcancen con mayor facilidad los<br> objetivos de la empresa.
        </p>
    </div>
    <div class="responsive-content flat-orange">
        <h3>Lo que sea</h3>
        <img alt="user-icon.png" src="../../resources/IMG/content.jpg" height="200px" width="200px">
        <p>
            jksdbfj;sdbfjsdbjfnsdkl;nfd<br> isfnhkl;sdhfdjnfkl;sdnfl;nsdkl;f<br> jklsdfnlsdfkllsnfklsdnfkln<br> jksdfnklsdsdfklnsdklfn.
        </p>
    </div>
</section>
    
<jsp:include page="../Layout/footer.jsp" />
