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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Copa 14 - Admin - Notícias</title>
</head>
<body>
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
            		<form action="CadastroNoticias-cadastrar.jsp" method="post">
            			<table class="noticiaslista">
            				<tr>
            					<td>Título:</td>
            					<td><input type="text" name="txtTitulo" size="79" /></td>
            				</tr>
            				<tr>
            					<td>URL da imagem:</td>
            					<td><input type="text" name="txtURLimg" size="79" /></td>
            				</tr>
            				<tr>
            					<td>Texto:</td>
            					<td><textarea rows="20" cols="80" name="txtConteudo"></textarea></td>
            				</tr>
            				<tr>
            					<td colspan="2">&nbsp;</td>
            				</tr>
            				<tr>
            					<td align="left"><input type="button" onclick="javascript:history.back()" value=" Voltar " /></td>
            					<td align="right"><input type="submit" value=" Cadastrar " /></td>
            				</tr>
            			</table>
            		</form>
            		<div>
                <%
                DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
                Query query = new Query("Noticia").addSort("noticiaData", Query.SortDirection.DESCENDING);
                List<Entity> noticias = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(50)); 
                %>
                <br>
                <h2>Notícias cadastradas</h2>
                <br>
                <table class="noticiaslista">
                	<tr>
                		<td>Foto</td>
                		<td>Título</td>
                		<td colspan="2">Ações</td>
                	</tr>
                	<% for (Entity noticia1 : noticias) {                		
                		pageContext.setAttribute("noticia_titulo",
                				noticia1.getProperty("noticiaTitulo"));
                		pageContext.setAttribute("noticia_img",
                				noticia1.getProperty("noticiaurlimg"));
				           %>
				           <tr>
				           		<td>
				           			<img class="noticiathumb" src="${fn:escapeXml(noticia_img)}"/>
				           		</td>
				           		<td>${fn:escapeXml(noticia_titulo)}</td>
				           		<td>
				           			<form action="CadastroNoticias-editar.jsp" method="post">
				           			<input type="hidden" name="txtid" value="<%=noticia1.getKey().getId()%>" />
				           			<input type="submit" value=" Editar " />
				           			</form>
				           		</td>
				           		<td>
				           			<form action="CadastroNoticias-excluir.jsp" method="post">
				           			<input type="hidden" name="txtid" value="<%=noticia1.getKey().getId()%>" />
				           			<input type="submit" value=" Excluir " />
				           			</form>
				           		</td>
				           	</tr>
				           <%
				     
				   } %>
                </table>
                </div>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
    <c:import url="/includes/footer.jsp" />
    <!-- footer -->
</body>
</html>