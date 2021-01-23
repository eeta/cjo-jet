<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

<title>팁과 노하우 게시판</title>
</head>
<body>

<jsp:include page="../commons/global_nav.jsp"/>


<br><br><br><br>

<div class="container">
	<div class="row">
		<div class="col-1"></div>
	<div class="col">    <!-- 중앙 -->
		<div class="row">
			<div class="col">
			
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
			</div>
	   	</div>
	    
	    
	    
	    
	    
	    
	    
			<div class="row">
			    <div class="col">
			        <h1 class="text-center">팁과 노하우 게시판</h1>
			    </div>
			</div>
	       
	       
			<!-- 검색 폼 -->
			<form action="${pageContext.request.contextPath}/knowhowboard/knowhowboard_page.do" method="get">
			<div class="row mt-3">
	           <div class="col-2">
	        		<select class="form-select" name="search_type" aria-label="Default select example">
						<option selected>검색</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="writer">작성자</option>
					</select>
	           </div>
	           <!-- 검색어 입력 칸 -->
	           <div class="col">
	               <input class="form-control" type="text" name="search_word">
	           </div>
	           <!-- 검색 버튼 -->
	           <div class="col-2">
	               <button type="submit" class="btn btn-primary btn-block">검색</button>
	           </div>
	       </div>
	       </form>
	       
	       
	       
	       <div class="row">
	           <div class="col mt-2">
	               <table class="table">
	                   <thead class="text-center">
	                     <tr>
	                       <th scope="col">번호</th>
	                       <th scope="col">카테고리 번호</th>
	                       <th scope="col">제목</th>
	                       <th scope="col">작성자</th>
	                       <th scope="col">등록일</th>
	                       <th scope="col">조회수</th>
	                       <th scope="col">추천</th>
	                     </tr>
	                   </thead>
	                   <tbody>
	                    
	
	                     <c:forEach items="${resultList}" var="data"> 
	                       <tr>
	                           <td>${data.knowhowBoardVo.jet_board_knowhow_no}</td>
	                           <td>${data.categoryVo.jet_board_knowhow_category_nam}</td>
	                           <td><a href="${pageContext.request.contextPath}/knowhowboard/read_knowhowboard_page.do?jet_board_knowhow_no=${data.knowhowBoardVo.jet_board_knowhow_no}">${data.knowhowBoardVo.jet_board_knowhow_title}</a> <span class="text-danger">[${data.countReple}]</span></td>
	                           <td>${data.memberVo.jet_member_nick}</td>
	                           <td>${data.knowhowBoardVo.jet_board_knowhow_writedate}</td>
	                           <td>${data.knowhowBoardVo.jet_board_knowhow_readcount}</td>
	                           <td>0</td>
	                       </tr>
	                   </c:forEach>
       
	                   </tbody>
	                 </table>
	           </div>
	       </div>
	       
	       	    
	    <!-- 글쓰기 버튼 -->
	    <c:choose>
		<c:when test="${!empty sessionUser}">
	    <div class="row mt-3">
	    	<div class="col">
	    		<a href="${pageContext.request.contextPath}/knowhowboard/write_knowhowboard_page.do" button type="button" class="btn btn-primary btn-block">글쓰기</a>
	    	</div>
	    </div>
	    </c:when>
		</c:choose>
	    
	    <!-- 페이지 -->
	    <div class="row">
	    	<div class="col">
	    		<!-- <nav aria-label="Page navigation"> -->
				  <ul class="pagination justify-content-center">
				    
				    <li class="page-item<c:if test="${currentPage == 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/knowhowboard/knowhowboard_page.do?page_num=1">&lt;&lt</a></li>
					<li class="page-item<c:if test="${beginPage <= 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/knowhowboard/knowhowboard_page.do?page_num=${beginPage-1}">&lt;</a></li>
					
						<c:forEach begin="${beginPage }" end="${endPage }" var="index">
						
							<li class="page-item<c:if test="${index == currentPage }"> active</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/knowhowboard/knowhowboard_page.do?page_num=${index }">${index}</a></li>
						
						</c:forEach>				      
					
					<li class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/knowhowboard/knowhowboard_page.do?page_num=${endPage+1 }">&gt;</a></li>
					<li class="page-item<c:if test="${currentPage == pageCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/knowhowboard/knowhowboard_page.do?page_num=${pageCount}">&gt;&gt</a></li>
				  
				  </ul>
	    		<!--  </nav> -->
	    	</div>
	    </div>
	    
	    
	    
	    <div class="col-1"></div>
	</div>
	

<jsp:include page="../commons/global_footer.jsp"/>

</body>
</html>