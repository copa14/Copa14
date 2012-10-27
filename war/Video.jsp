<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Copa 14 - Videos</title>

</head>
<body>
<div id="wrap">
    	<!-- header -->
    	<c:import url="/includes/header.jsp" />
    	<!-- header -->
        <div id="contentzone">
			<div id="breadcrumb">
                <h1>> Videos</h1>
                <span>Você está em: <a href="/">Home</a> > Vídeos<span>
                </div>
            <div id="content-interno">
            	<div id="video">
            	<object width="960" height="720"><param name="movie" value="http://www.youtube.com/v/rjU1KeTPack?version=3&amp;hl=pt_BR"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/rjU1KeTPack?version=3&amp;hl=pt_BR" type="application/x-shockwave-flash" width="960" height="720" allowscriptaccess="always" allowfullscreen="true"></embed></object>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
    <c:import url="/includes/footer.jsp" />
    <!-- footer -->
</body>
</html>