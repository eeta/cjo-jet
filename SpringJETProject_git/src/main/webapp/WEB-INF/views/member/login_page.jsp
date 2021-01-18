<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JET Login Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<style>
	#login_btn{
 		color: $yellow-300;
  		background-color: $indigo-900;
	}
</style>
</head>
<body>
	<jsp:include page="../commons/global_nav.jsp"/>
	<jsp:include page="../commons/top_blank.jsp"/>
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col-6">
				<div class="row">
					<div class="col border border-end-0 text-center">
						<div class="row">
							<img class="img-fluid" src="${pageContext.request.contextPath }/resources/image/login_image.jfif">
						</div>
					</div>
					<div class="col">
						<div class="row">
							<div class="col border">
								<div class="row mt-5"></div>
								<div class="row mt-1"></div>
								<div class="row mt-3">
									<div class="col d-grid gap-2">
										<p class="ms-2 fs-2">JET</p>
									</div>
								</div>
								<div class="row mt-4"></div>
								<form action="${pageContext.request.contextPath }/member/login_process.do" method="post">
									<div class="row mt-3">
										<div class="col d-grid gap-2">
											<input name="jet_member_id" type="text" placeholder="Email" class="text-muted border-top-0 border-start-0 border-end-0 border-bottom">
										</div>
									</div>
									<div class="row mt-2">
										<div class="col d-grid gap-2">
											<input name="jet_member_pw" type="password" placeholder="Password" class="text-muted border-top-0 border-start-0 border-end-0 border-bottom">
										</div>
									</div>
									<div class="row mt-5"></div>
									<div class="row mt-4">
										<div class="col d-grid gap-2">
											<input id="login_btn" type="submit" value="로그인" style="background-color: darkorange;" class="btn">
										</div>
									</div>
								</form>
								<div class="row mt-5"></div>
								<div class="row mt-5"></div>
								<div class="row mt-5"></div>
								<div class="row mt-5"></div>
								<div class="row mt-2">
									<div class="col">
										<a class="text-muted fw-light" href="${pageContext.request.contextPath }/member/join_member_page.do">회원가입</a>
									</div>
									<div class="col-3"></div>
									<div class="col-5">
										<a class="text-muted fw-light" href="#"><p class="text-end">ID/PW 찾기</p></a>
									</div>
								</div>
								<div class="row"></div>
							</div>	
						</div>
					</div>
				</div>
				<div class="row mt-5"></div>
			</div>
			<div class="col"></div>
		</div>
	</div>
	<jsp:include page="../commons/global_footer.jsp"/>
	<!-- 부트스트랩 js태그 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>