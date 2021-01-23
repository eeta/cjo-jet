<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

<title>knowhowboard_page</title>


<style>
	textarea {
	  width: 100%;
	}
</style>

</head>

<body>
	<jsp:include page="../commons/global_nav.jsp"/>
	
	
	
	<br><br><br><br><br><br>
	
	<div class="container">
        <div class="row">
            <div class="col-1"></div>    <!-- 여백 -->
            <div class="col">    <!-- 중앙 -->
            
            <!-- 글 수정 폼 -->
            <form action="${pageContext.request.contextPath}/knowhowboard/update_knowhowboard_process.do" method="post">
                <div class="row mt-3">
                	<div class="col-2">
                		<select class="form-select" name="jet_board_knowhow_category_no" aria-label="Default select example">
						<option selected>${result.categoryVo.jet_board_knowhow_category_nam}</option>
						<option value="1">잡담</option>
						<option value="2">노하우</option>
						<option value="3">꿀팁</option>
					</select>
                	</div>
                    <div class="col"><input type="text" name="jet_board_knowhow_title" value="${result.knowhowBoardVo.jet_board_knowhow_title}" class="form-control" placeholder="제목"></div>
                    <div class="col-2">${sessionUser.jet_member_nick}</div>
                    <div class="col-2">작성일</div>
                </div>
                <div class="row mt-3">    <!-- 이미지 -->
                	<div class="col">
						  <!-- <label for="formFile" class="form-label"></label> -->
						  <input class="form-control" type="file" id="formFile">
                	</div>
                </div>
                <div class="row mt-3">    <!-- 내용 -->
                    <div class="col-10">
                        <textarea name="jet_board_knowhow_content" rows="10" class="form-control" placeholder="내용">${result.knowhowBoardVo.jet_board_knowhow_content}</textarea> 
                    </div> 
                </div>
                
                <div class="row mt-3">    <!-- 버튼 -->
                    <div class="col">
                    <input type="hidden" name="jet_board_knowhow_no" value="${result.knowhowBoardVo.jet_board_knowhow_no}">
                        <input type="submit" value="수정하기">
                    </div>
                </div>
            </form>
                
            </div>
            
            <div class="col-1"></div>    <!-- 여백 -->
        </div>
    </div>
     
<jsp:include page="../commons/global_footer.jsp"/>
        
</body>
</html>