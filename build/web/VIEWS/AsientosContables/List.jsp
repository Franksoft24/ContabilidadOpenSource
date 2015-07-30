<%-- 
    Document   : List
    Created on : Jul 9, 2015, 2:20:55 PM
    Author     : Frankmer
--%>
<%
    int rol = (Integer) session.getAttribute("rol");
    if(session.getAttribute("usrcodI")==null||rol>1){
        response.sendRedirect("../Login");
    } 
%>
<jsp:include page="../Layout/header.jsp" />
<jsp:include page="../Layout/gestorusr.jsp" />
<jsp:include page="../Layout/Nav.jsp"/>
<section>
    <table>
        <tr>
            <th>Descripcion:</th>
            <th>Permite Transacciones:</th>
            <th>Balance:</th>
            <th><a href="#" class="link">Agregar nueva cuenta</a></th>
        </tr>
        <%
            
        %>
    </table>
</section>
    
<jsp:include page="../Layout/footer.jsp" />