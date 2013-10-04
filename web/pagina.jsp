<%-- 
    Document   : pagina
    Created on : 30/03/2012, 08:54:41
    Author     : bruno_arabori
--%>

<%@page import="modelo.MPagina"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="com.sun.xml.internal.ws.util.StringUtils"%>
<%@page import="java.sql.ResultSet"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="p" %>
<%@taglib prefix="display" uri="http://displaytag.sf.net" %>
<jsp:useBean id="pa" scope="page" class="modelo.MPagina" />


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz|Droid+Sans' rel='stylesheet' type='text/css' />
        <link rel="stylesheet" type="text/css" href="style.css" />
        <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.nivo.slider.js"></script>
        <link rel="shortcut icon" href="images/icon.ico" >
        <title>List</title>


    </head>
    <body class="clearfix shadow">
        <c:set scope="page" value="${param.paginacao}" var="paginacao" />

        <c:choose>
            <c:when test="${not empty paginacao}">                
                <c:out value="${paginacao.todo.size()}" /> results Found
                <br/>
                <div style="width: 100%; alignment-baseline: central">                                        
                    <p:paginacao />
                </div>

                <br/>
                <table class="sequencia">
                    <thead>
                        <tr>
                            <th><b>ID</b></th>
                            <th><b>header</b></th>
                            <th><b>dataset</b></th>
                            <th><b>length</b></th>
                            <th><b>details</b></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${paginacao.getPagina()}" var="seq">
                            <tr>
                                <td><c:out value="${seq.pk_sequencia}" /></td>
                                <td><c:out value="${seq.header}" /></td>
                                <td><c:out value="${seq.dataset}" /></td>
                                <td><c:out value="${seq.length}" /></td>
                                <td><a href="./details.jsp?pk_sequencia=${seq.pk_sequencia}" target="_blank">see details</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <p:download />
            </c:when>
            <c:otherwise>
                <c:out value="No sequence found" />
            </c:otherwise>
        </c:choose>



    </body>
    <!--
    -->
</html>

