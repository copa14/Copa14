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
	Long idnoticia = Long.parseLong(request.getParameter("txtid").toString());
	Query query = new Query("Noticia").addSort("noticiaData", Query.SortDirection.DESCENDING);
	PreparedQuery pq = datastore.prepare(query);
	Entity editarnoticia = null;
	int cont = 0;
	for (Entity noticia1 : pq.asIterable()) {
		if (noticia1.getKey().getId() == idnoticia) {
			editarnoticia = noticia1;
			cont++;
		}
	}
	if (cont == 0) {
		response.sendRedirect("CadastroNoticias.jsp");
	}
	Text noticiaconteudo = (Text)editarnoticia.getProperty("noticiaConteudo");
    
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
            		<h2>Editar notícia</h2>
            		<form action="CadastroNoticias-editar-sucesso.jsp" method="post">
            			<table class="noticiaslista">
            				<tr>
            					<td>Título:</td>
            					<td><input type="text" name="txtTitulo" size="79" value="<%=editarnoticia.getProperty("noticiaTitulo").toString()%>"/></td>
            				</tr>
            				<tr>
            					<td>URL da imagem:</td>
            					<td><input type="text" name="txtURLimg" size="79" value="<%=editarnoticia.getProperty("noticiaurlimg").toString()%>" /></td>
            				</tr>
            				<tr>
            					<td>Texto:</td>
            					<td><textarea rows="20" cols="80" name="txtConteudo" ><%=noticiaconteudo.getValue() %></textarea></td>
            				</tr>
            				<tr>
            					<td colspan="2"><input type="hidden" name="txtid" value="<%=editarnoticia.getKey().getId()%>" /></td>
            				</tr>
            				<tr>
            					<td align="left"><input type="button" onclick="window.location='CadastroNoticias.jsp'" value=" Voltar " /></td>
            					<td align="right"><input type="submit" value=" Alterar " /></td>
            				</tr>
            			</table>
            		</form>
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