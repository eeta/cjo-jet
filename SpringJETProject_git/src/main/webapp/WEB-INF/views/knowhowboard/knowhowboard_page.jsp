<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팁과 노하우 게시판</title>
</head>
<body>

<jsp:include page="../commons/global_nav.jsp"/>


	<h1>팁과 노하우 게시판</h1>
            
    <c:choose>
	<c:when test="${!empty sessionUser}">
		${sessionUser.jet_member_nick} 님 환영합니다.		
		<a href="${pageContext.request.contextPath}/member/logout_process.do">로그아웃</a>
	</c:when>
	
	<c:otherwise>
		비회원으로 접근했습니다.
		<a href="${pageContext.request.contextPath}/member/login_page.do">로그인 페이지로</a>
	</c:otherwise>
	</c:choose>
	
	<br>
	<br>
	
	<!-- 검색 -->
	<form action="${pageContext.request.contextPath}/knowhowboard/knowhowboard_page.do" method="get">
		<select name="search_type">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="writer">작성자</option>
		</select>
		<input type="text" name="search_word">
		<input type="submit" value="검색">
	</form>
	
	<br>
	<br>
	게시글 목록 출력<br>
	<br>
	
	<table border="1">
	<tr>
		<td>글번호</td>
		<td>제목</td>
		<td>조회수</td>
		<td>글쓴이</td>
		<td>작성일</td>
	</tr>
	<c:forEach items="${resultList}" var="data"> 
		<tr>
			<td>${data.knowhowBoardVo.jet_board_knowhow_no}</td>
			<td><a href="${pageContext.request.contextPath}/knowhowboard/read_knowhowboard_page.do?jet_board_knowhow_no=${data.knowhowBoardVo.jet_board_knowhow_no}">${data.knowhowBoardVo.jet_board_knowhow_title}</a></td>
			<td>${data.knowhowBoardVo.jet_board_knowhow_readcount}</td>
			<td>${data.memberVo.jet_member_nick}</td>
			<td>${data.knowhowBoardVo.jet_board_knowhow_writedate}</td>
		</tr>
	</c:forEach>
	</table>
	
	<br>

	<c:choose>
		<c:when test="${!empty sessionUser}">
			<a href="${pageContext.request.contextPath}/knowhowboard/write_knowhowboard_page.do">글쓰기</a>
		</c:when>
	</c:choose>


<jsp:include page="../commons/global_footer.jsp"/>

</body>
</html>