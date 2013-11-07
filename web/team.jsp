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

        <link rel="stylesheet" type="text/css" media="all" href="./css/style.css" />
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


            <div id="content" class="no-sidebar" style="height: auto">
                <h3><center>Team</center></h3>
                <br/>
                <ul class="gallery type-1">
                    <li data-id="aa">
                        <ul class="media">
                            <li><a ><img src="./images/paschoal.jpg" alt="" width="200" /></a></li>
                        </ul>
                        <div class="desc">
                            <p><b>  Alexandre Rossi Paschoal
                                    <a href="http://lattes.cnpq.br/5834088144837137">[Lattes]</a></b><br/>
                                Professor at the Federal University of Technology - Paraná - Brazil (UTFPR)
                                PhD in Bioinformatics - University of São Paulo (USP) [2012]
                            </p>
                            <ul>     <b> Research interests </b>
                                <li>Pattern Recognition and Machine Learning</li>
                                <li>Computational RNAs Biology (Noncoding RNAs)</li>
                                <li>Bioinformatics</li>
                                <li>Comparative Genomics</li>
                            </ul>
                            <br/>
                        </div>
                    </li> 
                    <br/>
                    <li data-id="aa">
                        <ul class="media">
                            <li><a ><img src="./images/elias.jpg" alt="" width="200" /></a></li>
                        </ul>
                        <div class="desc">
                            <p><b> Elias de Moraes Fernandes
                                    <a href="http://lattes.cnpq.br/0059611496365823">[Lattes]</a></b><br/>  
                                Undergraduation in Systems Analysis and Development
                                at the Federal University of Technology - Paraná - Brazil (UTFPR)
                                <br/> 
                            <ul> <b> Research interests </b>
                                <li> Non Coding small RNAs </li>
                                <li>  Mobile Games Development</li>
                                <li>  Web Design Development Systems and apps</li>
                            </ul>
                            </p>
                        </div>
                    </li>
                    <br/>
                    <li data-id="aa">
                        <ul class="media">
                            <li><a ><img src="./images/douglas_foto.jpeg" alt="" width="200" /></a></li>
                        </ul>
                        <div class="desc">
                            <p><b> Douglas Silva Domingues
                                    <a href="http://lattes.cnpq.br/7905667701769534">[Lattes]</a></b> </br> 
                                Researcher at the Instituto Agronômico do Paraná – Londrina – Brazil (IAPAR)</br> 
                                PhD in Biotechnology - Universidade de São Paulo (USP) [2009]
                                </br> 
                            </p>

                            <ul> <b> Research interests </b>
                                <li>Plant Molecular Biology</li>
                                <li>Biotechnology for Plant Breeding</li>
                                <li>Plant Comparative Genomics</li>
                            </ul>
                        </div>
                    </li> 
                    <br/>
                    <li data-id="aa">
                        <ul class="media">
                            <li><a ><img src="./images/luiz_felipe_1.jpg" alt="" width="200" /></a></li>
                        </ul>
                        <div class="desc">
                            <p><b> Luiz Filipe Protasio Pereira
                                    <a href="http://lattes.cnpq.br/1177022282500069">[Lattes]</a></b> <br/> 
                                Researcher at Embrapa Café<br/> 
                                PhD in Plant Genetics – University of Guelph, Canada [1998]
                                <br/> 
                            <ul> <b> Research interests </b>
                                <li>   Coffee Genomics</li>
                                <li>   Coffee Biotechnology</li>
                            </ul>
                            </p>
                        </div>
                    </li>
                    <br/>
                    <li data-id="aa">
                        <ul class="media">
                            <li><a ><img src="./images/bruno-arabori.jpg" alt="" width="200" /></a></li>
                        </ul>
                        <div class="desc">
                            <p>
                                <b>  Bruno Hideki Arabori 
                                    <a href="http://lattes.cnpq.br/5183030452171918">[Lattes]</a></b><br/> 
                                Undergraduation in Systems Analysis and Development [2012] 
                                at the Federal University of Technology - Paraná - Brazil (UTFPR)

                            </p>
                        </div>
                    </li>
                    <br/>
                    <li data-id="aa">
                        <ul class="media">
                            <li><a ><img src="./images/fabricio.jpeg" alt="" width="200" /></a></li>
                        </ul>
                        <div class="desc">
                            <p><b>  Fabrício Martins Lopes
                                    <a href="http://lattes.cnpq.br/1660070580824436">[Lattes]</a></b> <br/> 
                                Professor at the Federal University of Technology - Paraná - Brazil (UTFPR)<br/> 
                                PhD in Bioinformatics - Universidade de São Paulo [2011]
                                <br/> 
                            <ul> <b> Research interests </b>
                                <li>  Pattern Recognition and Machine Learning</li>
                                <li>   Bioinformatics</li>
                                <li>    Image Processing</li>
                                <li>   Computer Vision </li>
                            </ul> 
                            </p>
                        </div>
                    </li>
                    <br/>
                    
                </ul>
            </div>

            <div id="footer" class="shadow">
                <c:import url="rodape.jsp" />
            </div>
        </div>


    </body>
</html>
