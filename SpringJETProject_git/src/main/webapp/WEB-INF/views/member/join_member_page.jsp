<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<title>JET Join Member Page</title>
<!-- jquery용 스크립트 src -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	
	
	function formSubmit(){
		//유효성 검사 - 실질적으로 서버에서 insert, 그 이전에 데이터의 무결성을 확인
		//실질적으로는 MemberController에서 유효성 검사를 해야 함. 자바 스크립트는 유효성 검사가 쉽게 뚫릴 수 있음
		//서버입장에는 그냥 글자. 자바스크립트는 웹브라우저에서 실행
		//정규표현식은 너무 공부하지 말고 패턴에 맞게 인터넷에서 가져다 쓰면 됨. 언어별로 문법이 조금씩 다르기 때문
		
		//정규표현식 이메일
		var inputId = document.getElementById("input_id");
		//var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		//if(!regExp.test(inputId.value)/*inputId.value == ""*/){
//			alert("아이디는 이메일 형식이어야 합니다.");//나중에서 alert말고 부트스트랩으로 더 복잡하게 할 것
//			inputId.value = "";//정규표현식에 맞지 않으면 썼던게 사라짐
//			inputId.focus();
//			return;
//		}
		//정규표현식 비밀번호
		var inputPw = document.getElementById("input_pw");
//		var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/; // 비번 정규식 = 8 ~ 10자 영문, 숫자 조합
		
//		if(!regExp.test(inputPw.value)){
//			alert("비밀번호는 8~10자의 영문, 숫자 조합으로 입력해주세요.");
//			inputPw.value = "";//정규표현식에 맞지 않으면 썼던게 사라짐
//			inputPw.focus();
//			return;
//		}
		
		var inputPwConfirm = document.getElementById("input_pw_confirm");
		if(inputPw.value != inputPwConfirm.value){
			alert("비밀번호를 확인해주세요");
			inputPw.value = "";
			inputPwConfirm.value = "";
			inputPw.focus();
			return;
		}
		console.log("[test console]");
		//if(isConfirmId == false){
		//	console.log("[test console]");
		//	alert("이메일을 확인해주세요.");
		//	return;
		//}
		
		
		//submit
		var frmJoinMember = document.getElementById("frm_join_member");
		
		frmJoinMember.submit();
	}
	
	//아이디 확인
	var isConfirmId = false;
	
	function confirmId(){
		//바닐라 js
		var inputId = document.getElementById("input_id");
		var id = inputId.value;
		
		var xmlhttp = new XMLHttpRequest();
		
		isConfirmId = false;
					
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			
				if(xmlhttp.responseText == "true"){//아이디 중복 O
					//가입 불가능
					//js로 동적으로 태그를 생성하고 컨트롤, ajax가 들어가면 필연적으로 여기가 들어감
					
					var alertBox = document.createElement("div");
					alertBox.innerText = "사용 불가능한 아이디 입니다.";
					alertBox.style.color = "red";
					
					var positionBox = document.getElementById("confirm_alert_box");
					positionBox.innerHTML = "";//초기화
					positionBox.appendChild(alertBox);
					
				}else{//아이디 중복 X
					//가입 가능
					
					var alertBox = document.createElement("div");
					alertBox.innerText = "사용 가능한 아이디 입니다.";
					alertBox.style.color = "green";
					
					var positionBox = document.getElementById("confirm_alert_box");
					positionBox.innerHTML = "";//초기화
					positionBox.appendChild(alertBox);
				}
				
				/*if(xmlhttp.responseText == "(null)"){
					var alertBox = document.createElement("div");
					alertBox.innerText = "메일 주소를 입력해주세요";
					alertBox.style.color = "black";
					
					var positionBox = document.getElementById("confirm_alert_box");
					positionBox.innerHTML = "";
					positionBox.appendChild(alertBox);
				}*/
			}
		};
		/* get 방식
		xmlhttp.open("get","${pageContext.request.contextPath}/member/exist_id.do?id="+id);
		xmlhttp.send();
		*/
		//post방식, send안에 파라미터 값을 넣음, 헤더 세팅 필요(open다음)
		xmlhttp.open("post","${pageContext.request.contextPath}/member/exist_id.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("id="+id);
		
	}
	
