<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">

<title>knowhowboard_page</title>

	<style>
		textarea {
			width: 100%;
			height: 120px;
			padding: 10px;
			box-sizing: border-box;
			border: solid 3px #FFA500;
			border-radius: 5px;
			resize: none !important;
		}
		
		.heart {
			width: 60px;
			height: 60px;
		}
	</style>

</head>

<body>

	<jsp:include page="../commons/global_nav.jsp" />


	<br>
	<br>
	<br>
	<br>

	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col-10">    <!-- 중앙 -->
				<div class="row">
					<div class="col">
						${result.categoryVo.jet_board_knowhow_category_nam} >
					</div>
				</div>
				<div class="row mt-3">
					<div class="col">
						<h2>${result.knowhowBoardVo.jet_board_knowhow_title}</h2>
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col">
						${result.memberVo.jet_member_nick}
					</div>
				</div>
					
				<div class="row mt-2">
					<div class="col-3">
						<fmt:formatDate
							value="${result.knowhowBoardVo.jet_board_knowhow_writedate}"
							pattern="yyyy-MM-dd HH:ss" />
					</div>
					<div class="col-7">
						조회 ${result.knowhowBoardVo.jet_board_knowhow_readcount}
					</div>
					<div class="col-1">
						추천 ${countLike}
					</div>
					<div class="col-1">
						댓글 ${repleCount}
					</div>		
				</div>
	
				
				
				<div class="row mt-5">
					<div class="col">
						${result.knowhowBoardVo.jet_board_knowhow_content}
					</div>
				</div>
				
				<div class="row mt-5">
					<div class="col">
					
	          			<c:choose>
	          			
		          			<c:when test="${!empty sessionUser && isLiked == 0}">    <!-- 로그인을 하고 좋아요를 안 누른 경우 -->
								<form action="${pageContext.request.contextPath}/knowhowboard/insert_like_knowhowboard_process.do">
									<input class="heart mx-auto d-block" type="image" src="${pageContext.request.contextPath}/resources/image/heart_blank.png" alt="likeHeart">
									<input type="hidden" name="jet_board_knowhow_no" value="${result.knowhowBoardVo.jet_board_knowhow_no}">
								</form>
							</c:when>
							
							<c:when test="${!empty sessionUser && isLiked != 0}">    <!-- 로그인을 하고 좋아요를 누른 경우 -->
								<form action="${pageContext.request.contextPath}/knowhowboard/delete_like_knowhowboard_process.do">
									<input class="heart mx-auto d-block" type="image" src="${pageContext.request.contextPath}/resources/image/heart_full.png" alt="likeHeart">
									<input type="hidden" name="jet_board_knowhow_no" value="${result.knowhowBoardVo.jet_board_knowhow_no}">
								</form>
							</c:when>
							
							<c:otherwise>    <!-- 로그인 안 한 경우: 로그인이 필요하다 -->
							</c:otherwise>
							
						</c:choose>
					</div>
	        	</div>
	        	
	        	<div class="row">
	        		<div class="col">
						<p class="text-center">추천 ${countLike}</p>
					</div>
	        	</div>

				<!-- 이미지 출력. 이미지는 ArrayList기 때문에 출력을 위해 반복문 사용 -->
				<c:forEach items="${result.imageVoList}" var="imageVo">
					<div class="row">
						<div class="col">
							<img class="img-fluid"
								src="${imageVo.jet_board_knowhow_image_link}">
						</div>
					</div>
				</c:forEach>

				<div class="row mt-3">
					<div class="col">
						<a
							href="${pageContext.request.contextPath }/knowhowboard/knowhowboard_page.do">목록으로</a>

						<c:if
							test="${!empty sessionUser && sessionUser.jet_member_no == result.knowhowBoardVo.jet_member_no}">
							<a
								href="${pageContext.request.contextPath}/knowhowboard/delete_knowhowboard_process.do?jet_board_knowhow_no=${result.knowhowBoardVo.jet_board_knowhow_no}">삭제</a>
							<a
								href="${pageContext.request.contextPath}/knowhowboard/update_knowhowboard_page.do?jet_board_knowhow_no=${result.knowhowBoardVo.jet_board_knowhow_no}">수정</a>
						</c:if>

					</div>
					<div class="col">
						<p class="text-end">오른쪽. 글 신고 버튼</p>
					</div>
				</div>

				<!-- 댓글 보기 -->
				<!-- 댓글 개수 출력 -->
				<div class="row mt-3">
					<div class="col">댓글 ${repleCount}</div>
					<!-- AJAX 처리가 아니므로 새로고침해야 바뀜 -->
				</div>

				<!-- 댓글은 ArrayList. 출력을 위해 반복문 사용 -->
				<c:forEach items="${reple}" var="reple">

				
					<div class="row mt-3">
						<div class="col-1">사진</div>
						<div class="col">
							<div class="row">
								<div class="col">${reple.memberVo.jet_member_nick}</div>
							</div>
							<div class="row mt-1">
								<div class="col">${reple.repleVo.jet_board_knowhow_reple_cont}</div>
							</div>
							<div class="row mt-1">
								<div class="col-3">
									<fmt:formatDate
										value="${result.knowhowBoardVo.jet_board_knowhow_writedate}"
										pattern="yyyy-MM-dd HH:ss" />
								</div>
								<div class="col">답글쓰기</div>
								
								<c:if test="${!empty sessionUser && sessionUser.jet_member_no == reple.memberVo.jet_member_no}">
									<div class="col-2">
										수정
									</div>
									<div class="col-2">
									<%--
										<form action="${pageContext.request.contextPath}/knowhowboard/delete_reple_knowhowboard_process.do" method="post">
											<input type="submit" class="btn btn-outline-warning" value="삭제">
											<input type="hidden" name="jet_board_knowhow_no" value="${result.knowhowBoardVo.jet_board_knowhow_no}">
											<input type="hidden" name="jet_board_knowhow_reple_no" value="${reple.repleVo.jet_board_knowhow_reple_no}">
										</form>
									--%>
										<a href="${pageContext.request.contextPath}/knowhowboard/delete_reple_knowhowboard_process.do?jet_board_knowhow_no=${result.knowhowBoardVo.jet_board_knowhow_no}&jet_board_knowhow_reple_no=${reple.repleVo.jet_board_knowhow_reple_no}"  class="btn btn-outline-warning">삭제</a>
									</div>
								</c:if>
								
							</div>
						</div>
						<div class="col-1">
							<div class="row"></div>
							<div class="row"></div>
							<div class="row">
								<div class="col">신고</div>
							</div>
						</div>
					</div>
				

				</c:forEach>


				<!-- 댓글 쓰기 -->
				<form
					action="${pageContext.request.contextPath}/knowhowboard/write_reple_knowhowboard_process.do"
					method="get">
					<c:if test="${!empty sessionUser}">
						<div class="row mt-5">
							<div class="col-1">${sessionUser.jet_member_nick}</div>
							<div class="col">
								<textarea name="jet_board_knowhow_reple_cont" rows="3"
									cols="100" placeholder="댓글을 남겨보세요"></textarea>
							</div>

							<div class="col-1">
								<!-- 댓글 작성 버튼 -->
								<input type="hidden" name="jet_board_knowhow_no"
									value="${result.knowhowBoardVo.jet_board_knowhow_no}">
								<input class="form-control" type="submit" value="등록">
							</div>
						</div>
					</c:if>
				</form>
			</div>
			<div class="col"></div>
		</div>
	</div>

	<jsp:include page="../commons/global_footer.jsp" />

</body>
</html>