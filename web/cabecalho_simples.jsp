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
				<a href="index.html"><strong>Travel</strong>Site</a>
			</div>	
			<div id="searchbox">
				<form action="#">
					<input type="text" id="search" placeholder="Search" />
					<button type="submit"></button>
				</form>
			</div>
			<div id="navigation">
				<ul id="nav">
					<li class="selected"><a href="index.html">Home</a></li>
					<li><a href="browse.html">Browse</a>
						<ul>
							<li><a href="browse-result.html">Browse Result</a></li>
							<li><a href="browse-detail.html">Browse Detail</a></li>
						</ul>
					</li>
					<li><a href="blog.html">Blog</a></li>
					<li><a href="contact.html">Contact</a></li>
					<li><a href="element.html">Element</a></li>
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
