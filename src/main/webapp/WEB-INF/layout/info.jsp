<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
	body, body *{
		font-family: 'Jua'
	}
	div.info img{
		width: 80px;
		height: 20px;
	}
	
	div.info{
		font-size: 15px;
		width: 100px;
		border: 4px solid pink;
		height: 150px;
		background-color: #add8e6;
	}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<body>
<div class="info">
	<b style="color: red;font-size: 20px;">비트상점</b><br>
	<i class="bi bi-telephone-plus-fill"></i> 02-675-8989<br><br>
	<img src="${root}/photo/npay.png"><br>
	<img src="${root}/photo/npay2.png"><br>
	<img src="${root}/photo/npay3.png"><br>
	
</div>
</body>
</html>
