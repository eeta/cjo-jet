<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<jsp:include page="../commons/global_nav.jsp"/>
	
	<main>
	<form action="${pageContext.request.contextPath}/board_Review/board_Review_Write_Process.do" method="post">
		<div class="container">
	            <div class="row mt-4 justify-content-center">
	                <div class="col-10  display-6">Review Write</div>
	            </div>
	            <div class="row mt-2">
	                <div class="col-11">
	                    <hr style="margin-left: 10%;">
	                </div>
	            </div>
	            <div class="row mt-2 justify-content-center">
	                <div class="col-8">
	                    <input name="jet_board_review_title" type="text" class="form-control" placeholder="제목을 입력해라">
	                </div>
	                <div class="col-1 text-center" style="border: 1px solid #D5D5D5; border-radius: 5px; line-height: 35px; margin-right: 10px;">
	                   	 ${sessionUser.jet_member_nick }
	                </div>
	                <div class="col-1 text-center" style="border: 1px solid #D5D5D5; border-radius: 5px; line-height: 35px; width:6%">
	                    	작성일
	                </div>
	            </div>
	            <div class="row mt-4 justify-content-center">
	                <div class="col-10 " style="background-color: #F6F6F6; border-radius: 5px; line-height: 15px; width: 81.5%;">
	                    <input type="image" src="${pageContext.request.contextPath}/resources/image/picture.PNG" alt="picture">
	                </div>
	            </div>
	            <div class="row justify-content-center">
	                <div class="col-10">
	                    <textarea name ="jet_board_review_content"class="form-control" id="exampleFormControlTextarea1" rows="20" placeholder="내용을 입력해라"></textarea>
	                </div>
	            </div>
	            <c:choose>
	            	<c:when test="${!empty sessionUser }">
			            <div class="row mt-1 justify-content-center">
			                <div class="col-9"></div>
			                <div class="col-1" >
			                    <input type="image" src="${pageContext.request.contextPath}/resources/image/save.PNG" alt="wirteButton">
			                </div>
			            </div>
			        </c:when>
			        <c:otherwise>
			        	<div class="row mt-1">
			        		<div class="col-10"></div>
			        	</div>
			        </c:otherwise>
	            </c:choose>
	     </div>
     </form>
     
     </main>

        
</body>
</html>