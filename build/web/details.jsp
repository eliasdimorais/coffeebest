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
            <jsp:useBean id="detalhes" class="dao.CDetalhes" scope="page" /> 
            <c:set value="${detalhes.consultaSequencias(param.pk_sequencia)}" var="query" scope="request" />
            <c:set value="${detalhes.consultaGo((param.pk_sequencia))}" var="listaGo" scope="request" />
            <c:set value="${detalhes.consultaReads((param.pk_sequencia))}" var="listaReads" scope="request" />
            <c:set value="${detalhes.consultaBlast_n((param.pk_sequencia))}" var="listBlastn" scope="request" />
            <c:set value="${detalhes.consultaBlast_x((param.pk_sequencia))}" var="listaBlastx" scope="request"  />



            <!-- -------------------------------- Detalhes Gerais ----------------------------------------- -->
            <div id="sidebar" class="left">
                <div class="inner" style="width: 400px">
                    <table>
                        <tr>
                            <td style="padding-right: 10px"><b>Sequence Name: </b></td>
                            <td> <c:choose>
                                    <c:when test="${not empty query.pk_sequencia}" >
                                        <c:out value="${query.header}" />
                                    </c:when>
                                    <c:otherwise>
                                        Not sequence to display
                                    </c:otherwise>
                                </c:choose>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 10px"><b>Sequence Length: </b></td>
                            <td><c:out value="${query.length}" /></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 10px"><b>Dataset: </b></td>
                            <td><c:out value="${query.dataset}" /></td>
                        </tr>
                    </table>
                    <!-- ---------- Sequences and NCBI search --------------- -->
                    <tr>
                        <td>
                            <h3>Sequence<hr class="divisao" /></h3>
                            <form id="form1" name="form1" target="_blank" action="http://blast.ncbi.nlm.nih.gov/Blast.cgi?PROGRAM=blastx&BLAST_PROGRAMS=blastx&PAGE_TYPE=BlastSearch&SHOW_DEFAULTS=on&LINK_LOC=blasthome" method="post">
                                <textarea name="QUERY" rows="5" cols="180" style="max-width: 900px "><%
                                    %>>ID: ${query.pk_sequencia} | NAME: ${query.header}<%out.println();
                                    %>${query.sequencia}
                       
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
                    <c:when test="${not empty listBlastn}">
                        <c:catch var="error">
                            <table class="sequencia blasts">
                                <thead>
                                    <tr>
                                        <th><b>Subject name</b></th>
                                        <th><b>Subject dataset</b></th>
                                        <th><b>Subject<br/>length</b></th>
                                        <th><b>Subject<br/>Coverage</b></th>
                                        <th><b>Query<br/>Coverage</b></th>
                                        <th><b>Identities</b></th>
                                        <th><b>Score</b></th>
                                        <th><b>Strand</b></th>                                        
                                    </tr>
                                </thead>
                                <tbody>                                         
                                    <c:forEach var="b" items="${listBlastn}">
                                        <tr>
                                            <td>
                                                <a href="./details.jsp?pk_sequencia=${b.subject.pk_sequencia}">${b.subject.header}</a>
                                            </td>
                                            <td><c:out value="${b.subject.dataset}" /></td>
                                            <td style="text-align: center"><c:out value="${b.subject.length}" /></td>
                                            <td style="text-align: center"><c:out value="${b.s_cobertura} %" /></td>
                                            <td style="text-align: center"><c:out value="${b.q_cobertura} %" /></td>
                                            <td style="text-align: center"><c:out value="${b.alignmentLength} / ${b.identities} (${b.identities_pctm} %)" /></td>
                                            <td style="text-align: center"><c:out value="${b.score}" /></td>
                                            <td style="text-align: center"><c:out value="${b.q_strand} / ${b.s_strand}" /></td>
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
                <td style="width: 100%"><h3>Reads</h3></td>    
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

                <br/>
                <br/>
                <!-- -------------------------------- Segundo resultado blast ----------------------------------------- -->
                <h3>Plantcyc annotation</h3>
                <br/>
                <c:choose>
                    <c:when test="${not empty listaBlastx}">
                        <c:catch var="error">
                            <table class="sequencia blasts">
                                <thead>
                                    <tr>
                                        <th><b>Subject<br/>Acession</b></th>
                                        <th><b>Acession<br/>Length</b></th>
                                        <th><b>Plantcy<br/>Enzyme</b></th>
                                        <th><b>Function</b></th>
                                        <th><b>First Hit<br/>Specie</b></th>                                        
                                        <th><b>Gene</b></th>
                                        <th><b>Subject<br/>Coverage</b></th>
                                        <th><b>Query<br/>Coverage</b></th>
                                        <th><b>Identities</b></th>
                                        <th><b>Score</b></th>
                                        <th><b>Frame</b></th>
                                        <th><b>Positives</b></th> 
                                    </tr>
                                </thead>
                                <tbody>                                         
                                    <c:forEach var="b" items="${listaBlastx}">
                                        <tr>
                                            <td><c:out value="${b.subject.header}" /></td>
                                            <td style="text-align: center"><c:out value="${b.subject.length}" /></td>
                                            <td><c:out value="${b.subject.plantcyc}" /></td>
                                            <td><c:out value="${b.subject.funcao}" /></td>
                                            <td><c:out value="${b.subject.plantcyc_dataset}" /></td>
                                            <td><c:out value="${b.subject.gene}" /></td>
                                            <td style="text-align: center"><c:out value="${b.s_cobertura} %" /></td>
                                            <td style="text-align: center"><c:out value="${b.q_cobertura} %" /></td>
                                            <td style="text-align: center"><c:out value="${b.alignmentLength} / ${b.identities} (${b.identities_pctm} %)" /></td>
                                            <td style="text-align: center"><c:out value="${b.score}" /></td>
                                            <td style="text-align: center"><c:out value="${b.frames}" /></td>
                                            <td style="text-align: center"><c:out value="${b.positives}" /></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:catch>
                        <c:if test="${not empty error}">
                            <c:out value="${error}" />
                            <br/>
                            <h3>An error has occurred while accessing the database. See if the link is valid sequence informed.</h3>
                            <h4>Ocorreu algum erro ao acessar o banco de dados. Veja se o link da sequencia informada é valido.</h4>
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
