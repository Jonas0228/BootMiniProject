<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Refresh" content="60;url=./list"> <!-- 10초에 한번씩 refresh -->
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
	body, body *{
		font-family: 'Jua'
	}
	
</style>
</head>
<body>

<h5 class="alert alert-danger" style="width: 700px;">총 ${totalCount}개의 글이 있습니다</h5>
<table class="table table-bordered" style="width: 700px;">
	<caption align="top"><h4><b>비회원 게시판 목록</b></h4>
		<span style="float: right;font-size:20px;cursor: pointer;"
		onclick="location.href='./writeform'">
			<i class="bi bi-pencil"></i>글쓰기
		</span>
	</caption>
	<tr style="background-color: #ddd">
		<th style="width: 40px">번호</th>
		<th style="width: 280px">제목</th>
		<th style="width: 80px">작성자</th>
		<th style="width: 100px">작성일</th>
		<th style="width: 70px">조회</th>		
	</tr>
	<c:if test="${totalCount==0}">
		<tr height="50">
			<td  colspan="5"  align="center" valign="middle">
				<b style="font-size: 1.3em">등록된 게시글이 없습니다</b>
			</td>
		</tr>
	</c:if>
	<c:if test="${totalCount>0}">
		<c:forEach var="dto" items="${list}">
			<tr>
				<td align="center">${no}</td>
				<c:set var="no" value="${no-1}"/>
				
				<!-- 제목 -->
				<td>
					<!-- depth 1당 빈칸2개 띄우기 -->
					<c:forEach begin="1" end="${dto.depth}">
						&nbsp;&nbsp;
					</c:forEach>
					<!-- 답글일 경우에만 앞에 답글 이미지 넣기 -->
					<c:if test="${dto.depth>0}">
						<img src="../photo/re.png">
					</c:if>
					<a href="content?num=${dto.num}&currentPage=${currentPage}" 
						style="color: #000; text-decoration: none; cursor: pointer;">
						<!-- css 제목이 너무 길경우 말줄임표... -->
						<span style="text-overflow:ellipsis;overflow: hidden;white-space: nowrap;
						display: inline-block ;max-width: 220px;">${dto.subject}</span>
						<!-- 사진이 있을 경우 아이콘 출력 -->
						<c:if test="${dto.filename!=''}">
							<i class="bi bi-images" style="display: inline-block;"></i>
						</c:if>
					</a>
				</td>
				<td>${dto.writer}</td>
				<td>
					<fmt:formatDate value="${dto.writeday}" pattern="yyyy.MM.dd"/>
				</td>
				<td>${dto.readcount}</td>
			</tr>
		</c:forEach>
	</c:if>
</table>
<!-- 페이징 처리 -->
<div style="width: 700px; text-align: center; font-size: 20px;">
	<!-- 이전 -->
	<c:if test="${startPage>1}">
		<a style="color: #000; text-decoration: none; cursor: pointer;" 
			href="list?currentPage=${startPage-1}"><i class="bi bi-caret-left-fill"></i>이전</a>
	</c:if>
	&nbsp;
	<!-- 페이지 번호 출력 -->
	<c:forEach var="pp" begin="${startPage}" end="${endPage}">
		<c:if test="${currentPage==pp}">
			<a style="color: green; text-decoration: none; cursor: pointer;" 
			href="list?currentPage=${pp}">${pp}</a>
		</c:if>
		<c:if test="${currentPage!=pp}">
			<a style="color: #000; text-decoration: none; cursor: pointer;" 
			href="list?currentPage=${pp}">${pp}</a>
		</c:if>
		&nbsp;
	</c:forEach>
	<!-- 다음 -->
	<c:if test="${endPage<totalPage}">
		<a style="color: #000; text-decoration: none; cursor: pointer;" 
			href="list?currentPage=${endPage+1}">다음<i class="bi bi-caret-right-fill"></i></a>
	</c:if>
</div>
</body>
</html>