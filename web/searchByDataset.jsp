<%-- 
    Document   : search
    Created on : 23/10/2012, 19:27:56
    Author     : bruno
--%>
<%@page import="java.sql.ResultSet"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="s" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <link type="text/css" href="css/jquery.css" rel="stylesheet" />
        <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.10.2.custom.js"></script>
        <script>
            function verificaNumero(e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            }

            $(document).ready(function() {

                $("#findId").keypress(verificaNumero);
                $("#cb1").keypress(verificaNumero);
                $("#cb2").keypress(verificaNumero);
                $("#id1").keypress(verificaNumero);
                $("#id2").keypress(verificaNumero);
                $("#findId").keypress(verificaNumero);

            });
        </script>
        <link rel="shortcut icon" href="images/icon.ico" >

        <title>Search</title>

    </head>
    <body>
        <div id="wrapper960" class="clearfix">
            <div id="header" class="clearfix">
                <c:import url="cabecalho_cmenu.jsp"/>
            </div>
            <div id="content" class="clearfix shadow">  
                <div class="container940">
                    <h2 class="widget-title">Search by Dataset</h2>
                    <div id="conteudo">
                        <form action="controlador" method="GET" target="frame">
                            <ul style="list-style-type: none; list-style-position: outside">
                                <li>
                                    Dataset: 
                                    <select size="1" name="dataset">
                                        <option selected value="0">All datasets</option>
                                        <option value="1" >CC fruit 18 weeks</option>
                                        <option value="2">CC fruit 22 weeks</option>
                                        <option value="3">CC fruit 30 weeks</option>
                                        <option value="4">CC fruit 42 weeks</option>
                                        <option value="5">CC fruit 46 weeks</option>
                                        <option value="6">Coffea canephora</option>
                                        <option value="7">Coffea arabica</option>
                                    </select>
                                </li>
                                <li>
                                    Results per page: 
                                    <select size="1" name="limitby">   
                                        <option value="10" >10</option>
                                        <option value="50">50</option>
                                        <option selected value="100">100</option>
                                        <option value="200">200</option>
                                        <option value="500">500</option>
                                        <option value="1000">1000</option>

                                    </select>
                                </li>
                                <li>
                                    <input type="radio" name="filtro" value="0" checked> no filter
                                </li>
                                 <li>
                                    <input type="radio" name="filtro" value="2"> With Hit in CC Clusters
                                    <ul style="list-style-type: none; list-style-position: inside">
                                        <li style="padding-left: 20px">Coverage: <input type="text" id="cb2" name="cobertura_f2" maxlength="2"  size="2" value="85"  style="border: 2.5px solid #bababa;">% (>= 85)</li>
                                        <li style="padding-left: 20px">Identities: <input type="text" id="id2" name="identidade_f2" maxlength="2"  size="2" value="85"  style="border: 2.5px solid #bababa;">% (>= 85)</li>
                                    </ul>
                                </li>
                                
                                <li>
                                    <input type="radio" name="filtro" value="1">  Hits in CA Clusters that passed CC Clusters
                                    <ul style="list-style-type: none; list-style-position: inside">
                                        <li style="padding-left: 20px">Coverage </br>Cobertura: <input type="text" id="cb1" name="cobertura_f1"  maxlength="2" size="2" value="85"  style="border: 2.5px solid #bababa;" >% (>= 85)</li>
                                        <li style="padding-left: 20px">Identities: <input type="text" id="id1" name="identidade_f1" maxlength="2"  size="2" value="85"  style="border: 2.5px solid #bababa;" >% (>= 85)</li>
                                    </ul>
                                </li>
                               
                            </ul>
                            <input type="submit" value="Search by filters">
                            <br>
                            <br>
                            <input type="text" value="ConsultaSequencias" style="display: none" name="logica">
                        </form>
                    </div>
                    <div class="clear"></div><!-- clear float -->
                </div><!-- end container940 -->

            </div>

            <div id="footer" class="shadow">
                <c:import url="rodape.jsp" />
            </div>
        </div>


    </body>
</html>
