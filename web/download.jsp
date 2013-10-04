<%-- 
    Document   : statistics
    Created on : 22/04/2013, 20:07:31
    Author     : bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz|Droid+Sans' rel='stylesheet' type='text/css' />
        <link rel="stylesheet" type="text/css" media="all" href="style.css" />
        <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.nivo.slider.js"></script>
        <link rel="shortcut icon" href="images/icon.ico" >
        <title>Downloads</title>

        <style>
            div.img
            {
                margin:2px;
                border:1px solid #8cd48a;
                height:auto;
                width:auto;
                float:left;
                text-align:center;
            }
            div.img img
            {
                display:inline;
                margin:3px;
                border:1px solid #ffffff;
            }
            div.img a:hover img
            {
                border:1px solid #8cd48a;
            }
            div.desc
            {
                text-align:center;
                font-weight:normal;
                width:120px;
                margin:2px;
            }
        </style>
    </head>
    <body>
        <div id="wrapper960" class="clearfix">
            <div id="header" class="clearfix">

                <c:import url="cabecalho_cmenu.jsp"/>
            </div>
            <div id="content" class="clearfix shadow">
                                            <h3>Download</h3>
                                            <h4><i>Coffea arabica</i></h4>
                                            <a href="./web/dataset/CAcontigs.fasta" download="CAcontigs.fasta">Reads CA</a> <br/>
                                            <a href="./web/dataset/CAcontigs.fasta" download="CAcontigs.fasta">Contigs CA</a>
                                            <br/>
                                            <h4><i>Coffea canephora</i></h4>
                                            <a href="./web/dataset/CCreads.fasta" download="CCreads.fasta">Reads CC</a> <br/>
                                            <a href="./web/dataset/CCcontigs.fasta" download="CCcontigs.fasta">Contigs CC</a>
                                            <br/>

                                            <h4>Fruit by Week - VAI ALTERAR AQUI</h4>                                          
                                            <div class="img">
                                                <a target="_blank" href="./dataset/18weeks.fasta" download="18weeks.fasta">
                                                    <img src="images/coffea_18.jpg" alt="18 weeks coffea " width="110" height="90">
                                                </a>
                                                <div class="desc">18 Weeks</div>
                                            </div>
                                            <div class="img">
                                                <a target="_blank" href="./dataset/22weeks.fasta" download="22weeks.fasta">
                                                    <img src="images/coffea_22.jpg" alt="22 weeks coffea " width="110" height="90">
                                                </a>
                                                <div class="desc">22 Weeks</div>
                                            </div>
                                            <div class="img">
                                                <a target="_blank" href="./dataset/30weeks.fasta" download="30weeks.fasta">
                                                    <img src="images/coffea_30.jpg" alt="30 weeks coffea " width="110" height="90">
                                                </a>
                                                <div class="desc">30 Weeks</div>
                                            </div>
                                            <div class="img">
                                                <a target="_blank" href="./dataset/42weeks.fasta" download="42weeks.fasta">
                                                    <img src="images/coffea_42.jpg" alt="42 weeks coffea " width="110" height="90">
                                                </a>
                                                <div class="desc">42 Weeks</div>
                                            </div>
                                            <div class="img">
                                                <a target="_blank" href="./dataset/46weeks.fasta" download="46weeks.fasta">
                                                    <img src="images/coffea_46.jpg" alt="46 weeks coffea " width="110" height="90">
                                                </a>
                                                <div class="desc">46 Weeks</div>
                                            </div>
                                            
                                        </div>

                                        <div id="footer" class="shadow">
                                            <c:import url="rodape.jsp" />
                                        </div>
            </div>

        </body>
    </html>
