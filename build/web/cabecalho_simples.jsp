<%-- 
    Document   : menu
    Created on : 22/04/2013, 19:31:13
    Author     : bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/icon.ico" >
        <title>menu</title>
    </head>
    <body>

        <div id="wrapper">
            <div id="container">

                <!--start header -->
                <header id="header">
                    <div id="logo">
                        <a href="index.jsp"><img width="80%" src="images/logo.png" alt="" /></a>
                    </div>	
                    <div id="navigation">
                        <ul id="nav">
                            <li class="selected"><a href="index.jsp">Home</a></li>
                            <li><a>Search</a>
                                <ul>
                                    <li><a href="searchByGO.jsp">By GO</a></li>
                                    <li><a href="searchByGene.jsp">By Gene</a></li>
                                    <li><a href="searchByDataset.jsp">By Dataset</a></li>
                                </ul>
                            </li>
                            <li><a href="blast.jsp">BLAST</a></li>
                            <li><a href="download.jsp">Download</a>
                                <!--   <ul>    
                                       <li><a href="./dataset/CCcontigs.fasta" download="CCcontigs.fasta">Reads CA</a></li>
                                       <li><a href="./dataset/CAcontigs.fasta" download="CAcontigs.fasta">Contigs CA</a></li>                                
                                       <li><a href="./dataset/CCreads.fasta" download="CCreads.fasta">Reads CC</a></li>
                                       <li><a href="./dataset/CAcontigs.fasta" download="CAcontigs.fasta">Contigs CC</a></li>
                                   </ul> -->
                            </li>
                            <li><a href="statistics.jsp">Statistics</a></li>
                            <li><a href="team.jsp">Team</a></li>
                        </ul>
                    </div>
                </header>
                <!--end header -->
            </div>
            <!--container -->
        </div>
        <!--wrapper -->
    </body>
</html>
