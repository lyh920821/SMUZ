<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>S:MUZ</title>
<link rel="stylesheet" href="${path}/resources/css/loding.css" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
	$(document).ready(function() {
		var rating ="${sessionScope.loginsession.sm_rating}";
		var set;
		if(rating=="999999"){
			set = "${path}/adminHome.do";
		}else{
			set = "${path}/linked/feed.do";
		}
		setTimeout(function() {
			location.href=set;
		}, 1000);
	});
</script>
</head>
<body>
	<div class="loader">
		<div class="bar"></div>
		<div class="bar"></div>
		<div class="bar"></div>
		<div class="bar"></div>
		<div class="bar"></div>
		<div class="bar"></div>
		<div class="bar"></div>
		<div class="bar"></div>
		<div class="bar"></div>
		<div class="bar"></div>
	</div>

	<div class="loader loader--reflect">
		<div class="bar"></div>
		<div class="bar"></div>
		<div class="bar"></div>
		<div class="bar"></div>
		<div class="bar"></div>
		<div class="bar"></div>
		<div class="bar"></div>
		<div class="bar"></div>
		<div class="bar"></div>
		<div class="bar"></div>
	</div>

	<div class="a1">
		<p>${name} 님 환영합니다.</p>
	</div>

</body>
</html>