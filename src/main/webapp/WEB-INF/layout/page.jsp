<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Abfragen</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" />" />
	<!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css" />" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/jasny-bootstrap.min.css" />" /> 
    <!-- WebSocket Protocols -->
    <script src="<c:url value="/resources/js/sockjs-0.3.4.js"/>"></script>
    <script src="<c:url value="/resources/js/stomp.js"/>"></script>
</head>
<body>
	<div class="container">
		<div id="header">
			<t:insertAttribute name="header" />
		</div>
		<div id="content">
			<t:insertAttribute name="body" />
		</div>
	
		<div id="footer">
			<t:insertAttribute name="footer" />
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jasny-bootstrap.min.js"/>"></script>
</body>
</html>