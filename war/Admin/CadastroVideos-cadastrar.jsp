<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.Text" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.Query.*" %>
<%@ page import="com.google.appengine.api.datastore.PreparedQuery" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Copa 14 - Admin - Vídeo cadastrado</title>
</head>
<body>
<%
	String videoTitulo = request.getParameter("txtTitulo").toString();
	Key videoKey = KeyFactory.createKey("Video", videoTitulo);
	Text videoConteudo = new Text(request.getParameter("txtConteudo").toString());
	Text videoConteudoMini = new Text(request.getParameter("txtConteudoMini").toString());
    Date date = new Date();
    Entity video = new Entity("Video", videoKey);
    video.setProperty("videoTitulo", videoTitulo);
    video.setProperty("videoData", date);
    video.setProperty("videoConteudo", videoConteudo);
    video.setProperty("videoConteudoMini", videoConteudoMini);

    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    datastore.put(video);
%>
<div id="wrap">
    	<!-- header -->
    	<c:import url="/includes/header.jsp" />
    	<!-- header -->
        <div id="contentzone">
			<div id="breadcrumb">
                <h1>> Admin > Vídeos</h1>
                <span>Você está em: <a href="/">Home</a> > Admin > Vídeos<span>
            </div>
            <div id="content-interno">
            	<!-- menu admin -->
		    	<c:import url="/includes/menuadmin.jsp" />
		    	<!-- menu admin -->
                <div id="conteudoadmin">
                	<h2>Cadastro de vídeo</h2><br>
                	Vídeo cadastrado com sucesso!
            		<br>
            		<br>
            		<input type="button" onclick="CadastroVideos.jsp" value="Voltar" />
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
    <c:import url="/includes/footer.jsp" />
    <!-- footer -->
</body>
</html>