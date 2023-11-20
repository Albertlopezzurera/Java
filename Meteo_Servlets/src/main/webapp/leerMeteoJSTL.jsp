<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="org.apache.taglibs.standard.tag.common.fmt.ParseDateSupport"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>PREDICCIONES CON XML A JSTL</title>
</head>
<body>
	<%
	Date fecha = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	String fechaMeteo = format.format(fecha);
	%>
	<c:import var="doc" url="https://www.aemet.es/es/api-eltiempo/prediccion/$(fechaMeteo)/PB/8/6908"/>
	<x:parse var="documento" xml="${doc}" />
	<h1>Temperaturas</h1>
	<p><x:out select = "$documento/root/prediccion/txt_prediccion/p"/></p>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>NOMBRE</th>
			<th>MINIMA</th>
			<th>MAXIMA</th>
		</tr>
		<x:forEach var="elemento" select="$documento/root/prediccion/ciudad">
			<tr>
				<td><x:out select="$elemento/id" /></td>
				<td><x:out select="$elemento/nombre" /></td>
				<td><x:out select="$elemento/minima" /></td>
				<td><x:out select="$elemento/maxima" /></td>
			</tr>
		</x:forEach>
	</table>
</body>
</html>