</script>
</head>
<body>
	<jsp:include page="../commons/global_nav.jsp"/>
	<jsp:include page="../commons/top_blank.jsp"/>
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col-5">
				<div class="row border">
					<div class="col">
						<form id="frm_join_member" action="${pageContext.request.contextPath }/member/join_member_process.do" method="post">
							<div class="row pt-4">
								<div class="col"><h1>회원가입</h1></div>
							</div>
							<div class="row mt-5">
								<div class="col">
									<input onblur="confirmId()" id="input_id" name="jet_member_id" type="text" class="form-control" placeholder="E-mail">
								</div>
							</div>
							<div class="row mt-1">
								<div id="confirm_alert_box" class="col"></div>
							</div>
							<div class="row mt-3">
								<div class="col"><!-- 비밀번호-->
									<input id="input_pw" name="jet_member_pw" type="password" class="form-control" placeholder="Password">
								</div>
							</div>
							<div class="row mt-2">
								<div class="col"><!-- 비밀번호 확인-->
									<input id="input_pw_confirm" type="password" class="form-control" placeholder="Password Confirm">
								</div>
							</div>
							<div class="row mt-3">
								<div class="col"><!-- 이름 -->
									<input name="jet_member_name" type="text" class="form-control" placeholder="Name">
								</div>
							</div>
							<div class="row mt-2">
								<div class="col"><!-- 닉네임 -->
									<input name="jet_member_nick" type="text" class="form-control" placeholder="Nickname">
								</div>
							</div>
							<div class="row mt-3 text-center">
								<div class="col"><!-- 성별-->
									<label class="form-check-label" for="flexRadioDefault1">
										남(Male)
									</label>
									<input name="jet_member_sex" value="Male" class="form-check-input" type="radio" id="flexRadioDefault1" checked>
								</div>
								<div class="col">
									<label class="form-check-label" for="flexRadioDefault2">
										여(Female)
									</label>
									<input name="jet_member_sex" value="FeMale" class="form-check-input" type="radio" id="flexRadioDefault2">
								</div>
							</div>
							<div class="row mt-3">
								<div class="col"><!-- 전화번호 -->
									<input name="jet_member_phone" type="text" class="form-control" placeholder="PhoneNumber">
								</div>
							</div>
							<div class="row mt-2">
								<div class="col"><!-- 카카오 아이디 -->
									<input name="jet_member_kakao" type="text" class="form-control" placeholder="Kakao ID">
								</div>
							</div>
							<div class="row mt-3 text-center">
								<div class="col"><!-- 관심사 체크박스 --><!-- 여러 개가 선택되면 배열로 날아감 -->
									<div class="row">
										<div class="col">
											<label class="form-check-label" for="flexCheckDefault">
												관광지
												<input type="checkbox" name="jet_interest_name" value="attraction" class="form-check-input">
											</label>
										</div>
									
										<div class="col">
											<label class="form-check-label" for="flexCheckDefault">
												쇼핑
												<input type="checkbox" name="jet_interest_name" value="shopping"  class="form-check-input">
											</label>
										</div>
									
										<div class="col">
											<label class="form-check-label" for="flexCheckDefault">
												액티비티
												<input type="checkbox" name="jet_interest_name" value="activity"  class="form-check-input">
											</label>
										</div>
									
										<div class="col">
											<label class="form-check-label" for="flexCheckDefault">
												힐링
												<input type="checkbox" name="jet_interest_name" value="healing"  class="form-check-input">
											</label>
										</div>
									</div>
								</div>
							</div>
							<div class="row mt-2">
								<div class="col">
									<input name="jet_member_grade" type="hidden" value="0">
									<input name="jet_member_credit" type="hidden" value="0">
								</div>
							</div>
							<div class="row mt-4 pb-4">
								<div class="col d-grid gap-2">
									<input onclick="formSubmit()" type="button" class="btn btn-success" value="회원가입"> <!-- style="background-color: darkorange;" -->
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="row mt-5"></div>
			</div>
			<div class="col"></div>
		</div>
	</div>
	<jsp:include page="../commons/global_footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>	
</body>
</html>