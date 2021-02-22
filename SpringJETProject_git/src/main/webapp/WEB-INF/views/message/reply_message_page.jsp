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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<jsp:include page="../commons/style/global_nav_style.jsp"/>
<jsp:include page="../commons/script/global_nav_script.jsp"/>
<style>
        .mypage_name{
           width: 260px;
           margin-top: 50px;
           margin-left: 100px;
           text-align: center;
        }

		.filebox label {
		    display: inline-block;
		    padding: 7px 15px;
		    color: #000;
		    font-size: 14px;
		    font-weight:bold;
		    line-height: normal;
		    vertical-align: middle;
		    background-color: #fdfdfd;
		    cursor: pointer;
		    border: 1px solid #ebebeb;
		    border-bottom-color: #e2e2e2;
		    border-radius: 5px;
		  }        
        
        .filebox input[type="file"] {  /* 파일 필드 숨기기 */
		    position: absolute;
		    width: 1px;
		    height: 1px;
		    padding: 0;
		    margin: -1px;
		    overflow: hidden;
		    clip:rect(0,0,0,0);
		    border: 0;
		}
		
		/*적용버튼*/
		#member_update{
			border:1px solid #FFCD12; 
			background-color:#FFF;
			padding:5px 15px;
			border-radius:10px;
		}
		#member_update:hover{
			color:#fff;
			background-color:#FF9436;
		}
		#member_update_cancle{
			border:1px solid #FFCD12; 
			background-color:#FFF;
			padding:5px 15px;
			border-radius:10px;
		}
		#member_update_cancle:hover{
			color:#fff;
			background-color:#FFCD12;
		}
		/*아코디언*/
		.accordion {
			width:260px;
			margin-top: 50px;
            margin-left: 100px;            
        }
		input[id*="answer"] {
			position:absolute;
			display:none;
		}
		input[id*="answer"] + label {
			display:block;
			padding:20px;
			border-bottom:0;
			color:#000;
			font-weight:900;
			background:#FF9436;
			cursor:pointer;
			position:relative;
			
		}
		input[id*="answer"] + label:hover {
			background:#FFB456;
		}
		input[id*="answer"] + label em {
			position:absolute;
			top:50%;
			right:10px;
			width:30px;
			height:30px;
			margin-top:-15px;
			display:inline-block;
			background:url('${pageContext.request.contextPath}/resources/image/arrow_1.png') 0 0 no-repeat;
		}
		input[id*="answer"] + label + div {
			max-height:0;
			transition: all .35s;
			overflow:hidden;
			background:#fff;
			font-size:11px;
		}
		input[id*="answer"] + label + div a {
			display:inline-block;
			padding:20px;
		}
		input[id*="answer"]:checked + label + div {
			max-height:125px;
		}
		input[id*="answer"]:checked + label em {
			background-position:0 -30px;
		}
		.accordion a{
            color: #000;
            text-decoration: none;
            font-weight: bold;
            letter-spacing: 3px; 
            position: relative;
            padding: 0px;
        }
	
		
		.accordion li a{
            color: #000;
            text-decoration: none;

            font-weight: bold;
            letter-spacing: 3px; 
            position: relative;
            padding: 0px;
        }
		
		.accordion li a::after{
			content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 0;
            height: 2px;
            background:  #ABF200;
            transition: all .1s ease-out;
            
		}
		.accordion li a:hover::after{
            width: 100%;
        }

</style>

<script type="text/javascript">

		function formSubmit(){
			
			var titleBox = document.getElementById("titleBox");
			var taBox = document.getElementById("taBox");
			
			if(titleBox.value == "Re: "+"" || titleBox.value.trim() == ""){
		 		var bottomCol = document.getElementById("bottom_col");
		 		var alertBox = document.createElement("div");
		 		alertBox.setAttribute("class","text-center");
		 		alertBox.setAttribute("style","color : red;");
		 		alertBox.innerText = "쪽지 제목을 입력해주세요.";
		 		bottomCol.append(alertBox);
		 		
		 		setTimeout(function(){
		 			bottomCol.innerHTML = "";
		 		},1000);
		 		return;
		 	}
		 	
		 	if(taBox.value == "" || taBox.value.trim() == ""){
		 		var bottomCol = document.getElementById("bottom_col");
		 		var alertBox = document.createElement("div");
		 		alertBox.setAttribute("class","text-center");
		 		alertBox.setAttribute("style","color : red;");
		 		alertBox.innerText = "쪽지 내용을 입력해주세요.";
		 		bottomCol.appendChild(alertBox);
		 		
		 		setTimeout(function(){
		 			bottomCol.innerHTML = "";
		 		},1000);
		 		return;
		 	}
			
			
			var frmReplyMessage = document.getElementById("frm_reply_message");
			frmReplyMessage.submit();
		}
