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
	
    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	Long idvideo = Long.parseLong(request.getParameter("txtid").toString());
	Query query = new Query("Video").addSort("videoData", Query.SortDirection.DESCENDING);
	PreparedQuery pq = datastore.prepare(query);
	Entity editarvideo = null;
	int cont = 0;
	for (Entity video1 : pq.asIterable()) {
		if (video1.getKey().getId() == idvideo) {
			editarvideo = video1;
			cont++;
		}
	}
	if (cont == 0) {
		response.sendRedirect("CadastroVideos.jsp");
	}
	Text videoconteudo = (Text)editarvideo.getProperty("videoConteudo");
	Text videoconteudomini = (Text)editarvideo.getProperty("videoConteudoMini");
    
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
                	<h2>Editar vídeo</h2>
            		<form action="CadastroVideos-editar-sucesso.jsp" method="post">
            			<table class="noticiaslista">
            				<tr>
            					<td>Título:</td>
            					<td><input type="text" name="txtTitulo" size="79" value="<%=editarvideo.getProperty("noticiaTitulo").toString()%>"/></td>
            				</tr>
            				<tr>
            					<td>Vídeo:</td>
            					<td><textarea rows="20" cols="80" name="txtConteudo" ><%=videoconteudo.getValue() %></textarea></td>
            				</tr>
            				<tr>
            					<td>Mini Vídeo:</td>
            					<td><textarea rows="20" cols="80" name="txtConteudoMini" ><%=videoconteudomini.getValue() %></textarea></td>
            				</tr>
            				<tr>
            					<td colspan="2"><input type="hidden" name="txtid" value="<%=editarvideo.getKey().getId()%>" /></td>
            				</tr>
            				<tr>
            					<td align="left"><input type="button" onclick="window.location='CadastroVideos.jsp'" value=" Voltar " /></td>
            					<td align="right"><input type="submit" value=" Alterar " /></td>
            				</tr>
            			</table>
            		</form>
            		<br>
            		<input type="button" onclick="window.location='CadastroVideos.jsp'" value="Voltar" />
            		<br><br>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
    <c:import url="/includes/footer.jsp" />
    <!-- footer -->
</body>
</html>