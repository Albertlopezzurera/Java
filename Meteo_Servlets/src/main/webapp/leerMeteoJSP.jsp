<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.net.http.HttpClient"%>
<%@ page import="java.net.http.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%
int id;
String poblacion;
int min; 
int max;
Date fecha = new Date();
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
String yyyyMM = format.format(fecha);
String url = "https://www.aemet.es/es/api-eltiempo/prediccion/" + yyyyMM + "/PB/8/6908";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EJEMPLO DE JSP SOBRE UN XML</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>NOMBRE</th>
			<th>MINIMA</th>
			<th>MAXIMA</th>
		</tr>
		<c:parse var="xml" scope="page" xml="${xmlData}" />
		<c:forEach var="poblacion"
			items="${xml.prediccion.dia[0].temperatura}">
			<tr>
				<td>id</td>
				<td>poblacion</td>
				<td>min</td>
				<td>max</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>