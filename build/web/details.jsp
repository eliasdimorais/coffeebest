<%-- 
    Document   : details
    Created on : 15/04/2013, 20:07:56
    Author     : bruno
--%>
<%@page import="modelo.MSequencias"%>
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
        <title>details</title>
    </head>

    <body>
        <div id="wrapper960" class="clearfix">
            <div id="header" class="clearfix">    
                <c:import url="cabecalho_simples.jsp"/>
            </div>                    
            <!--<jsp:useBean id="detalhes" class="dao.CDetalhes" scope="page" /> -->
            <c:set value="${detalhes.consultaSequenciasId((param.id))}" var="query" scope="request" />
            <c:set value="${detalhes.consultaGo((param.id))}" var="listaGo" scope="request" />
            <%--<c:set value="${detalhes.consultaReads((param.id))}" var="listaReads" scope="request" />--%>
            <c:set value="${detalhes.consultaBlastN((param.id))}" var="listBlastN" scope="request" />
            <c:set value="${detalhes.consultaBlastX((param.id))}" var="listBlastX" scope="request" />


            <!-- -------------------------------- Detalhes Gerais ----------------------------------------- -->
            <div id="sidebar" class="left">
                <div class="inner" style="width: 400px">
                    <table>
                        <tr>
                            <td style="padding-right: 10px"><b>Sequence Name: </b></td>
                            <td> <c:choose>
                                    <c:when test="${not empty query.id}" >
                                        <c:out value="${query.query}" />
                                    </c:when>
                                    <c:otherwise>
                                        Not sequence to display
                                    </c:otherwise>
                                </c:choose>

                            </td>
                        </tr>
                        <%--<tr>
                            <td style="padding-right: 10px"><b>Sequence Length: </b></td>
                            <td><c:out value="${query.length}" /></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 10px"><b>Dataset: </b></td>
                            <td><c:out value="${query.dataset}" /></td>
                        </tr>--%>
                    </table>
                    <!-- ---------- Sequences and NCBI search --------------- -->
                    <tr>
                        <td>
                            <h3>Sequence<hr class="divisao" /></h3>
                            <form id="form1" name="form1" target="_blank" action="http://blast.ncbi.nlm.nih.gov/Blast.cgi?PROGRAM=blastx&BLAST_PROGRAMS=blastx&PAGE_TYPE=BlastSearch&SHOW_DEFAULTS=on&LINK_LOC=blasthome" method="post">
                                <textarea name="QUERY" rows="5" cols="180" style="max-width: 900px "><%
                                    %>>ID: ${query.id} | NAME: ${query.query}<%out.println();
                                    %>${query.sequences}
                       
                                </textarea>
                                <br>
                                <input type="submit" value="Submit NCBI">

                            </form>
                        </td>
                    <br>

                    </tr>
                </div>
            </div>
            <!-- -------------------------------- FIM Detalhes Gerais ----------------------------------------- -->

            <!-- -------------------------------- Primeiro resultado blast ----------------------------------------- -->
            <div id="content" class="clearfix shadow" style="height: auto">       
                <h3>Comparative analysis result</h3>
                <br>                
                <c:choose>
                    <c:when test="${not empty listBlastN}">
                        <c:catch var="error">
                            <table class="sequencia blasts">
                                <thead>
                                    <tr>
                                        <th><b>Subject Name</b></th>
                                        <th><b>Dataset</b></th>
                                        <th><b>Subject<br/>Length</b></th>
                                        <th><b>Identity</b></th>
                                        <th><b>Score</b></th>
                                        <th><b>Strand<br/>Query</b></th>
                                        <th><b>Strand<br/>Subject</b></th>
                                    </tr>
                                </thead>
                                <tbody>                                         
                                    <c:forEach var="b" items="${listBlastN}">
                                        <tr>
                                            <td>
                                                <a href="./details.jsp?id=${b.seq}">${b.sbj_name}</a>
                                            </td>
                                            <td style="text-align: center"><c:out value="${b.sbj_dataset}" /></td>
                                            <td style="text-align: center"><c:out value="${b.sbj_length}" /></td>
                                            <td style="text-align: center"><c:out value="${b.identity}" /></td>
                                            <td style="text-align: center"><c:out value="${b.score}" /></td>
                                            <td style="text-align: center"><c:out value="${b.strand_qry}" /></td>
                                            <td style="text-align: center"><c:out value="${b.strand_sbj}" /></td>
                                        
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:catch>
                        <c:if test="${not empty error}">
                            <c:out value="${error}" />
                            <br/>
                            Ocorreu algum erro ao acessar o banco de dados. Veja se o link da sequencia informada é valido
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        Not found hits 
                    </c:otherwise>
                </c:choose>
                <!-- -------------------------------- FIM Primeiro resultado blast ----------------------------------------- -->
                <%--<td style="width: 100%"><h3>Reads</h3></td>    
                <tr>
                    <td>
                        <!-- --------- READS ----------------- -->
                        <c:choose>
                            <c:when test="${not empty listaReads}">
                                <c:catch var="error">
                                    <table class="sequencia blasts">
                                        <thead>
                                            <tr>
                                                <th><b>Name</b></th>
                                                <th><b>Source</b></th>   
                                                <th><b>Source</b></th>                                         
                                            </tr>
                                        </thead>
                                        <tbody>                                         
                                            <c:forEach var="r" items="${listaReads}">
                                                <tr>
                                                    <td><c:out value="${r.identificacao}" /></td>
                                                    <td><c:out value="${r.dataset_nome}" /></td>
                                                    <td><c:out value="${r.dataset_identificacao}" /></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:catch>
                                <c:if test="${not empty error}">
                                    <c:out value="${error}" />
                                    <br/>
                                    <h3>An error has occurred while accessing the database. See if the link is valid sequence informed.</h3>
                                    <h5>Ocorreu algum erro ao acessar o banco de dados. Veja se o link da sequencia informada é valido.</h5>
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                Not found hits 
                            </c:otherwise>
                        </c:choose> 
                        <!-- --------- FIM READS ----------------- -->
                    </td>
                --%>
                <br/>
                <br/>
                <!-- -------------------------------- Segundo resultado blast ----------------------------------------- -->
                <div id="content1" class="clearfix shadow" style="height: auto">       
                <h3>Plantcyc annotation</h3>
                <br>                
                <c:choose>
                    <c:when test="${not empty listBlastX}">
                        <c:catch var="error">
                            <table class="sequencia blasts">
                                <thead>
                                    <tr>
                                        <th><b>Subject Name</b></th>
                                        <th><b>Dataset</b></th>
                                        <th><b>Subject<br/>Length</b></th>
                                        <th><b>Identity</b></th>
                                        <th><b>Score</b></th>
                                        <th><b>Strand<br/>Query</b></th>
                                        <th><b>Strand<br/>Subject</b></th>
                                    </tr>
                                </thead>
                                <tbody>                                         
                                    <c:forEach var="b" items="${listBlastX}">
                                        <tr>
                                            <td>
                                                <a href="./details.jsp?id=${b.seq}">${b.sbj_name}</a>
                                            </td>
                                            <td style="text-align: center"><c:out value="${b.sbj_dataset}" /></td>
                                            <td style="text-align: center"><c:out value="${b.sbj_length}" /></td>
                                            <td style="text-align: center"><c:out value="${b.identity}" /></td>
                                            <td style="text-align: center"><c:out value="${b.score}" /></td>
                                            <td style="text-align: center"><c:out value="${b.strand_qry}" /></td>
                                            <td style="text-align: center"><c:out value="${b.strand_sbj}" /></td>
                                        
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:catch>
                        <c:if test="${not empty error}">
                            <c:out value="${error}" />
                            <br/>
                            Ocorreu algum erro ao acessar o banco de dados. Veja se o link da sequencia informada é valido
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        Not found hits 
                    </c:otherwise>
                </c:choose>
                <!-- -------------------------------- FIM Segundo resultado blast ----------------------------------------- -->
                <br/>
                <br/>
                <!-- --------- GO ----------------- -->
                <td style="width: 100%"><h3>Gene Ontology</h3></td>
                <td>
                    <c:choose>
                        <c:when test="${not empty listaGo}">
                            <c:catch var="error">
                                <table class="sequencia blasts">
                                    <thead>
                                        <tr>
                                            <th><b>Function</b></th>
                                            <th><b>Ontology</b></th>                                                                                
                                        </tr>
                                    </thead>
                                    <tbody>                                         
                                        <c:forEach var="go" items="${listaGo}">
                                            <tr>
                                                <td><c:out value="${go.name}" /></td>
                                                <td><c:out value="${go.namespace}" /></td>                                            
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:catch>
                            <c:if test="${not empty error}">
                                <c:out value="${error}" />
                                <br/>
                                Ocorreu algum erro ao acessar o banco de dados. Veja se o link da sequencia informada é valido
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            Not found hits 
                        </c:otherwise>
                    </c:choose>  
                    <!-- --------- FIM GO ----------------- -->
                </td>
                </tr>
                <!-- --------- FIM READS ----------------- -->
                <!-- -------------------------------- FIM GO e READS ----------------------------------------- -->
                <br/>
                <br/>

            </div>


            <div id="footer" class="shadow">
                <c:import url="rodape.jsp" />
            </div>
        </div>


    </body>
</html>
