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
                    <h2 class="widget-title">Search by Gene Ontology</h2>
                    <div id="conteudo">
                        <form method="GET" action="controlador" target="frame">
                            <td style="width:50%"><h4><b>Find by GO</b></h4></td> <td></td>
                            <td style="text-align: right">Function: </td> <td><input type="text" name="termo" size="17" style="border: 2.5px solid #bababa;"  /></td>
                            <br/>
                            <td style="text-align: right">Ontology: </td> 
                            <td>
                                <select name="namespace" size="1" >
                                    <option value="all" selected="true">all</option>
                                    <option value="molecular function">molecular function</option>
                                    <option value="biological process">biological process</option>
                                    <option value="celullar component">celullar component</option>                                
                                </select>
                                <br/>
                            </td>
                            </tr>
                            <tr>
                                <td>Results per page: </td> 
                                <td>
                                    <select size="1" name="limitby">   
                                        <option value="10" >10</option>
                                        <option value="50">50</option>
                                        <option selected value="100">100</option>
                                        <option value="200">200</option>
                                        <option value="500">500</option>
                                        <option value="1000">1000</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td></td>   <td><input type="submit" value="Search Annotation" style="width: 100%" /></td>
                            </tr>
                            </table>
                            <input type="text" name="logica" value="ConsultaGo" style="display: none" />
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
