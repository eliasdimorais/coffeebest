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
        <link rel="stylesheet" type="text/css" media="all" href="style.css" />
        <script type="text/javascript" src="css/js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="css/js/jquery.nivo.slider.js"></script>
          <link rel="shortcut icon" href="images/icon.ico" >
        <title>Home - CoffeebEST</title>
    </head>

    <body>
        <div id="wrapper960" class="clearfix">

            <div id="header" class="clearfix">
                <c:import url="cabecalho_cmenu.jsp"/>
            </div>

            <div class="slider-wrapper">
                <div id="slider" class="nivoSlider">
                    <img src="images/slider1_coffea.jpg" alt="" />
                    <img src="images/slider2_coffea.jpg" alt="" />
                    <img src="images/slider3_coffea.jpg" alt="" />
                    <img src="images/iapar_utfpr-cp.jpg" alt="" />   
                </div>
            </div>

            <div id="content" class="clearfix shadow">
                <h2><center>CoffeebEST: EST analysis system in coffee   </center></h2>

            </div>

            <div id="extended a" class="clearfix shadow">
                <div id="trio1">
                    <div class="inner" >
                        <p>The CoffeebEST (Coffee bean EST database) is an integrated resource of EST sequencing and annotation data from two <i>Coffea</i> species: 
                            <i>C. arabica</i> and <i>C. canephora</i>. In addition to EST data, CoffeebEST provides an catalog of functionally annotated transcripts, based on Gene Onthology and PlantCyc database. 
                            The CoffeebEST is a collaboration between the Plant Biotechnology Laboratory at the Instituto Agronômico do Paraná, Londrina, Brazil and the Bioinformatics and Pattern Recognition Group, at Federal University of Technology - Paraná, Cornélio Procópio, Brazil.</p> 
                    </div>
                </div>
                <div id="extended" class="clearfix shadow">
                    <div id="footer">
                        <div class="inner2 shadow">
                            <h3><center></center></h3>
                            <p>
                                <a href='http://www.utfpr.edu.br/cornelioprocopio'><img src="images/utfpr.jpg" alt="" /></a>&nbsp;&nbsp;&nbsp;&nbsp;

                                <a href='http://www.iapar.br/'><img src="images/iapar.png" alt="" /></a>
                                <a href='http://www.sapc.embrapa.br/'><img src="images/logo_embrapa_cafe.gif" alt="" /></a></p>
                        </div>
                    </div>
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
