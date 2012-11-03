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
	String noticiaTitulo = request.getParameter("txtTitulo").toString();
	Key noticiaKey = KeyFactory.createKey("Noticia", noticiaTitulo);
	Text noticiaConteudo = new Text(request.getParameter("txtConteudo").toString());
    Date date = new Date();
    Entity noticia = new Entity("Noticia", noticiaKey);
    noticia.setProperty("noticiaTitulo", noticiaTitulo);
    noticia.setProperty("noticiaData", date);
    noticia.setProperty("noticiaConteudo", noticiaConteudo);

    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
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
            		Notícia cadastrada com sucesso!
            		<br>
            		<br>
            		<input type="button" onclick="javascript:history.back();" value="Voltar" />
                </div>
                <div>
                <%
                
                Query query = new Query("Noticia").addSort("noticiaData", Query.SortDirection.DESCENDING);
                PreparedQuery pq = datastore.prepare(query);
                List<Entity> noticias = pq.asList(FetchOptions.Builder.withLimit(5)); 
                %>
                <br>
                <h2>Notícias cadastradas</h2>
                <br>
                <table>
                	<% for (Entity noticia1 : pq.asIterable()) {
                		String tit1= new String(noticia1.getProperty("noticiaTitulo").toString().getBytes("iso-8859-1"),"iso-8859-1");
                		pageContext.setAttribute("noticia_titulo",
                				tit1);
				           %>
				           <tr><td>${fn:escapeXml(noticia_titulo)}</td></tr>
				           <%
				     
				   } %>
                </table>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
    <c:import url="/includes/footer.jsp" />
    <!-- footer -->
</body>
</html>