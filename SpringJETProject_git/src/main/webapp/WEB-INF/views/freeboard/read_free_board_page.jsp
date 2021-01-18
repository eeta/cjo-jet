<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>글 보기</h1>
	제목 : ${result.freeboardVo.jet_board_free_title }<br>
	작성자 : ${result.memberVo.jet_member_nick }<br>
	조회수  : ${result.freeboardVo.jet_board_free_readcount}<br>
	작성일 : ${result.freeboardVo.jet_board_free_writedate}<br>
	내용 : <br>
	${result.freeboardVo.jet_board_free_content }<br>
	
	<br>
	<a href="${pageContext.request.contextPath }/freeboard/main_free_board.do">목록으로</a>	
	
	<c:if test="${!empty sessionUser && sessionUser.jet_member_no == result.freeboardVo.jet_member_no }">
		<a href="${pageContext.request.contextPath}/freeboard/delete_free_board_process.do?jet_board_free_no=${result.freeboardVo.jet_board_free_no}">삭제</a>
		<a href="${pageContext.request.contextPath}/freeboard/update_free_board_page.do?jet_board_free_no=${result.freeboardVo.jet_board_free_no }">수정</a>
	</c:if>
	
	<br><br>
	<table border="1">
		<tr><td>댓글 번호</td><td>내용</td><td>작성자</td><td>작성일</td></tr>
		
		<c:forEach items="${comment }" var="data">
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		</c:forEach>
	</table>
	
	<textarea rows="5" cols="60"></textarea>
	
	<input type="submit" value="댓글쓰기">

</body>
</html>