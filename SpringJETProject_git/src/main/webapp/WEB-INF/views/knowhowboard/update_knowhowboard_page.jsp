<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팁과 노하우 게시판 글 수정하기</title>
</head>
<body>

<jsp:include page="../commons/global_nav.jsp"/>


	<h1>팁과 노하우 게시판 글 수정하기</h1>
	
	<form action="${pageContext.request.contextPath}/knowhowboard/update_knowhowboard_process.do" method="post">
		작성자: ${result.memberVo.jet_member_nick}<br>
		제목: <input type="text" name="jet_board_knowhow_title" value="${result.knowhowBoardVo.jet_board_knowhow_title}"><br>
		내용: <textarea name="jet_board_knowhow_content" rows="10" cols="60">${result.knowhowBoardVo.jet_board_knowhow_content}</textarea>
		<input type="hidden" name="jet_board_knowhow_no" value="${result.knowhowBoardVo.jet_board_knowhow_no}"> <br>
		<input type="submit" value="수정하기">
	</form>


<jsp:include page="../commons/global_footer.jsp"/>

</body>
</html>