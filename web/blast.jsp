<%-- 
    Document   : sequence
    Created on : 29/03/2012, 16:57:08
    Author     : bruno_arabori
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" media="all" href="style.css" />
        <link rel="stylesheet" type="text/css" media="all" href="style.css" />

        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>

        <script>
            function verificaNumero(e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            }
            function verificaNumeroeVirgula(e) {
                if (e.which != 46 && e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            }

            $(document).ready(function() {

                $("#spinner_v").keypress(verificaNumero);
                $("#spinner_b").keypress(verificaNumero);
                $("#spinner_e").keypress(verificaNumeroeVirgula);

            });
        </script>
          <link rel="shortcut icon" href="images/icon.ico" >
        <title>Blast</title>
    </head>

    <body>
        <div id="wrapper960" class="clearfix">
            <div id="header" class="clearfix">
                <c:import url="cabecalho_cmenu.jsp" />
            </div> 


            <div id="content" class="clearfix shadow">      

                <form enctype="multipart/form-data" action="upload" method="post">    <!--enctype="multipart/form-data"-->           
                    <td><input type="text" value="\n\n" name="espaco" style="display: none" </td>
                    <table align="left">
                        <h2>Choose program to use and database to search:</h2>
                        <h4><p>
                                Program <select disabled="true">  
                                    <option >Blastn</option>
                                </select> 
                                <b>Database:</b>   
                                <!--________________________________________________SELECT BOX_________________________________________________-->
                                <select size="1" name="dataset">                                                                       
                                    <option value="18weeks.fasta">coffea fruit 18 weeks</option>
                                    <option value="22weeks.fasta">coffea fruit 22 weeks</option>
                                    <option value="30weeks.fasta">coffea fruit 30 weeks</option>
                                    <option value="42weeks.fasta">coffea fruit 42 weeks</option>
                                    <option value="46weeks.fasta">coffea fruit 46 weeks</option>    
                                    <option value="coffea_arabica.fasta">Coffea canephora contigs</option>
                                    <option value="coffea_canephora.fasta">Coffea arabica contigs</option> 
                                </select>
                                <!---->
                            </p></h4>
                    </table>

                    <table align="left">
                        <h3>Query</h3>             
                        <h5>Enter a fasta sequence and/or upload a file</h5>
                        <!--________________________________________________TEXT AREA_________________________________________________-->

                        <textarea id="styled" rows="5" cols="95" 
                                  name="seq_txt" wrap="soft" >   
                        </textarea>
                        <tr>
                            <td>
                                <!--________________________________________________CHOOSE FILE_________________________________________________-->
                                Choose the file To Upload:
                                <input type="file" name="seq_file">                 
                            </td> 
                        </tr>

                        <td><br/>
                            <input type="submit" value="BLAST">    
                        </td>
                    </table>

                    <table  id="filtro" align="left"> 
                        <tr>
                            <td><br/><h3>Filters</h3></td>  
                            <td></td>
                        </tr>

                        <tr>                                                                 
                            <td></td>

                            <td style="padding-left: 30px; padding-bottom: 10px">                                     
                                <label for="spinner_v">Number of database sequences to show one-line descriptions (-v):</label>
                                <input id="spinner_v" class="spiner"  name="v" size="2" min="1" value="4"/>
                            </td>
                        </tr>
                        <tr>
                            <td  style="padding-bottom: 40px">                                   
                                <label for="spinner_e">e-Value (-e): </label>
                                <input id="spinner_e" class="spiner"   name="e" size="5"  value="0.0010" />
                            </td>
                            <td style="padding-left: 30px">                                   
                                <label for="spinner_b">Number of database sequence to show alignments (-b): </label>
                                <input id="spinner_b" class="spiner"  name="b" size="2"  value="4" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Filter:
                            </td>
                            <td>
                                <input type="checkbox" value="L" name="filter" disabled="true" checked=""> Low complexity
                            </td>
                        </tr>

                    </table>       
                </form>
            </div>

            <div id="footer" class="shadow">
                <c:import url="rodape.jsp" />
            </div>
        </div>

        <script type="text/javascript">
            $(window).load(function() {
                $('#slider').nivoSlider();
            });
            $("#spinner_b").spinner();
            $("#spinner_v").spinner();
            $("#spinner_e").spinner();
        </script>
    </body>
</html>