<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<style>
		#footer_ul{
			text-align:center;
		}
		#footer_ul li{
			display : inline; /* 세로나열을 가로나열로 변경 */ 
			<%--border-left:1px solid #999; /* 각 메뉴의 왼쪽에 "|" 표시(분류 표시)--%> 
			font:bold 12px Dotum; /* 폰트 설정 - 12px의 돋움체 굵은 글씨로 표시 */
			padding:0 10px;
		}

	</style>
	<footer>
		<div class="container">
			<div class="row mt-5">
				<div class="col">
					<div class="row"><!-- 선 이미지 자리 -->
						<div class="col">
							<img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/long_line.jpg">
						</div>
					</div>
					<div class="row"><!-- 이용약관 등의 정보 ul li -->
						<div class="col-2"></div>
						<div class="col">
							<ul id="footer_ul">
								<li>이용약관</li>
								<li>개인정보 처리방침</li>
								<li>운영정책</li>
								<li>고객센터</li>
								<li>공지사항</li>
							</ul>
						</div>
						<div class="col-2"></div>
					</div>
					<div class="row"><!-- 맨 마지막 줄 -->
						<div class="col"><ul id="footer_ul"><li>Copyright ⓒ JET Project. All rights reserved.</li></ul></div>
					</div>
				</div>
			</div>
		</div>
	</footer>