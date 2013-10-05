<%-- 
    Document   : about-us
    Created on : 22/04/2013, 20:04:15
    Author     : bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz|Droid+Sans' rel='stylesheet' type='text/css' />
        <link rel="stylesheet" type="text/css" media="all" href="style.css" />
        <script type="text/javascript" src="css/js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="css/js/jquery.nivo.slider.js"></script>
          <link rel="shortcut icon" href="images/icon.ico" >
        <title>about-us</title>
    </head>

    <body>
        <div id="wrapper960" class="clearfix">
            <div id="header" class="clearfix">
                <c:import url="cabecalho_cmenu.jsp" />
            </div>

            <div class="slider-wrapper">
                <div id="slider" class="nivoSlider">
                    <img src="images/slider0.jpg" alt="" />
                    <img src="images/iapar_utfpr.png" alt="" />
                    <img src="images/slider2_coffea.jpg" alt=""/>
                    <img src="images/slider3_coffea.jpg" alt="" />
                    <img src="images/slider4_coffea.jpg" alt="" /> 
                </div>
            </div>

            <div id="content" class="clearfix shadow">

                <div id="main2" class="center">
                    <h2>SAEST-Coffea</h2>
                    <p align="justify" style="alignment-adjust: middle">
                        O cafeeiro dispõe de uma larga base de dados de transcriptoma, cujo uso já trouxe alguns resultados promissores na 
                        caracterização de genes de interesse biotecnológico. Porém o potencial da análise a que esses dados submetidos ainda
                        >é incipiente. Em particular, para pesquisas moleculares ao longo do desenvolvimento de frutos e folhas, pouco foi 
                        explorado com direcionamento para aplicações biotecnológicas. O uso da bioinformática via o desenvolvimento de programas
                        e bancos de dados pode ajudar nesta tarefa, não só de análise dos dados disponíveis, mas também na geração de novos 
                        conhecimentos. A implementação de uma ferramenta pode inclusive, servir de base para a organização e comparação de 
                        dados em outras culturas que já dispõem de informações de seqüenciamento de DNA, como citros e cana-de-açúcar, e 
                        garantir a liderança brasileira em programas de melhoramento destas culturas. O presente projeto apresenta o resultado
                        do desenvolvimento de um sistema de bioinformática tomando como ponto de partida os dados de ESTs em Coffea arabica e 
                        Coffea canephora disponíveis em bancos de dados públicos e, principalmente, de Mondego et al. (2011). Nosso papel foi 
                        explorar esta análise de transcriptoma, tendo como foco os estágios de desenvolvimento de frutos em Coffea canephora. 
                        Com base nesses dados, implementamos scripts em linguagem Java e banco de dados postgreSQL, que possibilitem o uso do 
                        algoritmo BLAST para avaliação de genes em larga escala e realizem a filtragem destes dados, restando-se assim apenas 
                        sequências de interesse com expressão em uma determinada condição, que servirão de base para a identificação de genes 
                        com interesse biotecnológico. Como produto final foi desenvolvido um sistema web que possibilita que o usuário consultar 
                        toda essa análise feita e também alinhar suas sequências de interesse contra os dados de sequências de Coffea canephora, 
                        dados específicos de seus frutos (em cinco estágios de desenvolvimento 18, 22, 30, 42 e 46 semanas) e sequências de 
                        Coffea arabica. O sistema ainda permite aplicação de diversos filtros  para diferentes análises de intersse do usuário e 
                        também download dos dados consultados.
                        <br><br>
                        Last update: 31/10/2012
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