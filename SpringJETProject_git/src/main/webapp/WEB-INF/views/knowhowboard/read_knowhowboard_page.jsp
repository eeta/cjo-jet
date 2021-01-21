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
</head>

<body>

<jsp:include page="../commons/global_nav.jsp"/>


<br><br><br><br><br><br>

<div class="container">
	<div class="row">
	    <div class="col"></div>
	    <div class="col-10">    <!-- 중앙 -->
	        <div class="row">
	            <div class="col-1">${result.memberVo.jet_member_nick}</div>
	            <div class="col-5">${result.knowhowBoardVo.jet_board_knowhow_title}</div>
	            <div class="col">${result.knowhowBoardVo.jet_board_knowhow_writedate}</div>
	            <div class="col-1">${result.knowhowBoardVo.jet_board_knowhow_readcount}</div>
	            <div class="col-1">추천</div>
	        </div>
	        <div class="row mt-3">
	            <div class="col">${result.knowhowBoardVo.jet_board_knowhow_content}</div>
	        </div>
	        <div class="row mt-3">
	            <div class="col">
	            	<p class="text-center">가운데. 좋아요 버튼</p>
	            </div>
	        </div>
	        
	        <!-- 이미지 출력. 이미지는 ArrayList기 때문에 출력을 위해 반복문 사용 -->
			<c:forEach items="${result.imageVoList}" var="imageVo">
			<div class="row">
				<div class="col">
					<img src="${imageVo.jet_board_knowhow_image_link}">
				</div>
			</div>
			</c:forEach>

	        <div class="row mt-3">
	        	<div class="col">
	        		<a href="${pageContext.request.contextPath }/knowhowboard/knowhowboard_page.do">목록으로</a>
	        		
	        		<c:if test="${!empty sessionUser && sessionUser.jet_member_no == result.knowhowBoardVo.jet_member_no}">
						<a href="${pageContext.request.contextPath}/knowhowboard/delete_knowhowboard_process.do?jet_board_knowhow_no=${result.knowhowBoardVo.jet_board_knowhow_no}">삭제</a>
						<a href="${pageContext.request.contextPath}/knowhowboard/update_knowhowboard_page.do?jet_board_knowhow_no=${result.knowhowBoardVo.jet_board_knowhow_no}">수정</a>
					</c:if>
	
	        	</div>
	            <div class="col">
	            	<p class="text-end">오른쪽. 글 신고 버튼</p>
	            </div>
	        </div>
	        
	        <!-- 댓글 보기 -->
			<!-- 댓글 개수 출력 -->
	        <div class="row mt-3">
	            <div class="col">댓글 ${repleCount}</div>    <!-- AJAX 처리가 아니므로 새로고침해야 바뀜 -->
	        </div>
	                            
			<!-- 댓글은 ArrayList. 출력을 위해 반복문 사용 -->
	        <c:forEach items="${reple}" var="reple">
	        <div class="row mt-3">
	            <div class="col">
	            	<p class="text-end">오른쪽. 댓글 신고</p> 
	            </div>
	        </div>
	        <div class="row mt-3">
	            <div class="col-2">${reple.memberVo.jet_member_nick}</div>
	            <div class="col">${reple.repleVo.jet_board_knowhow_reple_date}</div>
	        </div>
	        <div class="row mt-3">
	            <div class="col">${reple.repleVo.jet_board_knowhow_reple_cont}</div>
	            <div class="col-2">답글버튼</div>
	        </div>
	        </c:forEach>
	        
	        <!-- 댓글 쓰기 -->
			<form action="${pageContext.request.contextPath}/knowhowboard/write_reple_knowhowboard_process.do" method="get">
				<c:if test="${!empty sessionUser}">
					<div class="row">
						<div class="col-2">
							${sessionUser.jet_member_nick}
						</div>
					<div class="col">
						<textarea name="jet_board_knowhow_reple_cont" rows="3" cols="80" class="form-control" placeholder="댓글을 남겨보세요"></textarea>
					</div>
					<div class="col-2">
						<input type="hidden" name="jet_board_knowhow_no" value="${result.knowhowBoardVo.jet_board_knowhow_no}">
							<input type="submit" value="댓글 작성">
						</div>
					</div>
				</c:if>
			</form>
        </div>
        <div class="col"></div>
    </div>  
</div>

<jsp:include page="../commons/global_footer.jsp"/>

</body>
</html>