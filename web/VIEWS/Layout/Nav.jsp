<%-- 
    Document   : Nav
    Created on : Jul 9, 2015, 9:46:56 AM
    Author     : Frankmer
--%>

<%

    if(session.getAttribute("usrcodI")==null){
        response.sendRedirect("../Login");
    }else{
        //sidfeNav responsive-nav
        int rol = (Integer) session.getAttribute("rol");
        if(rol == 1){
            out.print("<nav class=\"responsive-nav\">"
                    + "<ul>"
                    + " <a href=\"../EntradasContables/List.jsp\" class=\"link\"><li>Entradas Contables</li></a>"
                    + " <a href=\"../EntradasContables/consult.jsp\" class=\"link\"><li>Consultar Entradas</li></a>"
                    + " <a href=\"../CuentasContables/List.jsp\" class=\"link\"><li>Cuentas Contables</li></a>"
                    + " <a href=\"../Monedas/List.jsp\" class=\"link\"><li>Monedas</li></a>"
                    + " <a href=\"../PaseContable/\" class=\"link\"><li>Realizar pase contable</li></a>"
                    + " <a href=\"#\" class=\"link\"><li>Uruarios</li></a>"
                    + "</ul>"
                    + "</nav>");
        }else if(rol == 2){
            out.print("<nav class=\"responsive-nav\">"
                    + "<ul>"
                    + " <a href=\"../EntradasContables/List.jsp\" class=\"link\"><li>Entradas Contables</li></a>"
                    + " <a href=\"../EntradasContables/consult.jsp\" class=\"link\"><li>Consultar Entradas</li></a>"
                    + "</ul>"
                    + "</nav>");
        }else{
            out.print("<nav class=\"responsive-nav\">"
                    + "<ul>"
                    + " <a href=\"../EntradasContables/List.jsp\" class=\"link\"><li>Entradas Contables</li></a>"
                    + " <a href=\"../EntradasContables/consult.jsp\" class=\"link\"><li>Consultar Entradas</li></a>"
                    + "</ul>"
                    + "</nav>");
        }
    }
    
%>