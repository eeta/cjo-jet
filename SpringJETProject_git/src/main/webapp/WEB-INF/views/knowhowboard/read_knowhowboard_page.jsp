<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>knowhowboard_page</title>
</head>
<body>

<jsp:include page="../commons/global_nav.jsp"/>


	<h1>노하우 게시판 게시글 읽기</h1>
					
	제목: ${result.knowhowBoardVo.jet_board_knowhow_title } <br>
	작성자: ${result.memberVo.jet_member_nick} <br>
	조회수: ${result.knowhowBoardVo.jet_board_knowhow_readcount }<br>
	작성일: ${result.knowhowBoardVo.jet_board_knowhow_writedate }<br>
	내용: ${result.knowhowBoardVo.jet_board_knowhow_content }<br>
	<br>
	
	<a href="${pageContext.request.contextPath }/knowhowboard/knowhowboard_page.do">목록으로</a>	
	
	<c:if test="${!empty sessionUser && sessionUser.jet_member_no == result.knowhowBoardVo.jet_member_no}">
		<a href="${pageContext.request.contextPath}/knowhowboard/delete_knowhowboard_process.do?jet_board_knowhow_no=${result.knowhowBoardVo.jet_board_knowhow_no}">삭제</a>
		<a href="${pageContext.request.contextPath}/knowhowboard/update_knowhowboard_page.do?jet_board_knowhow_no=${result.knowhowBoardVo.jet_board_knowhow_no}">수정</a>
	</c:if>
	<br>
	
	<!-- 댓글 보기 -->
	<!-- 댓글은 ArrayList. 출력을 위해 반복문 사용 -->
	<c:forEach items="${reple}" var="reple">
		작성자: ${reple.memberVo.jet_member_nick} <br>
		작성일: ${reple.repleVo.jet_board_knowhow_reple_date} <br>
		내용: ${reple.repleVo.jet_board_knowhow_reple_cont} <br>
	</c:forEach>
	
	<br>
	
	<!-- 댓글 쓰기 -->
	<form action="${pageContext.request.contextPath}/knowhowboard/write_reple_knowhowboard_process.do" method="get">
		<c:if test="${!empty sessionUser}">
				작성자: ${sessionUser.jet_member_nick}<br>
				내용: <textarea name="jet_board_knowhow_reple_cont" rows="10" cols="60"></textarea>
				<input type="hidden" name="jet_board_knowhow_no" value="${result.knowhowBoardVo.jet_board_knowhow_no}">
				<br>
				<input type="submit" value="댓글 작성">
		</c:if>
	</form>


<jsp:include page="../commons/global_footer.jsp"/>

</body>
</html>			