<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ include file="../commonvar.jsp" %>  

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
	
	div.box{
		width: 200px;
		height: 220px;
		border: 5px solid gold;
		border-radius: 20px;
		float: left;
		/* margin-right:65px; */
		background-color: #ccffcc;
		/* padding-left:20px; */
		/* padding-top: 20px; */
		text-align: center;
		padding-top: 16px;
	}
</style>
</head>
<body>
<button type="button" class="btn btn-sm btn-outline-success"
onclick="location.href='shopform'" style="margin-bottom: 10px">상품등록</button>

<h5 class="alert alert-danger">
	총 ${totalCount}개의 상품이 등록되어있습니다
	<span style="float: right">
		<button type="button" class="btn btn-sm btn-outline-danger"
onclick="location.href='list'" style="margin-bottom: 10px">자세히 확인</button>
	</span>
</h5>
<c:forEach var="dto" items="${list}" varStatus="i">
	<div class="box" style="margin-right:${i.count%3==0 ? '0' : '100px'}">
		<a href="detail?num=${dto.num}">
			<%-- <img src="http://qlbsjrafrjjd16981831.cdn.ntruss.com/shop/${dto.photo}?type=f&w=160&h=160&faceopt=true&ttype=jpg"> --%>
			<img src="http://${imageUrl_small}/shop/${dto.photo}?type=f&w=160&h=160&faceopt=true&ttype=jpg">
			<h5 style="text-align: center; margin-top: 8px;"><b>${dto.sangpum}</b></h5>
		</a>
	</div>
	<c:if test="${i.count%3==0}">
		<br style="clear: both;"><br>
	</c:if>
</c:forEach>
</body>
</html>
