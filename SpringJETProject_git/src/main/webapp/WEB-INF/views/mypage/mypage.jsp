<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JET-my page</title>
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
			background:url('${pageContext.request.contextPath}/resources/image/arrow.png') 0 0 no-repeat;
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
		#upgrade{
			border:1px solid #FF9436; 
			outline:none; 
			background-color:#fff; 
			color:#FF9436; 
			border-radius:10px; 
			padding:5px;
		}
		#upgrade:hover{
			background-color:#FF9436;
			color:#fff; 
		}
</style>
<script type="text/javascript">
	function my_upgrade(){
		
			
			var xmlhttp = new XMLHttpRequest();
			
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					refreshUpgrade();
				}
					
			};
			xmlhttp.open("post","${pageContext.request.contextPath}/mypage/mypage_process.do");
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send("");
			
			
		}		
	//등업확인
	function upgradeView(){
		
		
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);
				
				if(obj.upgradeChk == true){
					var upgrade = document.getElementById("upgrade");
					upgrade.setAttribute("type","button");
					upgrade.setAttribute("class","btn btn-secondary btn-sm" );
					upgrade.setAttribute("value","대기중입니다.")
					upgrade.setAttribute("disabled","");
				}else{
					var upgrade = document.getElementById("upgrade");
					upgrade.setAttribute("type","button");
					upgrade.setAttribute("onclick","my_upgrade()");
					upgrade.setAttribute("value","등업신청");
					

				}

			}
			
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/mypage/upgrade_check_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("");
	}		
		
	function refreshUpgrade(){
		upgradeView();
	}
	
</script>
</head>
<body onload="upgradeView();" style="background-color:#FAFAFA">

	<jsp:include page="../commons/top_image.jsp"/>
		
<%--사이드바 시 작 --%>	
  	    <div style="margin-top:50px;position: absolute;">
        <div class="mypage_name"><h2>나의 정보 </h2></div>
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
	
		<div class="row" style="border-bottom:1px solid #D5D5D5;height:50px;background-color:#fff;margin-top:0px;">
			<div class="col-3"></div>
			<div class="col">
				<div class="row" style="padding:10px 0px;margin-left:30px;">
					<div class="col-1" style="width:110px;">
						<a href="#" style="text-decoration:none;color:#7DAB12;font-size:15px;font-weight:bold;">회원정보</a>
						<div class="row">
							<hr style="color:#7DAB12; height:3px; width:75%;margin-top:12px;">
						</div>
					</div>
					
				</div>
			</div>
			<div class="col-3"></div>
		</div>

        <div class="container" style="margin:65px 0 600px 295px;">
            <div class="row justify-content-center">
                <div class="col-8">
					<div class="row justify-content-center"style="height:250px;">
						<div class="col" style="border:1px solid #D5D5D5;margin-right:12px;width:300px;background-color:#fff;"> 
							<div class="row">
								<div class="col" style="margin:15px 0 0 15px">
									<div class="row">
										<div class="col">
											<h4>JET 프로필</h4>	
										</div>
									</div>
									<div class="row">
										<div class="col" style="margin-left:15px;">
											
											<c:choose>
												<c:when test="${!empty result.imageVoList  }">
													<img style="width: 100px;height: 100px;border-radius: 50px;" src="${result.imageVoList[0].jet_member_image_link }" alt="image">	
												</c:when>
												<c:otherwise>
													<img src="${pageContext.request.contextPath}/resources/image/profile_basic.PNG" alt="profile">	
												</c:otherwise>
											</c:choose>
											
										</div>
									</div>
									<div class="row mt-2"> 
										<div class="col" style="margin-left:15px">
											닉네임 : ${result.memberVo.jet_member_nick }
										</div>
									</div>								
								</div>
								<div class="col">
									<div class="row">
										<div class="col" style="margin:15px 0 0 15px;font-size:14px">
											등급 : ${result.memberVo.jet_member_grade }	
										</div>
									</div>
									<div class="row">
										<div class="col" style="margin:15px 0 0 15px;font-size:14px">
											이름 : ${result.memberVo.jet_member_name }
										</div>
									</div>
									<div class="row">
										<div class="col" style="margin:15px 0 0 15px;font-size:14px">
											성별 : ${result.memberVo.jet_member_sex }
										</div>
									</div>
									<div class="row">
										<div class="col" style="margin:15px 0 0 15px;font-size:14px">
											<a style="color:black;text-decoration:none;" href="${pageContext.request.contextPath}/mypage/write_mypage.do">내가 작성한 글 (${writeCT })</a>
										</div>
									</div>
									<div class="row">
										<div class="col" style="margin:15px 0 0 15px;font-size:14px">
											<a style="color:black;text-decoration:none;" href="${pageContext.request.contextPath}/mypage/write_reple_mypage.do">내가 작성한 댓글 (${repleCT })</a>
										</div>
									</div>	
									<div class="row">
										<div class="col" style="margin:15px 0 0 15px;font-size:14px">
											<c:choose>
												<c:when test="${writeCT >= 5 && repleCT >=15 }">
														<div onclick="upgradeView();">
															<input id="upgrade" onclick="my_upgrade()">
														</div>
													
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-secondary btn-sm" disabled>등업신청</button>
												</c:otherwise>
											</c:choose>
										</div>
									</div>																	
								</div>
							</div>
							

						</div>
						<div class="col" style="border:1px solid #D5D5D5;margin-left:12px;width:300px;background-color:#fff;"> 
							<div class="row">
								<div class="col" style="margin:15px 0 0 15px">
									<h4>연락처</h4>
								</div>
							</div>
							<div class="row">
								<div class="col" style="margin-left:15px;margin-top:5px;font-size:14px;">
									<div class="row">
										<div class="col-3">
											이메일
										</div>
										<div class="col-9">
											${result.memberVo.jet_member_id }
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col" style="margin-left:15px;margin-top:5px;font-size:14px;">
									<div class="row">
										<div class="col-3">
											KAKAO ID
										</div>
										<div class="col-9">
											${result.memberVo.jet_member_kakao }
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col" style="margin-left:15px;margin-top:5px;font-size:14px;">
									<div class="row">
										<div class="col-3">
											연락처
										</div>
										<div class="col-9">
											${result.memberVo.jet_member_phone }
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
                </div>
            </div>
        </div>
        

        

<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>		
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">        	
</body>
</html>