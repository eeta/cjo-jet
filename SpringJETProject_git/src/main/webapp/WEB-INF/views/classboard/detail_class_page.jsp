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

<title>원데이클래스 상세 페이지</title>


<style>
</style>


</head>
<body>

	<jsp:include page="../commons/global_nav.jsp" />

	<br>
	<br>
	<br>
	<br>
	<br>


	<div class="container">
		<div class="row">
			<div class="col-1"></div>
			<div class="col">   <!-- 중앙 -->

				<div class="row" style="background-color: #F5F5F5;">

					<div class="col-3">
						<img src="${result.imageVoList[0].jet_class_image_link}"
							class="d-block w-100" alt="basicImage">
					</div>

					<div class="col">
						<div class="row">
							<div class="col">
								<h3>[${result.categoryVo.jet_class_category_name}]
									${result.classboardVo.jet_class_name}</h3>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<h4>비용: ${result.classboardVo.jet_class_price} 원</h4>
							</div>
						</div>
						<div class="row">
							<div class="flexbox">
								<h4>모집하는 사람: ${result.memberVo.jet_member_name}</h4>

							</div>
						</div>
						<div class="row">
							<div class="col"></div>
						</div>
					</div>
				</div>

				<div class="row mt-4">
					<button type="button" class="btn btn-secondary btn-lg" disabled>예약
						가능 인원 /
						${result.classboardVo.jet_class_max_headcount}</button>
				</div>

				

				<div class="row mt-5">
					<div class="col">내용: ${result.classboardVo.jet_class_content}
					</div>
				</div>

				<c:forEach items="${result.imageVoList}" var="imageVo">
					<div class="row mt-5">
						<div class="col">
							<img src="${imageVo.jet_class_image_link}"
								class="rounded img-fluid mx-auto d-block" alt="classImage">
						</div>
					</div>
				</c:forEach>

			</div>
			<div class="col-1"></div>
		</div>
	</div>






	<jsp:include page="../commons/global_footer.jsp" />

</body>
</html>