<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>

<style>
     .topImage{
         width: 100%;
         height: 240px;
         margin-top: 6vh;
         background-image: url('${pageContext.request.contextPath }/resources/image/sky.jpg');
     }
    #image_size_auto{
		max-width: 100%;
		height: auto;
  		display: block;
	}
</style>
</head>
<body>
	<jsp:include page="../commons/global_nav.jsp"/>
	      <div class="topImage"></div>

<h1>read_content_page</h1>

	제목 : ${result.csBoardVo.jet_board_m_cs_title } <br>
	작성자 :  ${result.memberVo.jet_member_nick} <br>
	조회수 : ${result.csBoardVo.jet_board_m_cs_readcount }<br> <!-- 리드카운트 cs빠졌다 ㅜㅜ -->
	작성일 : ${result.csBoardVo.jet_board_m_cs_writedate }<br>
	내용 : ${result.csBoardVo.jet_board_m_cs_content }<br>
	이메일 : ${result.csBoardVo.jet_board_m_cs_customeremail }<br>
	<br>
	
	<div class="row">
	<c:forEach items="${result.imageVoList }" var="imageVo">
		<img id="image_size_auto" src="${imageVo.jet_board_cs_image_link }"><br>
	</c:forEach>
	</div>
	
	<a href="${pageContext.request.contextPath }/csboard/csboard_page.do">목록으로</a>	
	
	<!-- 관리자 전용 답글 버튼 -->
	<c:if test="${sessionUser.jet_member_grade ==9 }">
		<a href="${pageContext.request.contextPath }/csboard/answer_write_csboard_page.do">답글</a>
	</c:if>
	
	<c:if test="${!empty sessionUser && sessionUser.jet_member_no ==result.csBoardVo.jet_member_no }">
		<a href="${pageContext.request.contextPath }/csboard/delete_csboard_process.do?jet_board_m_cs_no=${result.csBoardVo.jet_board_m_cs_no}">
		삭제</a>
		<a href="${pageContext.request.contextPath }/csboard/update_csboard_page.do?jet_board_m_cs_no=${result.csBoardVo.jet_board_m_cs_no}">
		수정</a>
	</c:if>
	<br>
	
	
	  <jsp:include page="../commons/global_footer.jsp"/>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	
</body>
</html>