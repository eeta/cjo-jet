<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>게시글 수정</h1>
	<form action="${pageContext.request.contextPath}/freeboard/update_free_board_process.do" method="post">
		작성자: ${result.memberVo.jet_member_nick }<br>
		제목 : <input type="text" name="jet_board_free_title" value=${result.freeboardVo.jet_board_free_title }><br>
		내용 : <br>
		<textarea name="jet_board_free_content" rows="10" cols="60">${result.freeboardVo.jet_board_free_content }</textarea>
		<input type="hidden" name="jet_board_free_no" value="${result.freeboardVo.jet_board_free_no }">
		<br>
		<input type="submit" value="수정">
	</form>

</body>
</html>