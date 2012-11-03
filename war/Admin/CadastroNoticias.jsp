<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            			<table>
            				<tr>
            					<td>Título:</td>
            					<td><input type="text" name="txtTitulo" /></td>
            				</tr>
            				<tr>
            					<td>Texto:</td>
            					<td><textarea rows="30" cols="50" name="txtConteudo"></textarea></td>
            				</tr>
            				<tr>
            					<td colspan="2">&nbsp;</td>
            				</tr>
            				<tr>
            					<td align="left"><input type="button" onclick="javascript:history.back()" value="voltar" /></td>
            					<td align="right"><input type="submit" value="cadastrar" /></td>
            				</tr>
            			</table>
            		</form>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
    <c:import url="/includes/footer.jsp" />
    <!-- footer -->
</body>
</html>