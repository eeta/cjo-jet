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

<title>classboard vertical nav</title>

<style>
.class-category {
	margin-top: 136px;
	width: 170px;
	height: 190px;
	background-color: #FF9436;
	left: 80px;
	position: fixed;
	border-radius: 15px;
}

.class-ul {
	text-align: center;
	margin: 0;
	padding: 0;
	margin-top: 30px;
}

.class-ul li {
	list-style: none;
	margin: 30px;
	font-weight: bold;
}
</style>
</head>

<body>

	<div class="class-category">
		<div>
			<ul class="class-ul">
				<li>
					<%--<a onclick="classMain()">메인</a> --%> <a
					href="${pageContext.request.contextPath}/classboard/main_classboard_page.do">메인</a>
				</li>
				<li>
					<%-- <a onclick="myReservation()">나의 예약</a>--%> <a
					href="${pageContext.request.contextPath}/classboard/my_reservation_page.do">나의 예약</a>

				</li>
				<li>
					<%--<a onclick="myClass()">나의 클래스</a>--%> <a
					href="${pageContext.request.contextPath }/classboard/my_class_page.do">나의 클래스</a>

				</li>
			</ul>
		</div>
	</div>

<%-- 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
--%>
</body>
</html>