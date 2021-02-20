<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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


<style>
h1 {
	text-align: center;
}

.center_cropped {
	width: 250px;
	height: 250px;
	overflow: hidden;
	margin: 10px;
	position: relative;
}

img {
	position: absolute;
	left: -1000%;
	right: -1000%;
	top: -1000%;
	bottom: -1000%;
	margin: auto;
	min-height: 100%;
	min-width: 100%;
}

.text {
	font-size: 20px;
	font: strong;
}

#title_col {
	font-weight: bold;
	font-size: 22px;
}

.reserve_date_col {
	color: #A9A9A9;
}
</style>

</head>

<body>

	<jsp:include page="../commons/global_nav.jsp" />
	<jsp:include page="../commons/classboard_vertical_nav.jsp" />

	<br>
	<br>
	<br>
	<br>



	<div class="container">
		<div class="row">
			
			<div class="col">
				<div class="row">
					<div class="col">
						<h1>나의 예약</h1>
					</div>
				</div>


				<c:forEach items="${resultList}" var="data">
					<div class="row mt-4" style="background-color: #F5F5F5;">



						<div class="row">
							<div class="col-4">
								<c:choose>
									<c:when test="${!empty data.imageVo}">

										<div class="center_cropped">
											<img src="${data.imageVo[0].jet_class_image_link}"
												class="img-thumbnail" alt="thumbnail">
										</div>

									</c:when>
									<c:otherwise>

										<div class="center_cropped">
											<img
												src="${pageContext.request.contextPath}/resources/image/logo.jpeg"
												class="img-thumbnail" alt="basic_image">
										</div>

									</c:otherwise>
								</c:choose>
							</div>

							<div class="text col">
								<div class="row mt-4">
									<div id="title_col">[${data.categoryVo.jet_class_category_name}]
										${data.classVo.jet_class_name}</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm"
											value="${data.detailVo.jet_class_detail_date}" />
									</div>
								</div>

								
								<div class="row mt-3">
									<div class="reserve_date_col">
										<fmt:formatDate pattern="yyyy-MM-dd"
											value="${data.reserveVo.jet_class_reservation_date}" />
										예약
									</div>

								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-1"></div>
		</div>
	</div>




</body>
</html>