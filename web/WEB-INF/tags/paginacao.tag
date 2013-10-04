<%-- 
    Document   : paginacao
    Created on : 21/04/2013, 21:50:03
    Author     : bruno
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%-- any content can be specified here e.g.: --%>



<form action="controlador" method="POST">
    <c:set value="${request.paginacao}" var="paginacao" scope="page" />
    <% application.setAttribute("paginacao", request.getAttribute("paginacao"));%>
    <table style="font-size: medium">
        <tr>
            <td>[</td>  
            <!-- ----------------------------------------FIRST------------------------------------------- -->

            <c:choose>
                <c:when test="${paginacao.paginaAtual eq 1}">
                    <td><input type="submit" value="First" disabled="true" style="background: none"></td>  
                    </c:when>
                    <c:otherwise>
                    <td>
                        <form action="controlador" method="POST">
                            <input type="text" value="ConsultaSequenciasPagina" style="display: none" name="logica">
                            <input type="text" value="1" style="display: none" name="paraPagina">
                            <input type="submit" value="First" style="background: none">
                        </form>
                    </td>
                </c:otherwise>
            </c:choose> 

            <!-- ----------------------------------------/FIRST------------------------------------------- -->
            <td>|</td>          
            <!-- ----------------------------------------PREV------------------------------------------- -->
            <c:choose>
                <c:when test="${paginacao.paginaAtual eq 1}">
                    <td><input type="submit" value="Prev" disabled="true" style="background: none"></td>  
                    </c:when>
                    <c:otherwise>
                    <td>
                        <form action="controlador" method="POST">
                            <input type="text" value="ConsultaSequenciasPagina" style="display: none" name="logica">
                            <input type="text" value="${paginacao.paginaAtual-1}" style="display: none" name="paraPagina">
                            <input type="submit" value="Prev" style="background: none">
                        </form>
                    </td>
                </c:otherwise>
            </c:choose>

            <!-- ----------------------------------------/PREV------------------------------------------- -->
            <td>]</td>
            <!-- ----------------------------------------MEIO------------------------------------------- -->
            <c:forEach begin="${paginacao.inicio}" end="${paginacao.fim}" items="${paginacao.numerosPagina}" var="p">
                <c:choose>
                    <c:when test="${paginacao.paginaAtual eq p}">
                        <td style="padding-right: 10px"><b>${p}</b></td>  
                    </c:when>
                    <c:otherwise>
                        <td style="padding-right: 10px">
                            <form action="controlador" method="POST">
                                <c:set var="paginacaoo" value="${requestScope.paginacao}" scope="request" />                            
                                <input type="text" value="ConsultaSequenciasPagina" style="display: none" name="logica">
                                <input type="text" value="${p}" style="display: none" name="paraPagina">
                                <input type="submit" value="${p}" style="background: none">                               
                            </form>
                        </td>
                    </c:otherwise>
                </c:choose>
            </c:forEach> 
            <!-- ----------------------------------------/MEIO------------------------------------------- -->
            <td>[</td> 
            <!-- ----------------------------------------NEXT------------------------------------------- -->


            <c:choose>
                <c:when test="${paginacao.paginaAtual eq paginacao.numerosPagina.size()}">
                    <td><input type="submit" value="Next" disabled="true" style="background: none"></td>  
                    </c:when>
                    <c:otherwise>
                    <td>
                        <form action="controlador" method="POST">
                            <input type="text" value="ConsultaSequenciasPagina" style="display: none" name="logica">
                            <input type="text" value="${paginacao.paginaAtual+1}" style="display: none" name="paraPagina">
                            <input type="submit" value="Next" style="background: none">
                        </form>

                    </c:otherwise>
                </c:choose></td> 
            <!-- ----------------------------------------/NEXT------------------------------------------- -->
            <td>|</td> 
            <!-- ----------------------------------------LAST------------------------------------------- -->
            <td><c:choose>
                    <c:when test="${paginacao.paginaAtual eq paginacao.numerosPagina.size()}">
                    <td><input type="submit" value="Last" disabled="true" style="background: none"></td>  
                    </c:when>
                    <c:otherwise>
                    <td>
                        <form action="controlador" method="POST">
                            <input type="text" value="ConsultaSequenciasPagina" style="display: none" name="logica">
                            <input type="text" value="${paginacao.numerosPagina.size()}" style="display: none" name="paraPagina">
                            <input type="submit" value="Last" style="background: none">
                        </form>
                    </td>
                </c:otherwise>
            </c:choose></td> 
            <!-- ----------------------------------------/LAST------------------------------------------- -->
            <td>]</td>
        </tr>
    </table>
</form>