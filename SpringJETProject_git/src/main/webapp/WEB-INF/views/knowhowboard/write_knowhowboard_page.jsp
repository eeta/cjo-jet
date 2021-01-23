<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>knowhowboard_page</title>
</head>

<body>
	<jsp:include page="../commons/global_nav.jsp" />

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container">
		<div class="row">
			<div class="col-1"></div>
			<div class="col">
				<!-- 중앙 -->
				<!-- 입력 폼 -->
				<form
					action="${pageContext.request.contextPath}/knowhowboard/write_knowhowboard_process.do"
					method="post" enctype="multipart/form-data">
					<div class="row mt-3">
						<div class="col-2">
							<select class="form-select" name="jet_board_knowhow_category_no"
								aria-label="Default select example">
								<option selected>카테고리 선택</option>
								<option value="1">잡담</option>
								<option value="2">노하우</option>
								<option value="3">꿀팁</option>
							</select>
						</div>
						<div class="col">
							<input type="text" name="jet_board_knowhow_title"
								class="form-control" placeholder="제목">
						</div>
						<div class="col-2">${sessionUser.jet_member_nick}</div>
						<div class="col-2">작성일</div>
					</div>
					<div class="row mt-3">
						<!-- 이미지 -->
						<div class="col">
							<!-- <label for="formFile" class="form-label"></label> 
						<input class="form-control" type="file" id="formFile">-->
							<input type="file" name="files" accept="image/*" multiple
								class="form-control">
						</div>
					</div>

					<div class="row mt-3">
						<div class="col">
							<textarea name="jet_board_knowhow_content" rows="10" cols="5000"
								class="form-control" placeholder="내용"></textarea>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col">
							<input class="btn btn-primary btn-block" type="submit"
								value="글쓰기">
						</div>
					</div>
				</form>
				<!-- 입력 폼 -->

			</div>
			<div class="col-1"></div>
		</div>
	</div>

	<jsp:include page="../commons/global_footer.jsp" />

</body>
</html>