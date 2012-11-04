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
<title>Copa 14 - Admin - Vídeos</title>
</head>
<body>
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
                	<h2>Cadastro de Vídeos</h2><br>
                	<form action="CadastroVideos-cadastrar.jsp" method="post">
            			<table class="noticiaslista">
            				<tr>
            					<td>Título:</td>
            					<td><input type="text" name="txtTitulo" size="79" /></td>
            				</tr>
            				<tr>
            					<td>Video:</td>
            					<td><textarea rows="10" cols="80" name="txtConteudo"></textarea></td>
            				</tr>
            				<tr>
            					<td>Mini Vídeo:</td>
            					<td><textarea rows="10" cols="50" name="txtConteudoMini" ></textarea></td>
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
                Query query = new Query("Video").addSort("videoData", Query.SortDirection.DESCENDING);
                List<Entity> videos = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(50)); 
                %>
                <br>
                <h2>Vídeos cadastrados</h2>
                <br>
                <table class="noticiaslista">
                	<tr>
                		<td>Vídeo ID</td>
                		<td>Título</td>
                		<td colspan="2">Ações</td>
                	</tr>
                	<% for (Entity video1 : videos) {                		
                		pageContext.setAttribute("video_titulo",
                				video1.getProperty("videoTitulo"));
                		
				           %>
				           <tr>
				           		<td>
				           			<%=video1.getKey().getId()%>
				           		</td>
				           		<td>${fn:escapeXml(video_titulo)}</td>
				           		<td>
				           			<form action="CadastroVideos-editar.jsp" method="post">
				           			<input type="hidden" name="txtid" value="<%=video1.getKey().getId()%>" />
				           			<input type="submit" value=" Editar " />
				           			</form>
				           		</td>
				           		<td>
				           			<form action="CadastroVideo-excluir.jsp" method="post">
				           			<input type="hidden" name="txtid" value="<%=video1.getKey().getId()%>" />
				           			<input type="submit" value=" Excluir " />
				           			</form>
				           		</td>
				           	</tr>
				           <%
				     
				   } %>
                </table>
                <br><br>
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