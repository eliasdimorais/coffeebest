<%-- 
    Document   : exception
    Created on : 25/04/2013, 00:13:45
    Author     : bruno
--%>

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
        <title>Exception</title>
    </head>
    <body>
        <div id="wrapper960" class="clearfix">
            <div id="header" class="clearfix">    
                <c:import url="cabecalho_cmenu.jsp"/>
            </div> 

            <div id="content" class="clearfix shadow" style="height: auto"> 
                <h1>Ops! Something wrong!</h1>
                <h3>Let's look more closely what kind of problem do you have...</h3>
                <h5>
                    <ul>
                        <li>
                            Check your extension file or
                        </li>
                        <li>
                            Check your parameters. Is Everything alright? or
                        </li>
                        <li>
                            Check your net. Is It fast today??
                        </li>
                        <li>
                            Or maybe the problem is with us.
                            <br/>Send a email, please. We going to help you.
                        </li>
                    </ul>
                </h5>
                <h1>Ops! Algo Deu errado</h1>
                <h3>Vamos olhar mais de perto o tipo de problema que você tem...</h3>
                <ul>
                    <li>
                        Verifique a extensão o arquivo
                    </li>
                    <li>
                        Verifique se os parâmetros estão corretos.
                    </li>
                    <li>
                        Verifique sua internet. Ela está rápida hoje?
                    </li>
                    <li>
                        Ou talvez o problema seja em nosso servidor.<br/>
                        Envie um e-mail, por favor. Nós vamos ajudá-lo.
                    </li>
                </ul>
            </div>
        </div>
    </body>
</html>
