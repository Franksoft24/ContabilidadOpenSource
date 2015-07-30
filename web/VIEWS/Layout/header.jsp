<%-- 
    Document   : header
    Created on : Jul 7, 2015, 12:25:55 AM
    Author     : Frankmer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no">
	<meta name="viewport" content="width=320, initial-scale=1">
	<meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <link rel="icon" type="image/png" href="../../resources/IMG/fav-icon.png">
        <title>Contabilidad</title>
        <link rel="stylesheet" href="../../resources/CSS/site.css"/>
        <link href='http://fonts.googleapis.com/css?family=PT+Serif' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Slab' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="../../resources/JS/script.js"></script> 
    </head>
    <body>
        <nav class="usr_nav">
            <ul>
                <li><a href="../../LogOut" class="link">Cerrar sesión</a></li>
                <li>Bienvenido: <a href="../perfil/?Id=${sessionScope.usrcodI}" class="link">${sessionScope.NNuser}</a></li>
            </ul>
        </nav>
        <header>
            <a class="link" href="../MAIN">
                <img alt="calculadora.png" src="../../resources/IMG/header-icon.png" width="100%">
                <h1>Contabilidad</h1>
            </a>
        </header>