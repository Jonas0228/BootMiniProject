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
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gowun+Dodum&family=Gugi&family=Jua&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&family=Poppins&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<style>
   body, body *{

      font-family: 'Jua'

   }
</style>

</head>
<body>

<!-- 이미지 출력할 곳 -->
<img id="showimg"
style="position: absolute; left:550px; top:50px; max-width: 300px;">


   <div style="width:450px;">
      <form action="insert" method="post" enctype="multipart/form-data">
      <!--  hidden -->
      <input type="hidden" name="num" value="${num}">
      <input type="hidden" name="ref" value="${ref}">
      <input type="hidden" name="step" value="${step}">
      <input type="hidden" name="depth" value="${depth}">
      <input type="hidden" name="currentPage" value="${currentPage}">
      
         <table class="table table-bordered">
         	<caption align="top"><h4><b>
         		<c:if test="${num==0}">
         			글쓰기
         		</c:if>
         		<c:if test="${num>0}">
         			답글쓰기
         		</c:if>
         	</b></h4></caption>
         	<tr>
               <th style="width:100px; background-color: #ddd" >작성자</th>
               <td>
                  <input type="text" class="form-control" name="writer" required="required">
               </td>
            </tr>
            <tr>
               <th style="width:100px; background-color: #ddd" >제목</th>
               <td>
                  <input type="text" class="form-control" name="subject" value="${subject}" required="required">
               </td>
            </tr>
            
            <tr>
               <th style="width:100px; background-color: #ddd" >공유사진</th>
               <td>
                  <input type="file" class="form-control" name="upload" id="myfile">
               </td>
            </tr>
            
            <tr>
               <th style="width:100px; background-color: #ddd" >비밀번호</th>
               <td>
                  <input type="password" class="form-control" name="pass" required="required">
               </td>
            </tr>
            
            <tr>
            	<td colspan="2">
            		<textarea style="width: 100%; height: 130px;" name="content" required="required" 
            		class="form-control"></textarea>
            	</td>
            </tr>
            
            <tr>
               <td colspan="2" align="center">
                  <button type="submit" class="btn btn-outline-success">글저장</button>
                  <button type="button" class="btn btn-outline-success"
                  onclick="history.back()">취소</button>
               </td>
            </tr>
         
         </table>
      
      </form>
   </div>
   
   <script type="text/javascript">
      
      $("#myfile").change(function(){
         console.log("1:"+$(this)[0].files.length);
         console.log("2:"+$(this)[0].files[0]);
         //정규표현식
         var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
         var f=$(this)[0].files[0];//현재 선택한 파일
         
         if(!f.type.match(reg)){
            alert("확장자가 이미지파일이 아닙니다");
            return;
         }
         if($(this)[0].files[0]){
            var reader=new FileReader();
            
            reader.onload=function(e){
               $("#showimg").attr("src",e.target.result);
            }
            reader.readAsDataURL($(this)[0].files[0]);
            }
         });

   
   </script>

</body>
</html>









