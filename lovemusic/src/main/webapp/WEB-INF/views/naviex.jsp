<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html">
<html>
<head>
<title>Insert title here</title>
<!-- <script src="js/jquery.js"></script>
<script src="js/jquery-migrate.min.js"></script> -->
<!--  JQUERY VERSION MUST MATCH WORDPRESS ACTUAL VERSION (NOW 1.12) -->
</head>
<body>
	<jsp:include page="navibar.jsp" flush="false" />
	<script type="text/javascript">
		$(".qwsmoothscroll").eq(2).addClass("active");
	</script>
	<div id="totalWrapper" style="background-color: white;"></div>
</body>
</html>