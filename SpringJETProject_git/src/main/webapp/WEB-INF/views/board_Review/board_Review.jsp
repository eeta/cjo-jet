<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../commons/global_nav.jsp"/>
	
	<div class="container">
                <main>
                    <div class="row mt-2">
                        <div class="col-5"></div>
                        <div class="col-5"></div>
                        <div class="col-2 text-muted" style="text-align: right;">home > travel review</div>
                    </div>
                    <div class="row mt-4">
                        <div class="col text-center display-5">Review Board</div>

                    </div>
                    <div class="row mt-4">
                        <hr>
                    </div>
                    <div class="row mt-4">
                        <table class="table table-hover table-responsive ">
                            <thead>
                              <tr>
                                <th scope="col" class="col-1 text-center">번호</th>
                                <th scope="col" class="col">제목</th>
                                <th scope="col" class="col-2 text-center">글쓴이</th>
                                <th scope="col" class="col-1 text-center">등록일</th>
                                <th scope="col" class="col-1 text-center">조회</th>
                                <th scope="col" class="col-1 text-center">추천</th>
                              </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${resultList }" var="data">
                            	<tr>
                                <th scope="row" class="text-center">${data.boardReviewVo.jet_board_review_no }</th>
                                <td><a href="${pageContext.request.contextPath }/board_Review/board_Review_View.do?board_Review_no=${data.boardReviewVo.jet_board_review_no}">${data.boardReviewVo.jet_board_review_title }</a></td>
                                <td class="text-center">${data.memberVo.jet_member_nick }</td>
                                <td class="text-center"><fmt:formatDate pattern="MM-dd" value="${data.boardReviewVo.jet_board_review_writedate }"/></td>
                                <td class="text-center">${data.boardReviewVo.jet_board_review_readcount }</td>
                                <td class="text-center">0</td>
                              </tr>
                            </c:forEach>


                            </tbody>
                          </table>
                    </div>
                    <c:choose>
                    	<c:when test="${!empty sessionUser }">
		                    <div class="row">
			                    <div class="col-11"></div>
			                    <div class="col-1" style="text-align: right; ">
			                        <button type="button" class="btn btn-link" onclick="location.href='${pageContext.request.contextPath}/board_Review/board_Review_Write.do'"><img src="${pageContext.request.contextPath}/resources/image/writeBtn.PNG" alt="wirteButton"></button>
			                    </div>
		                	</div>
	                	</c:when>
	                	<c:otherwise>
	                		<div class="row-2">
	                			
	                		</div>
	                	</c:otherwise>
                	</c:choose>
                    <div class="row">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center ">
                              <li class="page-item">
                                <a class="page-link  text-dark" href="#" aria-label="Previous">
                                  <span aria-hidden="true">&laquo;</span>
                                </a>
                              </li>
                              <li class="page-item"><a class="page-link  text-dark" href="#">1</a></li>
                              <li class="page-item"><a class="page-link  text-dark" href="#">2</a></li>
                              <li class="page-item"><a class="page-link  text-dark" href="#">3</a></li>
                              <li class="page-item">
                                <a class="page-link  text-dark" href="#" aria-label="Next">
                                  <span aria-hidden="true">&raquo;</span>
                                </a>
                              </li>
                            </ul>
                          </nav>
                          
                    </div>
                    
                </main>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>