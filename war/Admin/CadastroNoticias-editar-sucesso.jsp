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
<title>Copa 14 - Admin - Noticia cadastrada</title>
</head>
<body>
<%
	
    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

	String noticiaTitulo = request.getParameter("txtTitulo").toString();
	Text noticiaConteudo = new Text(request.getParameter("txtConteudo").toString());
	String noticiaimgurl = request.getParameter("txtURLimg").toString();
	Long idnoticia = Long.parseLong(request.getParameter("txtid").toString());
	Date date = new Date();
	
	Entity noticia = null;

	Query query = new Query("Noticia").addSort("noticiaData", Query.SortDirection.DESCENDING);
	PreparedQuery pq = datastore.prepare(query);
	for (Entity noticia1 : pq.asIterable()) {
		if (noticia1.getKey().getId() == idnoticia)
			noticia = noticia1;
	}
	
	noticia.setProperty("noticiaTitulo", noticiaTitulo);
    noticia.setProperty("noticiaData", date);
    noticia.setProperty("noticiaConteudo", noticiaConteudo);
    noticia.setProperty("noticiaurlimg", noticiaimgurl);
    
    datastore.put(noticia);
    
%>
<div id="wrap">
    	<!-- header -->
    	<c:import url="/includes/header.jsp" />
    	<!-- header -->
        <div id="contentzone">
			<div id="breadcrumb">
                <h1>> Admin > Notícias</h1>
                <span>Você está em: <a href="/">Home</a> > Admin > Notícias<span>
            </div>
            <div id="content-interno">
            	<div id="cidadesSede">
            		Notícia alterada com sucesso!
            		<br>
            		<br>
            		<input type="button" onclick="window.location='CadastroNoticias.jsp'" value="Voltar" />
                </div>
                
            </div>
        </div>
    </div>
    <!-- footer -->
    <c:import url="/includes/footer.jsp" />
    <!-- footer -->
</body>
</html>