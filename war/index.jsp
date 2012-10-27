<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Copa 14- Home</title>
<link rel="stylesheet" type="text/css" href="css/styles.css" />
<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style2.css" />
		<script type="text/javascript" src="js/modernizr.custom.28468.js"></script>
		<link href='http://fonts.googleapis.com/css?family=Economica:700,400italic' rel='stylesheet' type='text/css'>
		<noscript>
			<link rel="stylesheet" type="text/css" href="css/nojs.css" />
		</noscript>
</head>
<body>
	<div id="wrap">
    	<!-- header -->
    	<c:import url="/includes/header.jsp" />
    	<!-- header -->
        <div id="contentzone">
        	<div id="da-slider" class="da-slider">
				<div class="da-slide">
					<h2>Sele��es</h2>
					<p>Conhe�a os jogadores de cada sele��o.</p>
					<a href="#" class="da-link">Saiba mais</a>
					<div class="da-img"><img src="images/3.png" alt="image01" /></div>
				</div>
				<div class="da-slide">
					<h2>Cidades-Sede</h2>
					<p>Doze cidades das cinco regi�es do Brasil receber�o a Copa do Mundo em 2014.</p>
					<a href="#" class="da-link">Saiba mais</a>
					<div class="da-img"><img src="img/estadios.png" alt="Cidades-Sede" /></div>
				</div>
				<div class="da-slide">
					<h2>Tabela de Jogos</h2>
					<p>Saiba tudo sobre as chaves, as datas, hor�rios e locais de todos os jogos, os placares finais e a classifica��o de cada sele��o.</p>
					<a href="#" class="da-link">Saiba mais</a>
					<div class="da-img"><img src="images/4.png" alt="image01" /></div>
				</div>
				<nav class="da-arrows">
					<span class="da-arrows-prev"></span>
					<span class="da-arrows-next"></span>
				</nav>
			</div>
            
            <div id="content">
            	<div id="noticias">
                </div>
                <div id="videos">
                </div>
                <div id="twitter_newsletter">
                	<a class="twitter-timeline" href="https://twitter.com/Copa141" data-widget-id="262136515428237312">Tweets de @Copa141</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
					<script type="text/javascript">
						$(document).ready(function(){
							$('#twitter-widget-0').attr('width','279');
						});
					</script>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
    <c:import url="/includes/footer.jsp" />
    <!-- footer -->
    
		<script type="text/javascript" src="js/jquery.cslider.js"></script>
		<script type="text/javascript">
			$(function() {
			
				$('#da-slider').cslider({
					autoplay	: true,
					bgincrement	: 450
				});
			
			});
		</script>
</body>
</html>