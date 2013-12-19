<%-- 
    Document   : cabecalho
    Created on : 25/03/2013, 07:22:57
    Author     : bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="keywords" content="utfpr, iapar, biology, bioinformática, bioinformatics, est, transcriptome, coffea" />
        <meta name="author of layout" content="Elias de Moraes Fernandes" />
        <meta name="authoring system" content="Bruno Hideki Arabori" />

        <link rel="stylesheet" type="text/css" media="all" href="style.css" />
        <script type="text/javascript" src="css/js/supersubs.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function() {
                //Menu
                jQuery("ul.sf-menu").supersubs({
                    minWidth: 12, // requires em unit.
                    maxWidth: 27, // requires em unit.
                    extraWidth: 3	// extra width can ensure lines don't sometimes turn over due to slight browser differences in how they round-off values
                            // due to slight rounding differences and font-family 
                }).superfish();  // call supersubs first, then superfish, so that subs are 
                // not display:none when measuring. Call before initialising 
                // containing tabs for same reason.

                jQuery(document).ready(function() {
                    jQuery(".box_skitter_large").skitter({
                        animation: "random",
                        interval: 3000,
                        numbers: false,
                        numbers_align: "right",
                        hideTools: true,
                        controls: false,
                        focus: false,
                        focus_position: true,
                        width_label: '340px',
                        enable_navigation_keys: true,
                        progressbar: false
                    });
                });

            });
        </script>
        <link rel="shortcut icon" href="images/icon.ico" >
        <title>cabecalho</title>
    </head>
    <body>
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
                       
                    </li>
                    <li><a href="statistics.jsp">Statistics</a></li>
                    <li><a href="team.jsp">Team</a></li>
                </ul>
            </div>
        </header>
       <hr/>
    </body>
</html>
