<%-- 
    Document   : index
    Created on : Jul 9, 2015, 1:29:56 AM
    Author     : Frankmer
--%>
<%
    //String IdUsuario = (String) session.getAttribute("usrcodI");
    if(session.getAttribute("usrcodI") != null){
        response.sendRedirect("../MAIN");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log-in</title>
        <link rel="stylesheet" href="../../resources/CSS/loginstyle.css"/>
        <script type="text/javascript" src="../../resources/JS/script.js"></script>
    </head>
    <body>
        <section>
            <div class="content flat-green">
                <h3>Acceso</h3>
                <form action="../../login" method="post">
                    <div>
                        <div class="title">
                            <spam class="hidden">Usuario:</spam>
                        </div>
                        <div class="input">
                            <input type="text" name="NickName" placeholder="Ususario:" id="usuario" onkeyup="inputTitle('Usuario:',0,'usuario')" required>
                        </div>
                        <div class="title">
                            <spam class="hidden">Contraseña:</spam>
                        </div>
                        <div class="input">
                            <input type="password" name="pass" placeholder="Contraseña" id="password" onkeyup="inputTitle('Contraseña:',1,'password')" required>
                        </div>
                        <div class="input">
                            <input type="submit" value="Acceder" class="button">
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </body>
</html>
