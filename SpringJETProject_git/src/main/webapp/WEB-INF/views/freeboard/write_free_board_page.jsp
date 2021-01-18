<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>글쓰기</h1>

<form action="${pageContext.request.contextPath}/freeboard/write_free_board_process.do" method="post">
	작성자 : ${sessionUser.jet_member_nick }<br>
	제목 : <input type="text" name="jet_board_free_title"><br>
	내용 : <br>
	<textarea name="jet_board_free_content" rows="10" cols="60"></textarea>
	<br>
	<input type="submit" value="글 쓰기">
</form>


</body>
</html>