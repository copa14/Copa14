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
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Copa 14 - Notícias</title>

</head>
<body>
<div id="wrap">
    	<!-- header -->
    	<c:import url="/includes/header.jsp" />
    	<!-- header -->
        <div id="contentzone">
			<div id="breadcrumb">
                <h1>> Notícias</h1>
                <span>Você está em: <a href="/">Home</a> > Notícias<span>
            </div>
            <div id="content-interno">
            	<div id="noticia">
            	<% 
                	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
                	Query query = new Query("Noticia").addSort("noticiaData", Query.SortDirection.DESCENDING);
                    PreparedQuery pq = datastore.prepare(query);
                    Long idnoticia = Long.parseLong(request.getParameter("id").toString());
                	
                	Entity noticia = null;
                	
                	for (Entity noticia1 : pq.asIterable()) {
                		if (noticia1.getKey().getId() == idnoticia)
                			noticia = noticia1;
                	}
                	pageContext.setAttribute("noticia_titulo",
            				noticia.getProperty("noticiaTitulo"));
            		pageContext.setAttribute("noticia_conteudo",
            				noticia.getProperty("noticiaConteudo"));
            		pageContext.setAttribute("noticia_data",
            				noticia.getProperty("noticiaData"));
            		Text noticiaconteudo = (Text)noticia.getProperty("noticiaConteudo");

            		Date data =  new Date();  
    				Locale local = new Locale("pt","BR");  
    				DateFormat dateFormat = new SimpleDateFormat("dd'/'MM'/'yyyy - HH:mm",local);

				     %>
				     <div><%= dateFormat.format(data) %></div>
				     <h2>${fn:escapeXml(noticia_titulo)}</h2>
				     <br>
				     <%
				     	if(noticia.getProperty("noticiaurlimg") != null) {
				     		%>
				     		<div style="float:left;padding-right:5px;padding-bottom:5px"><img style="float:left;max-width:300px" src="<%=noticia.getProperty("noticiaurlimg") %>" /></div>
				     		<%
				     	}
				     %>
				      
				     <%=noticiaconteudo.getValue() %>
				     <div>&nbsp;</div>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
    <c:import url="/includes/footer.jsp" />
    <!-- footer -->
</body>
</html>