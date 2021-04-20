<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jsp/components/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
	<title>CLand | VinaEnter Edu</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<c:url value="/resources/cland" var="contextPath" scope="application" ></c:url>
	
	<!--Oswald Font -->
	<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css' />
	<link rel="stylesheet" type="text/css" href="${contextPath}/css/tooltipster.css" />
	<!-- home slider-->
	<link href="${contextPath}/css/pgwslider.css" rel="stylesheet" />
	<!-- Font Awesome -->
	<link rel="stylesheet" href="${contextPath}/css/font-awesome.min.css" />
	<link href="${contextPath}/css/style.css" rel="stylesheet" media="screen" />	
	<link href="${contextPath}/css/responsive.css" rel="stylesheet" media="screen" />
</head>

<body>
	<jsp:useBean id="dateUtil" class="edu.vinaenter.util.DateUtil" scope="application" />
	<jsp:useBean id="stringUtil" class="edu.vinaenter.util.StringUtil" scope="application" />
	<c:url value="/" var="urlIndex" scope="application" ></c:url>
	<c:url value="/danh-muc" var="urlCat" scope="application" ></c:url>
	<c:url value="/lien-he" var="urlContact" scope="application" ></c:url>
	<c:url value="/chi-tiet" var="urlDetail" scope="application" ></c:url>
	<c:url value="/tim-kiem" var="urlSearch" scope="application" ></c:url>
	
	<tiles:insertAttribute name="header"></tiles:insertAttribute>
	<section id="content_area" >
		<div class="clearfix wrapper main_content_area">
			<tiles:insertAttribute name="body"></tiles:insertAttribute>
			<tiles:insertAttribute name="rightbar"></tiles:insertAttribute>
		</div>
	</section>
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.0.min.js"></script>	
	<script type="text/javascript" src="${contextPath}/js/jquery.tooltipster.min.js"></script>		
	<script type="text/javascript">
		$(document).ready(function() {
			$('.tooltip').tooltipster();
		});
	</script>
	 <script type="text/javascript" src="${contextPath}/js/selectnav.min.js"></script>
	<script type="text/javascript">
		selectnav('nav', {
		  label: '-Navigation-',
		  nested: true,
		  indent: '-'
		});
	</script>		
	<script src="${contextPath}/js/pgwslider.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.pgwSlider').pgwSlider({
				intervalDuration: 5000
			});
		});
	</script>
	<script type="text/javascript" src="${contextPath}/js/placeholder_support_IE.js"></script>
</body>
</html>