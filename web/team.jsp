<%-- 
    Document   : team
    Created on : 22/04/2013, 19:39:58
    Author     : bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz|Droid+Sans' rel='stylesheet' type='text/css' />
        <link rel="stylesheet" type="text/css" media="all" href="style.css" />
        <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.nivo.slider.js"></script>
        <link rel="shortcut icon" href="images/icon.ico" >
        <title>Team</title>
    </head>

    <body>
        <div id="wrapper960" class="clearfix">
            <div id="header" class="clearfix">
                <c:import url="cabecalho_cmenu.jsp" />
            </div>


            <div id="content" class="clearfix shadow" style="height: auto">
                <h3><center>Team</center></h3>
                <br/>
                <p><b>Alexandre Rossi Paschoal</b> 
                    <a href="http://lattes.cnpq.br/5834088144837137">[Lattes]</a><br/>
                    Phd in Bioinformatics - Universidade de São Paulo <br/>
                    Assistant Professor - Universidade Tecnológica Federal do Paraná - Câmpus Cornélio Procópio<br>
                    Corresponding: <i>paschoal [at] utfpr [dot] edu [dot] br</i> 
                </p>
                <p><b>Bruno Hideki Arabori</b>
                    <a href="http://lattes.cnpq.br/5183030452171918">[Lattes]</a><br/> 
                    Graduation student - Universidade Tecnológica Federal do Paraná - Câmpus Cornélio Procópio </p>
                <p><b>Douglas Silva Domingues</b>
                    <a href="http://lattes.cnpq.br/7905667701769534">[Lattes]</a><br/>
                    PhD in Molecular Biology - Universidade de São Paulo, USP, Brasil. <br>
                    IAPAR<br/>
                </p>
                <p><b>Fabrício Martins Lopes</b>
                    <a href="http://lattes.cnpq.br/1660070580824436">[Lattes]</a><br/>
                    Phd in Bioinformatics - Universidade de São Paulo <br/>
                    Assistant Professor - Universidade Tecnológica Federal do Paraná - Câmpus Cornélio Procópio 
                </p>
                <p><b>Luiz Filipe Protasio Pereira</b>
                    <a href="http://lattes.cnpq.br/1177022282500069">[Lattes]</a><br/>
                    PhD in Plant Genetics – University of Guelph, Canadá <br/>
                    Embrapa Café <br/>
                </p>
                <p><b>Elias de Moraes Fernandes</b>   Front-End Developer
                    <a href="http://lattes.cnpq.br/0059611496365823">[Lattes]</a><br/>
                    Graduation student - Universidade Tecnológica Federal do Paraná - Câmpus Cornélio Procópio
                </p>
                </p>

            </div>

            <div id="footer" class="shadow">
                <c:import url="rodape.jsp" />
            </div>
        </div>


    </body>
</html>
