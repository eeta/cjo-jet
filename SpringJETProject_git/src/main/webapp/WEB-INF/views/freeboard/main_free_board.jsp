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
     .topImage{
         width: 100%;
         height: 240px;
         margin-top: 6vh;
     }
</style>
</head>
<body>
<jsp:include page="../commons/global_nav.jsp"/>
<div class="topImage"></div>
	<div class="container">
	    <main>
	        <div class="row mt-2">
	            <div class="col-5"></div>
	            <div class="col-5"></div>
	            <div class="col-2 text-muted" style="text-align: right;">home > board</div>
	        </div>
	        <div class="row mt-4">
	            <div class="col text-center display-5">자유 게시판</div>
	        </div>
	        <div class="row mt-4">
	            <hr> 				<!-- 선 -->
	        </div>
	        <form action="${pageContext.request.contextPath }/csboard/csboard_page.do" method="get">
				<select  name="search_type">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">작성자</option>
					<option>=======</option>
				</select>	
				<input name="search_word" type="text">
				<input type="submit" value="검색" >
			</form>
			 <div class="row mt-4">
	            <table class="table table-hover table-responsive ">
	                <thead>
	                  <tr>
	                    <th scope="col" class="col-1 text-center">번호</th>
	                    <th scope="col" class="col">제목</td>
	                    <th scope="col" class="col-2 text-center">글쓴이</td>
	                    <th scope="col" class="col-1 text-center">조회</td>
	                    <th scope="col" class="col-1 text-center">등록일</td>
	                   </tr>
	                </thead>
	                <tbody>    
						<c:forEach items="${resultList }" var="data">
							<tr>
								<td>${data.freeboardVo.jet_board_free_no }</td>
								<td><a href="${pageContext.request.contextPath }/freeboard/read_free_board_page.do?jet_board_free_no=${data.freeboardVo.jet_board_free_no}">${data.freeboardVo.jet_board_free_title }</a></td>
								<td>${data.freeboardVo.jet_board_free_readcount }</td>
								<td>${data.memberVo.jet_member_nick }</td>
								<td>${data.freeboardVo.jet_board_free_writedate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
				<c:if test="${!empty sessionUser }">
					<a href="${pageContext.request.contextPath }/freeboard/write_free_board_page.do">글쓰기</a>
				</c:if>
				<div class="col">	 	
				<!-- <nav aria-label="Page navigation"> -->
				  <ul class="pagination justify-content-center">
				    
				    <li class="page-item<c:if test="${currentPage == 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/csboard/csboard_page.do?page_num=1">&lt;&lt</a></li>
					<li class="page-item<c:if test="${beginPage <= 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/csboard/csboard_page.do?page_num=${beginPage-1}">&lt;</a></li>
					
						<c:forEach begin="${beginPage }" end="${endPage }" var="index">
						
							<li class="page-item<c:if test="${index == currentPage }"> active</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/csboard/csboard_page.do?page_num=${index }">${index}</a></li>
						
						</c:forEach>				      
					
					<li class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/csboard/csboard_page.do?page_num=${endPage+1 }">&gt;</a></li>
					<li class="page-item<c:if test="${currentPage == pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/csboard/csboard_page.do?page_num=${pageCount}">&gt;&gt</a></li>
				  
				  </ul>
				<!--  </nav> -->
			</div>
			
	     	
	        
	        <div class="row mt-4">
	            <hr>	<!-- 선 -->
	        </div>
	    </main>
	  
	    <jsp:include page="../commons/global_footer.jsp"/>

	</div>
</body>
</html>