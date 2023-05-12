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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
	body, body *{
		font-family: 'Jua'
	}
</style>
</head>
<body>
	<h2>
	<div style="float:left;margin-right:10px; width: 40px;height: 40px;border: 1px solid black;background-color: ${dto.color}"></div>
	<b>${dto.sangpum}</b>
	</h2>
	<br>
	<img src="https://${imageUrl}/shop/${dto.photo}"
	border="5" style="max-width: 500px;">
	<br><br>
	<div style="font-size: 20px">
		가 격 : <fmt:formatNumber value="${dto.price}" pattern="#,##0"/>원<br>
		갯 수 : ${dto.cnt }개<br>
		입고일 : <fmt:formatDate value="${dto.ipgoday}" pattern="yyyy-MM-dd HH:mm"/><br>
	</div>
	<div>
		<button type="button" class="btn btn-outline-success btn-sm"
		style="width: 80px;" onclick="location.href='list'">목록1</button>
		<button type="button" class="btn btn-outline-success btn-sm"
		style="width: 80px;" onclick="location.href='list2'">목록2</button>
		<button type="button" class="btn btn-outline-success btn-sm"
		style="width: 80px;" data-bs-toggle="modal" data-bs-target="#myPhotoModal">사진수정</button>
		<button type="button" class="btn btn-outline-success btn-sm"
		style="width: 80px;" data-bs-toggle="modal" data-bs-target="#myShopModal">내용수정</button>
		<button type="button" class="btn btn-outline-success btn-sm"
		style="width: 80px;" id="delshop">삭제</button>
		
		
		
	</div>
	
	<script type="text/javascript">
		$("#delshop").click(function(){
			let a=confirm("삭제하려면 확인을 눌러주세요");
			if(a){
				location.href='./delete?num='+${dto.num}
			}
		});
	</script>
	
	<!--  사진변경모달 -->
	<div class="modal" id="myPhotoModal">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">사진 수정</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <img src="http://${imageUrl_small}/shop/${dto.photo}?type=f&w=160&h=160&faceopt=true&ttype=jpg" 
	        border="" style="margin-left: 30px; border-radius: 10px;" id="modalphoto">
	        
	        <!-- 카메라 모양 -->
	        <i class="bi bi-camera-fill update-photo" 
	        style="position: relative; left:-25px; top:85px; font-size: 30px; cursor: pointer;"></i>
	        <!-- 파일 업로드 태그 -->
	        <input type="file" id="photoupload" style="display: none;">
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" 
	        onclick="location.reload()">Apply</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	<script type="text/javascript">
	  	$(".update-photo").click(function(){
	  		$("#photoupload").trigger("click"); //click 이벤트 강제 발생
	  	});
	  	
	  	/*
			processData:false : 서버에 전달하는 데이타는 query string이라는 형태로 전달된다
			파일전송의 경우 이를 하지 않아야하는데 그설정이 false ,
			contentType:false : enctype 이 원래 기본값이 application/x-www..... 이거인데
			  multipart/form-data로 변경해준다
			*/
	  	
	  	$("#photoupload").change(function(){
	  		let form=new FormData();
	  		form.append("upload",$("#photoupload")[0].files[0]);//선택한 1개의 파일만 업로드
	  		form.append("num",${dto.num});
	  		$.ajax({
	  			type:"post",
	  			dataType:"text",
	  			url:"./photochange",
	  			data:form,
	  			processData:false,
	  			contentType:false,
	  			success:function(res){
	  				let src=`http://${imageUrl_small}/shop/\${res}?type=f&w=160&h=160&faceopt=true&ttype=jpg`;
	  				$("#modalphoto").attr("src",src);
	  			}
	  		});
	  	});
	  </script>
	  
	  <!-- 내용 변경 모달 -->
	<div class="modal" id="myShopModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">상품정보 수정</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <img src="http://${imageUrl_small}/shop/${dto.photo}?type=f&w=160&h=160&faceopt=true&ttype=jpg"
	         border="2" style="margin-left: 30px;border-radius: 100px;">
	       <br>
	       <form id="updateform">
	       	<input  type="hidden" name="num" value="${dto.num}">
			<table  class="table table-bordered">
				<tr>
					<th style="width: 100px;background-color: #ddd">상품명</th>
					<td>
						<input type="text" class="form-control" name="sangpum" required="required"
						value="${dto.sangpum}">
					</td>
				</tr>			
				
				<tr>
					<th style="width: 100px;background-color: #ddd">색상</th>
					<td>
						<input type="color" class="form-control" name="color" value="${dto.color}">
					</td>
				</tr>
				<tr>
					<th style="width: 100px;background-color: #ddd">가격</th>
					<td>
						<input type="number" class="form-control" name="price" 
						min="1000" max="9999999" value="${dto.price}">
					</td>
				</tr>
					<th style="width: 100px;background-color: #ddd">갯수</th>
					<td>
						<input type="number" class="form-control" name="cnt" 
						min="1" max="5" step="1" value="${dto.cnt}">
					</td>
				</tr>			
			</table>
		</form>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal"
	        id="btnupdate">Apply</button>
	      </div>
	    </div>
	  </div>  
	</div>
	<script type="text/javascript">
	$("#btnupdate").click(function(){
		let data=$("#updateform").serialize();
		//alert(data);
		$.ajax({
  			type:"get",
  			dataType:"text",
  			url:"./update",
  			data:data,  			
  			success:function(res){  				
  				location.reload();		
  			}
  		});
	});
</script>
</body>
</html>

























