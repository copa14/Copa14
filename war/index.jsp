<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Copa 14- Home</title>

</head>
<body>
	<div id="wrap">
    	<!-- header -->
    	<c:import url="/includes/header.jsp" />
    	<!-- header -->
        <div id="contentzone">
        	<div id="da-slider" class="da-slider">
				<div class="da-slide">
					<h2>Seleções</h2>
					<p>Conheça os jogadores de cada seleção.</p>
					<a href="Selecoes.jsp" class="da-link">Saiba mais</a>
					<div class="da-img"><img src="img/teams.jpg" alt="Seleções" /></div>
				</div>
				<div class="da-slide">
					<h2>Cidades-Sede</h2>
					<p>Doze cidades das cinco regiões do Brasil receberão a Copa do Mundo em 2014.</p>
					<a href="Cidades.jsp" class="da-link">Saiba mais</a>
					<div class="da-img"><img src="img/estadios.png" alt="Cidades-Sede" /></div>
				</div>
				<div class="da-slide">
					<h2>Tabela de Jogos</h2>
					<p>Saiba tudo sobre as chaves, as datas, horários e locais de todos os jogos, os placares finais e a classificação de cada seleção.</p>
					<a href="Jogos.jsp" class="da-link">Saiba mais</a>
					<div class="da-img"><img src="img/world-cup-fixture-table.gif" alt="Tabela" /></div>
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
                	<div id="video-home">
                    	<object width="160" height="120"><param name="movie" value="http://www.youtube.com/v/rjU1KeTPack?version=3&amp;hl=pt_BR"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/rjU1KeTPack?version=3&amp;hl=pt_BR" type="application/x-shockwave-flash" width="160" height="120" allowscriptaccess="always" allowfullscreen="true"></embed></object>
                    	<div><a href="Video.jsp?VideoID=">Especial Copa do Mundo 2014 - Parte I</a></div>
                    </div>
                    <div id="video-home">
                    	<object width="160" height="120"><param name="movie" value="http://www.youtube.com/v/SKRHzhdT0zg?version=3&amp;hl=pt_BR"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/SKRHzhdT0zg?version=3&amp;hl=pt_BR" type="application/x-shockwave-flash" width="160" height="120" allowscriptaccess="always" allowfullscreen="true"></embed></object>
                    	<div><span><a href="Video.jsp?VideoID=">Especial Copa do Mundo 2014 - Parte II</a></span></div>
                    </div>
                    <div id="vejaMais">
                    	<a href="FiquePorDentro.jsp">> veja mais</a>
                    </div>
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