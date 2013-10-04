<%-- 
    Document   : blast_result
    Created on : 25/04/2013, 11:21:44
    Author     : bruno
--%>

<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

            <div id="content" class="clearfix shadow" style="height: auto"> 
                <form action="controlador" target="_blank" method="GET">
                <%
                    String comando = (String) request.getServletContext().getAttribute("comando");
                    String diretorio = (String) request.getServletContext().getAttribute("saida");

                   
                    Runtime r = Runtime.getRuntime();
                    Process p;
                    File download = null;
                    try {
                        p = r.exec(comando);
                        String s;
                        BufferedReader stdInput = new BufferedReader(new InputStreamReader(p.getInputStream()));
                        download = new File(diretorio);
                        FileOutputStream fos = new FileOutputStream(download);
                        while ((s = stdInput.readLine()) != null) {
                            fos.write(s.getBytes());
                            fos.write("\n".getBytes());
                            out.println(s);
                            out.print("<br/>");
                        }


                    } catch (Exception e) {
                        out.println("error");
                    }
                    request.getServletContext().setAttribute("arquivo", download);

                %>
                <br/>
                
                  
                        <input type="text" value="DownloadBlast" style="display: none" name="logica">
                    <input type="submit" value="Download Result" > 
                    
                </form>
                
            </div>



            <div id="footer" class="shadow">
                <c:import url="rodape.jsp" />
            </div>
        </div>
