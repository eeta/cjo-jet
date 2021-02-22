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
	#mainbox{
		border: 1px solid rgba(0,0,0,.125);
   		border-radius: .25rem;
	}
</style>
<script type="text/javascript">

	var isConfirmReceiver = false;
	
	function checkReceiver(){
		
		isConfirmReceiver = false;
		
		var inputReceiver = document.getElementById("input_receiver");
		var jet_member_nick = inputReceiver.value;
		console.log("[test nick]"+jet_member_nick);
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				if(xmlhttp.responseText == 'agree'){
					isConfirmReceiver = true;
					var alertBox = document.createElement("div");
					alertBox.innerText = "존재하는 사용자 입니다.";
					alertBox.style.color = "green";
					
					var positionBox = document.getElementById("check_alert_box");
					positionBox.innerHTML = "";
					positionBox.appendChild(alertBox);
				}else if(xmlhttp.responseText == 'myNick'){
					isConfirmReceiver = false;
					var alertBox = document.createElement("div");
					alertBox.innerText = "자신에게 쪽지를 보낼 수 없습니다.";
					alertBox.style.color = "red";
					
					var positionBox = document.getElementById("check_alert_box");
					positionBox.innerHTML = "";
					positionBox.appendChild(alertBox);
				}else if(inputReceiver.value == ''){
					isConfirmReceiver = false;
					var alertBox = document.createElement("div");
					alertBox.innerText = "받을 사람을 입력해주세요."
					alertBox.style.color = "black";
					
					var positionBox = document.getElementById("check_alert_box");
					positionBox.innerHTML = "";
					positionBox.appendChild(alertBox);
				}else{
					isConfirmReceiver = false;
					var alertBox = document.createElement("div");
					alertBox.innerText = "존재하지 않는 사용자 입니다."
					alertBox.style.color = "red";
					
					var positionBox = document.getElementById("check_alert_box");
					positionBox.innerHTML = "";
					positionBox.appendChild(alertBox);
				}
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath}/message/exist_receiver.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_member_nick="+jet_member_nick);
		
	}
	
	function formSubmit(){
		
	 	if(isConfirmReceiver == false){ 
	 		alert("쪽지 받을 사람을 입력해주세요");
	 		return;
	 	}
		
		var frmWriteMessage = document.getElementById("frm_write_message");
		frmWriteMessage.submit();
	
	}

</script>
</head>
<body style="background-color:#f6f6f6";>

	<jsp:include page="../admin/admin_only_nav.jsp"/>

<div class="container-fluid">
	<div class="row">	
		<jsp:include page="../admin/admin_only_sidebar.jsp"/>
		
		<div id="mainbox" class="col mx-3 my-3" style="background-color:#ffff"; > <%--관리자 메인 페이지 --%>
			
			<div class="row mt-5">
				<div class="col">
					<h1 class="text-center">CS for ADMIN</h1>
				</div>
			</div>
			
			<div class="row">
				<div class="col"></div>
				<div class="col"></div>
				<div class="col-4 text-muted" style="text-align: right;">
					home > message > send message
				</div>
			</div>	
						
			<div class="row">
				<div class="col">
					<hr>
				</div>
			</div>
		
			<div class="row">	<%--탭 페이지  --%>
				<div class="col">
					<ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a class="nav-link active" aria-current="page" href="#">
					    	보낸 쪽지
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="${pageContext.request.contextPath }/admin/admin_csboard_before_page.do">
					    	
					    </a>
					  </li>
					</ul>
				</div>
			</div> 	<%--탭 페이지  --%>
			<div class="row mt-2"> <%--문의글 테이블 --%>
				<div class="col"></div>
				<div class="col-8">	
					<div class="row">	 <%--검색 row--%>
						<div class="col-8"></div>
						<div class="col">
						</div>
					</div><%--검색 row  끝--%>
					<%--본문 내용 --%>
					<div class="row">
						<div class="col-2 d-grid gap-2 input-group-text">작성자</div>
						<div class="col d-grid gap-2 form-control text-center">${result.memberVo.jet_member_nick }</div>
					</div>
					<div class="row mt-1"><%--현재는 임시로 받는 사람을 작성하도록 함. insert가 목표 --%>
						<div class="col-2 d-grid gap-2 input-group-text">받는 사람</div> 
						<div class="col d-grid gap-2 text-center form-control">
							${result.memberReceiverNick.jet_member_nick}
						</div>
					</div>
					<div class="row mt-2">
						<div class="col-2 d-grid gap-2 input-group-text">제목</div>
						<div class="col d-grid gap-2 form-control">
							${result.messageVo.jet_message_title }
						</div>
					</div>
					<div class="row mt-2">
						<div class="col d-grid gap-2 text-center input-group-text ps-0 pe-0">내용</div>
					</div>
					<div class="row mt-1">
						<div class="col d-grid gap-2 ps-0 pe-0">
							<textarea name="jet_message_content" rows="10" cols="70" class="form-control ps-0 pe-0" disabled>  ${result.messageVo.jet_message_content }</textarea>
						</div>
					</div>
					<div class="row mt-2">
						<div class="col d-grip gap-2"></div>
						<div class="col d-grip gap-2"></div>
						<div class="col-3 d-grip gap-2 text-end pe-0">
							<a class="btn btn-outline-dark" type="button" href="${pageContext.request.contextPath }/admin/admin_message_page.do">목록으로</a>
						</div>
					</div>
					<%--본문 내용 끝--%>
				</div> <%--문의글 테이블 col 끝--%>
				<div class="col"></div>
			</div> <%--문의글 테이블 row 끝--%>
		</div> 	 <%--관리자 메인 페이지 col끝--%>
	</div> <%--가장 큰 row박스 끝 --%> 
</div> <%--컨테이너 박스 끝 --%>


 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>

