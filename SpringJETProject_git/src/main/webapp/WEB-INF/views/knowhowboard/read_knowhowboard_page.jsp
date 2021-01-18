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


<jsp:include page="../commons/global_footer.jsp"/>

</body>
</html>			