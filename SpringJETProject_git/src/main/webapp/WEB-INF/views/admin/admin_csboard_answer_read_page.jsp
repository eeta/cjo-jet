<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<style>
	#mainbox{
		border: 1px solid rgba(0,0,0,.125);
   		border-radius: .25rem;
	}
</style>
</head>
<body style="background-color:#f6f6f6";>

	<jsp:include page="../admin/admin_only_nav.jsp"/>

<div class="container-fluid">
	<div class="row">	
		<jsp:include page="../admin/admin_only_sidebar.jsp"/>
		
		<div id="mainbox" class="col mx-3 my-3" style="background-color:#ffff"; > <%--관리자 메인 페이지 --%>
			
			<div class="row mt-5">
				<div class="col">
					<h1 class="text-center">문의에 대한 답변 읽기</h1>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<hr>
				</div>
			</div>
			
			<div class="row">
				<div class="col-2"></div>
				<div class="col"><%--글보기 내용의 가운데메인 --%>
					<div class="row mt-2">
						<div class="col-2">제목</div>
						<div class="col">${result.csBoardAnswerVo.jet_board_a_cs_title } </div>
					</div>
					<div class="row mt-2">
						<div class="col-2">작성자</div>
						<div class="col">  ${result.memberVo.jet_member_nick}</div>
					</div>
					<div class="row mt-2">
						<div class="col-2">조회수</div>
						<div class="col"> ${result.csBoardAnswerVo.jet_board_a_readcount }</div>
					</div>
					<div class="row mt-2">
						<div class="col-2">작성일</div>
						<div class="col">${result.csBoardAnswerVo.jet_board_a_cs_writedate }</div>
					</div>
					<div class="row mt-2">
						<div class="col-2">내용</div>
						<div class="col border border-1 overflow-auto" style="height: 200px;"">${result.csBoardAnswerVo.jet_board_a_cs_content }</div>
					</div>
				</div>
				<div class="col-2"></div>
			</div>
			

			<div class="row mt-4"> <%--버튼 박스.. --%>
				<div class="col"></div>	
				<div class="col"></div>
				<div class="col-1">
					<a class="btn btn-outline-secondary" href="${pageContext.request.contextPath }/admin/admin_csboard_page.do">목록</a>	
				</div>
				<div class="col-1 ">
						<c:if test="${!empty sessionUser && sessionUser.jet_member_no ==result.csBoardAnswerVo.jet_member_no  }">
							<a class="btn btn-danger" href="${pageContext.request.contextPath }/admin/admin_csboard_answer_delete_process.do?jet_board_a_cs_no=${result.csBoardAnswerVo.jet_board_a_cs_no}">삭제</a>
						</c:if>
				</div>
				<div class="col"></div>	
				<div class="col"></div>
			</div>
			
			<div class="row">
				<div class="col">
					<hr>
				</div>
			</div>
		
		</div> 	 <%--관리자 메인 페이지 col끝--%>
	</div> <%--가장 큰 row박스 끝 --%> 
</div> <%--컨테이너 박스 끝 --%>



<%--
<div class="col">
	제목 : ${result.csBoardAnswerVo.jet_board_a_cs_title } <br>
	작성자 :  ${result.memberVo.jet_member_nick} <br>
	조회수 : ${result.csBoardAnswerVo.jet_board_a_readcount }<br>
	작성일 : ${result.csBoardAnswerVo.jet_board_a_cs_writedate }<br>
	내용 : ${result.csBoardAnswerVo.jet_board_a_cs_content }<br>
</div>
 --%>

 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>