</script>
</head>
<body style="background-color:#FAFAFA">

	<jsp:include page="../commons/top_image.jsp"/>
 <%--사이드바 시 작 --%>	
  	    <div style="margin-top:50px;position: absolute;">
        <div class="mypage_name"><h2>reply Page</h2></div>
		<div class="accordion">
			<input type="radio" name="accordion" id="answer00">
			<label for="answer01" style="border-bottom:1px solid #FFE08C;border-radius: 15px 15px 0 0;" ><a href="${pageContext.request.contextPath}/mypage/mypage.do">마이페이지</a></label>
		
			<input type="radio" name="accordion" id="answer01">
			<label for="answer00" style="border-bottom:1px solid #FFE08C;" ><a href="${pageContext.request.contextPath}/mypage/update_mypage.do">정보수정</a></label>
		
			<input type="radio" name="accordion" id="answer02">
			<label for="answer01" style="border-bottom:1px solid #FFE08C;" ><a href="${pageContext.request.contextPath }/travelplan/travelplan_board_page.do">나의 여행 계획</a></label>
			
			
			<input type="radio" name="accordion" id="answer03">
			<label for="answer02" style="border-bottom:1px solid #FFE08C;" ><a href="${pageContext.request.contextPath }/mypage/pick_mypage.do" >즐겨찾기 목록</a></label>
			
			
			<input type="radio" name="accordion" id="answer04">
			<label for="answer04" style="border-bottom:1px solid #FFE08C;" >내가 쓴 글<em></em></label>
			<div style="background-color:#FFB456">
				<ul >
					<li><a href="${pageContext.request.contextPath}/mypage/write_mypage.do" style="font-size: 14px;" >내가 쓴 글</a></li>
					<li><a href="${pageContext.request.contextPath}/mypage/wrote_reple_mypage.do" style="font-size: 14px;">내가 쓴 댓글</a></li>
				</ul>
			</div>
			
			<input type="radio" name="accordion" id="answer05">
			<label for="answer05" style="border-bottom:1px solid #FFE08C;" >원데이클래스<em></em></label>
			<div style="background-color:#FFB456">
				<ul>
					<li><a href="#" style="font-size: 14px;">모집중</a></li>
					<li><a href="#" style="font-size: 14px;">참가중</a></li>
				</ul>
			</div>
			
			<input type="radio" name="accordion" id="answer06">
			<label for="answer06" style="border-bottom:1px solid #FFE08C;" >여행 친구 찾기<em></em></label>
			<div style="background-color:#FFB456">
				<ul>
					<li><a href="${pageContext.request.contextPath}/mypage/recruitment_mypage.do">내가 개설한 파티</a></li>
					<li><a href="${pageContext.request.contextPath}/mypage/attend_mypage.do">내가 참가중인 파티</a></li>
				</ul>
			</div>
			<input type="radio" name="accordion" id="answer07">
			<label for="answer07" style="border-bottom:1px solid #FFE08C;" ><a href="${pageContext.request.contextPath}/message/message_page.do">쪽지함</a></label>
			<input type="radio" name="accordion" id="answer08">
			<label for="answer08" style="border-radius: 0 0 15px 15px;" ><a href="${pageContext.request.contextPath}/member/my_friendList_page.do">나의 친구 목록</a></label>
			
			
		</div>
        </div>	
