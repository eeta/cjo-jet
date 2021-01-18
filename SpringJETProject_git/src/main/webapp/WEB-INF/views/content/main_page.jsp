<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
	<jsp:include page="../commons/global_nav.jsp"/>
	<div class="row">
			<img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/themountain(cut).jpg">
	</div>
	<section>
		<div class="container"><!-- section -->
			<div class="row">
				<div class="col"></div>
				<div class="col-10">
					<div class="row mt-5">
						<div class="col"><h1>여행을 공유하고 친구를 찾아보세요~!</h1></div>
					</div>
					<div class="row mt-5"><!-- Content || BoardName 왼쪽 사진 부분 -->
						<div class="col-4">
							<img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/Main_simple_content.jpg">
						</div>
						<div class="col">
							<div class="row ms-3"><!-- Content || BoardName 제목 및 글 부분 -->
								<div class="col d-grid gap-2">
									<a href="#"><h2>Content || BoardName</h2></a>
								</div>
							</div>
							<div class="row mt-4 ms-3">
								<div class="col">
									게시판에 있는 내용을 여기에 적으면 어떨까 싶어서 넣어봤습니다. 
									존댓말이 조금 더 글을 길게 쓸 수 있을 것 같아서 존댓말로 하도록 하겠습니다. 다 만들어 놓고 보니엠
									새로운 문장으로 넘어가기 위해 말도 안되는 드립을 쳤습니다. 어떻게든 길을 글게 쓰고 싶은 마음입니다.
									조금이라도 뭔가 있어 보이려구요.  
								</div>
							</div>
							<div class="row mt-4 ms-3"><!-- Content || BoardName More버튼 부분 -->
								<div class="col d-grid gap-2">
									<div class="btn btn-success">More</div>
								</div>
								<div class="col"></div><!-- more버튼 축소용  -->
								<div class="col"></div>
								<div class="col"></div>
								<div class="col"></div>
							</div>
						</div>
					</div>
					<div class="row mt-5">
						<div class="col"><h4>여행 친구 찾기 게시판의 인기글</h4></div>
					</div>
					<div class="row mt-2"><!-- 여행 친구 찾기 게시판 사진들 1 -->
						<div class="col">
							<img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/plan_smallpicture .jpg">
						</div>
						<div class="col">
							<img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/plan_smallpicture .jpg">
						</div>
						<div class="col">
							<img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/plan_smallpicture .jpg">
						</div>
					</div>
					<div class="row mt-3"><!-- 여행 친구 찾기 게시판 사진들 2 -->
						<div class="col">
							<img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/plan_smallpicture .jpg">
						</div>
						<div class="col">
							<img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/plan_smallpicture .jpg">
						</div>
						<div class="col">
							<img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/plan_smallpicture .jpg">
						</div>
					</div>
				</div>
				<div class="col"></div>
			</div>
		</div>
	</section>
	
	<jsp:include page="../commons/global_footer.jsp"/>
	
</body>
</html>