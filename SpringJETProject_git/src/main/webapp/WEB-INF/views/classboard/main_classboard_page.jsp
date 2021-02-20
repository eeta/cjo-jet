<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap CSS -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
   crossorigin="anonymous">

<title>Insert title here</title>

</head>

<body>

<jsp:include page="../commons/classboard_vertical_nav.jsp"/>

   <div class="container">
	   <div class="row">
		   <div class="col-1">여백</div>
		   <div class="col">

				<div class="row mt-2">
					<div class="col-5"></div>
					<div class="col-5"></div>
					<div class="col-2 text-muted" style="text-align: right;">home > oneday class board</div>
				</div>
				<div class="row mt-4">
					<div class="col text-center display-5">oneday class board</div>

				</div>
				<div class="row mt-4">
					<hr>
				</div>

				<div class="row mt-2">		
					<!-- 게시판 테이블 -->
					<div class="col">    
					<table class="table table-hover table-responsive">
						<thead class="text-center">
						
						<tr>
							<th scope="col" class="col-1">분류</th>
							<th scope="col" class="col-1">번호</th>
							<th scope="col">클래스</th>
							<th scope="col" class="col-1">신청현황</th>
							<th scope="col" class="col-2">작성자</th>
							<th scope="col" class="col-1">수강날짜</th>
							<th scope="col" class="col-1">등록일</th>
						</tr>
						</thead>
						<tbody>
							<c:forEach items="${resultList}" var="data">
							<tr>
								<th scope="row" class=" text-center">${data.classCategoryVo.jet_class_category_name}</th>
								<td class="text-center">${data.classDetailVo.jet_class_detail_no}</td>
								<td><a href="${pageContext.request.contextPath}/classboard/detail_class_page.do?jet_class_detail_no=${data.classDetailVo.jet_class_detail_no}">${data.classboardVo.jet_class_name}</a>
								</td>
								<td class="text-center">0 / ${data.classboardVo.jet_class_max_headcount}</td>
								<td class="text-center">${data.memberVo.jet_member_nick}</td>
								<td class="text-center"><fmt:formatDate pattern="MM-dd" value="${data.classDetailVo.jet_class_detail_date }"/></td>
								<td class="text-center"><fmt:formatDate pattern="MM-dd" value="${data.classboardVo.jet_class_writedate}"/></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>
				</div>
					
				<div class="row">
					<div class="col d-grid gap-2 d-md-flex justify-content-md-end">
					<c:if test="${!empty sessionUser }">
						<a class="btn btn-warning" href="${pageContext.request.contextPath}/classboard/open_class_page.do" role="button">원데이클래스 개설하기</a>
					</c:if>
					</div>
				</div>
			
			</div>
			<div class="col-1">여백</div>
		</div>
	</div>

<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>
</body>
</html>