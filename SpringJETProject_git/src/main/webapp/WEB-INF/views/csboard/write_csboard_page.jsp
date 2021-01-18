<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
     .topImage{
         width: 100%;
         height: 240px;
         margin-top: 6vh;
         background-image: url('${pageContext.request.contextPath }/resources/image/sky.jpg');
     }
</style>
</head>
<body>

	<jsp:include page="../commons/global_nav.jsp"/>
	      <div class="topImage"></div>

	<h1>글 쓰기</h1>
	
	<form action="${pageContext.request.contextPath }/csboard/write_csboard_process.do" method="post" enctype="multipart/form-data">
		작성자 : ${sessionUser.jet_member_nick } <br>
		제목 : 
		<input type="text" name="jet_board_m_cs_title"> <br>
		내용 : <br>
		<textarea rows="10" cols="60" name="jet_board_m_cs_content"></textarea> <br>
		이메일 : 
		<input type="text" name="jet_board_m_cs_customeremail"><br>
		이미지 : 
		<input type="file" name="files" id="formFileMultiple" accept="image/*" value="파일 업로드" multiple>
		<br>
		<input type="submit" value="글 쓰기">
	</form>

  <jsp:include page="../commons/global_footer.jsp"/>

</body>
</html>