<%--사이드바 끝 --%>
        <div class="container" style="margin:65px 0 500px 295px;">
            <div class="row justify-content-center">
                <div class="col-10">
					<div class="row justify-content-center"style="height:250px;">
						<div class="col"></div>
						<div class="col-8">
							<div class="row mt-2">
					            <div class="col-4"></div>
					            <div class="col-4"></div>
					            <div class="col text-end" >home > message</div>
					        </div>
					        <div class="row mt-2">
								<div class="col">
									<h4>쪽지 답장</h4>
								</div>
							</div>
					        <div class="row">
					        	<div class="col">
					        		<hr>
					        	</div>
					        </div>
							<form id="frm_reply_message" action="${pageContext.request.contextPath }/message/reply_message_process.do" method="post">
								<div class="row">
									<div class="col-2 d-grid gap-2 input-group-text">작성자</div>
									<div class="col d-grid gap-2 form-control text-center">${sessionUser.jet_member_nick }</div>
								</div>
								<div class="row mt-1"><%--현재는 임시로 받는 사람을 작성하도록 함. insert가 목표 --%>
									<div class="col-2 d-grid gap-2 input-group-text">받는 사람</div> 
									<div class="col d-grid gap-2 form-control">
										<input class="col text-center" type="text" value="${result.memberSenderNick.jet_member_nick }" disabled>
										<input type="hidden" name="jet_member_receiver" value="${result.messageVo.jet_member_sender }">
										<input type="hidden" name="jet_message_no" value="${result.messageVo.jet_message_no }">
									</div>
								</div>
								<div class="row mt-2">
									<div class="col-2 d-grid gap-2 input-group-text">제목</div>
									<div class="col d-grid gap-2 form-control">
										<input id="titleBox" name="jet_message_title" type="text" value="Re: ">
									</div>
								</div>
								<div class="row mt-2">
									<div class="col d-grid gap-2 text-center input-group-text ps-0 pe-0">내용</div>
								</div>
								<div class="row mt-1">
									<div class="col d-grid gap-2 ps-0 pe-0">
										<textarea id="taBox" name="jet_message_content" rows="10" cols="60" class="form-control ps-0 pe-0" aria-label="내용"></textarea>	
									</div>
								</div>
								<div class="row mt-2">
									<div id="bottom_col" class="col d-grip gap-2"></div>
									<div class="col-6 d-grip gap-2 text-end pe-0">
										<a class="btn btn-outline-success" type="button" href="${pageContext.request.contextPath }/message/message_page.do">목록으로</a>
										<input onclick="formSubmit()" class="btn btn-success" type="button" value="쪽지 보내기">
									</div>
								</div>
							</form>	
						</div>
						<div class="col"></div>
                </div>
                
            </div>
        </div>
     </div>
        <div style="margin-top:-315px">
        <div class="mypage_name"><h2>쪽지함</h2></div>
		<div class="accordion">
			<input type="radio" name="accordion" id="answer01">
			<label for="answer01" style="border-bottom:1px solid #FFE08C;background-color:#F7F3E6;"><a href="${pageContext.request.contextPath}/mypage/mypage.do">마이페이지</a></label>
		
			<input type="radio" name="accordion" id="answer00">
			<label for="answer00" style="border-bottom:1px solid #FFE08C;"><a href="${pageContext.request.contextPath}/mypage/update_mypage.do">정보수정</a></label>
		
			<input type="radio" name="accordion" id="answer01">
			<label for="answer01" style="border-bottom:1px solid #FFE08C;"><a href="${pageContext.request.contextPath }/travelplan/travelplan_board_page.do">나의 여행 계획</a></label>
			
			
			<input type="radio" name="accordion" id="answer02">
			<label for="answer02" style="border-bottom:1px solid #FFE08C;"><a href="${pageContext.request.contextPath }/mypage/like_mypage.do">좋아한 글</a></label>
			
			
			<input type="radio" name="accordion" id="answer03">
			<label for="answer03" style="border-bottom:1px solid #FFE08C;">내가 쓴 글<em></em></label>
			<div>
				<ul>
					<li><a href="${pageContext.request.contextPath}/mypage/write_mypage.do" style="font-size: 14px;">내가 쓴 글</a></li>
					<li><a href="${pageContext.request.contextPath}/mypage/wrote_reple_mypage.do" style="font-size: 14px;">내가 쓴 댓글</a></li>
				</ul>
			</div>

			<input type="radio" name="accordion" id="answer04">
			<label for="answer04" style="border-bottom:1px solid #FFE08C;"><a href="${pageContext.request.contextPath }/message/message_page.do">쪽지함</a></label>
			
			<input type="radio" name="accordion" id="answer05">
			<label for="answer05" style="border-bottom:1px solid #FFE08C;"><a href="${pageContext.request.contextPath }/member/my_friendList_page.do">나의 친구</a></label>
		</div>
        </div>
        

<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>		
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"/>        	
</body>
</html>