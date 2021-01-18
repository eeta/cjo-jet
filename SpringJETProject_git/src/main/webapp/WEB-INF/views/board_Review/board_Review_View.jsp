<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<meta charset="UTF-8">
<title>리뷰 게시판</title>
</head>
<body>
	<jsp:include page="../commons/global_nav.jsp"/>
	
	<div class="container">
            <div class="row mt-4 justify-content-center">
                <div class="col-10  display-6">리뷰 게시판</div>
            </div>
            <div class="row mt-2">
                <div class="col-11">
                    <hr style="margin-left: 10%;">
                </div>
            </div>
            <div class="row mt-2 justify-content-center">
                <div class="col-1 text-center" style="border: 1px solid #D5D5D5; border-radius: 5px; line-height: 35px; margin-right: 5px;">
         		<fmt:formatDate pattern="MM.dd" value="${result.boardReviewVo.jet_board_review_writedate }"/>       	
                </div>
                <div class="col-7" style="border: 1px solid #D5D5D5; border-radius: 5px; line-height: 35px; margin-right: 5px;" >
				제목 : ${result.boardReviewVo.jet_board_review_title }
                </div>
                <div class="col-1 text-center" style="border: 1px solid #D5D5D5; border-radius: 5px; line-height: 35px; width: 7%; margin-right: 5px;">
				${result.boardReviewVo.jet_board_review_readcount }
                </div>
                <div class="col-1 text-center" style="border: 1px solid #D5D5D5; border-radius: 5px; line-height: 35px; width: 7%;">
				추천 : 0
                </div>
            </div>
            <div class="row mt-2 justify-content-center">
                <div class="col-8">
                </div>
                <div class="col-2 text-center" style="border: 1px solid #D5D5D5; width: 15%; border-radius: 5px;">
                ${result.memberVo.jet_member_nick }
                </div>
                
            </div>
            <div class="row mt-2 justify-content-center">
                <div class="col-10" style="border: 1px solid #D5D5D5; border-radius: 5px; line-height: 35px; width:82%;">
				${result.boardReviewVo.jet_board_review_content }
                </div>
            </div>

        </div>
</body>
</html>