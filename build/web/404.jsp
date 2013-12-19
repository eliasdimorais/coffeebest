<!DOCTYPE html>
<%-- 
    Document   : index
    Created on : 25/03/2013, 04:28:13
    Author     : bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz|Droid+Sans' rel='stylesheet' type='text/css' />
        <link rel="stylesheet" type="text/css" media="all" href="css/style.css" />
        <script type="text/javascript" src="/css/js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="/css/js/jquery.nivo.slider.js"></script>
        <link rel="shortcut icon" href="/images/icon.ico" >
        <title>Page Not Found</title>
    </head>

    <body>
        <div id="wrapper960" class="clearfix">

            <div id="header" class="clearfix">
                <c:import url="cabecalho_cmenu.jsp"/>
            </div>

            <div id="content" class="clearfix shadow">
                <center><h1>Page Not Found!</h1></center>
                <center><h3>Página não encontrada!</h3></center>

            </div>



            <div id="footer" class="shadow">
                <c:import url="rodape.jsp" />
            </div>
        </div>

        <script type="text/javascript">
            $(window).load(function() {
                $('#slider').nivoSlider();
            });
        </script>
    </body>
</html>
