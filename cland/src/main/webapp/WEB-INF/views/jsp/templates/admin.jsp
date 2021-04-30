<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jsp/components/taglib.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Cland | Admin</title>
    
    <c:url value="/resources/admin" var="contextPath" scope="application" ></c:url>
    <c:url value="/resources/cland" var="contextPathImage" scope="application" ></c:url>
    
    <link rel="shortcut icon" type="image/ico" href="${img}/icon-180x180.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="${contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <link href="${contextPath}/css/style1.css" rel="stylesheet">
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.0.min.js"></script>
	<script type="text/javascript" src="${contextPath}/js/jquery.validate.min.js"></script>
  </head>
  <body>
  	<c:url value="/admin" var="urlIndex" scope="application" ></c:url>
  	<c:url value="/admin/cat" var="urlCat" scope="application" ></c:url>
  	<c:url value="/admin/land" var="urlLand" scope="application" ></c:url>
  	<c:url value="/admin/contact" var="urlContact" scope="application" ></c:url>
  	<c:url value="/admin/user" var="urlUser" scope="application" ></c:url>
  	<c:url value="/admin/profile" var="urlProfile" scope="application" ></c:url>
  	<c:url value="/auth" var="urlAuth" scope="application" ></c:url>
  
  	<tiles:insertAttribute name="header"></tiles:insertAttribute>
    <div class="page-content">
    	<div class="row">
		  <div class="col-md-2">
		      <tiles:insertAttribute name="leftbar"></tiles:insertAttribute>
		  </div>
		  <div class="col-md-10">
			  <tiles:insertAttribute name="body"></tiles:insertAttribute>
		  </div>
		</div>
    </div>
    <tiles:insertAttribute name="footer"></tiles:insertAttribute>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins)
    <script src="https://code.jquery.com/jquery.js"></script>
    -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <script src="${contextPath}/js/custom.js"></script>
  </body>
</html>