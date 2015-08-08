<%-- 
    Document   : index
    Created on : Aug 5, 2015, 2:47:08 PM
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
    <form method="post" action="../../EjecutarPase">
        <div class="responsive-form">
            <div class="title">
                Fecha:
            </div>
            <div class="input">
                <input type="Date" placeholder="yyyy-MM-dd" name="fecha"/>
            </div>
            <div class="input">
                <input type="submit" value="Ejecutar" class="button"/>
            </div>
        </div>
    </form>
</section>
    
<jsp:include page="../Layout/footer.jsp" />
