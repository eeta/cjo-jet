<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팁과 노하우 게시판 글쓰기</title>
</head>
<body>

<jsp:include page="../commons/global_nav.jsp"/>

	
	<h1>팁과 노하우 게시판 글쓰기</h1>

	<form action="${pageContext.request.contextPath}/knowhowboard/write_knowhowboard_process.do" method="post" enctype="multipart/form-data">
		작성자: ${sessionUser.jet_member_nick}<br>
		제목: <input type="text" name="jet_board_knowhow_title"><br>
		내용: <textarea name="jet_board_knowhow_content" rows="10" cols="60"></textarea>
		<br>		
		이미지: <input type="file" name="files" accept="image/*" multiple>
		<input type="submit" value="글쓰기">
	</form>


<jsp:include page="../commons/global_footer.jsp"/>

</body>
</html>
			