<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JET - everything 4 jeju travel - my page</title>
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

</style>
<script type="text/javascript">
	
	
	function shareplan_write(){
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				refreshSharePlan();
	
			}
				
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/mypage/mypage.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send();
		
	
	}
	
	function sharePlanWrite(){
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var sharePlanBox = document.getElementById("mypage_box");
				
				var rowBox = document.createElement("div");
				rowBox.setAttribute("class","row mt-2");
	
				var ulBox = document.createElement("ul");
				
				
				var nickBox = document.createElement("li");
				nickBox.setAttribute("style","font-weight: bolder; font-size: 14px;");
				nickBox.innerText = "닉네임이다";
				
				
				rowBox.append(ulBox);
	
				ulBox.append(nickBox);
				
				sharePlanBox.append(rowBox);
	
			}
				
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/mypage/mypage.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send();
	}
	
	
	function boardTab(evt, tabName) {
	    var i, tabcontent, tablinks; 
	    tabcontent = document.getElementsByClassName("tabcontent");                           
	    for (i = 0; i < tabcontent.length; i++) { 
	            tabcontent[i].style.display = "none";                                   
	        } 
	        tablinks = document.getElementsByClassName("tablinks");                                                   
	        for (i = 0; i < tablinks.length; i++) { 
	            tablinks[i].className = tablinks[i].className.replace(" active", "");                                       
	        }   
	        document.getElementById(tabName).style.display = "block";                                                           
	        evt.currentTarget.className += " active";                                                                             
	}
	
	function refreshSharePlan(){
		sharePlanWrite();
	}
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	var isConfirmNick = false;
	
	function confirmNick(){
		var inputNick = document.getElementById("input_nick");
		var nick = inputNick.value;
		console.log("[test confirmNick]"+nick);
		var regExp = /^[a-zA-Zㄱ-힣0-9]*$/;
		var xmlhttp = new XMLHttpRequest();
		
		isConfirmNick = false;
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				if(nick == ''){
					isConfirmNick = true;
					var alertBox = document.createElement("div");
					alertBox.innerText = "닉네임을 입력해주세요";
					alertBox.style.color = "black";
					
					var positionBox = document.getElementById("confirmNick_alert_box");
					positionBox.innerHTML = "";//초기화
					positionBox.appendChild(alertBox);
					
					
				}else if(xmlhttp.responseText == "false" && regExp.test(inputNick.value)){
					isConfirmNick = false;
					var alertBox = document.createElement("div");
					alertBox.innerText = "사용 가능한 닉네임 입니다.";
					alertBox.style.color = "green";
					
					var positionBox = document.getElementById("confirmNick_alert_box");
					positionBox.innerHTML = "";//초기화
					positionBox.appendChild(alertBox);
				}else{
					isConfirmNick = true;
					var alertBox = document.createElement("div");
					alertBox.innerText = "사용 불가능한 닉네임 입니다.";
					alertBox.style.color = "red";
					
					var positionBox = document.getElementById("confirmNick_alert_box");
					positionBox.innerHTML = "";//초기화
					positionBox.appendChild(alertBox);
				}
			
			}
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/member/exist_member_nick.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_member_nick="+nick);	
	}
	
	function formSubmit(){
		if(isConfirmNick == true){
			console.log("[test console nick]");
			alert("닉네임을 확인해주세요.");
			return;
		}
		//submit
		var frmUpdateNick = document.getElementById("frm_update_nick");
		
		frmUpdateNick.submit();
	}

</script>
</head>

<body>
<jsp:include page="../commons/top_image.jsp"/>

<%--사이드바 시 작 --%>	
  	    <div style="margin-top:50px;position: absolute;">
        <div class="mypage_name"><h2>정보 수정</h2></div>
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

		<div class="row" style="border-bottom:1px solid #D5D5D5;height:50px">
			<div class="col-3"></div>
			<div class="col">
				<div class="row" style="padding:10px 0px;margin-left:30px;">
					<div class="col-1" style="width:110px;">
						<a href="#" style="text-decoration:none;color:#7DAB12;font-size:15px;font-weight:bold;">회원정보</a>
						<div class="row">
							<hr style="color:#7DAB12; height:3px; width:75%;margin-top:12px;">
						</div>
					</div>
					<div class="col-1" style="width:110px;">
						<a href="${pageContext.request.contextPath}/mypage/security_mypage.do" style="text-decoration:none;color:#000;font-size:15px;">보안설정</a>
					</div>
				</div>
			</div>
			<div class="col-3"></div>
		</div>
		

        <div class="container" style="margin:65px 0 500px 295px;">
            <div class="row justify-content-center">
                <div class="col-8">
                    <div class="row">
                    	<div class="col">
                    		<div><h5>프로필 수정</h5></div>
                    		<div style="font-size:14px">JET 대표 프로필과 별명을 수정 하실 수 있습니다.</div>
                    	</div>
                    </div>
                    <div class="row mt-3">
                    	<div class="col" style="border-top:1px solid #D5D5D5; border-bottom:1px solid #D5D5D5">
                    		
                    	<form id="frm_update_nick" action="${pageContext.request.contextPath }/mypage/update_member_nick_process.do" method="post" enctype="multipart/form-data">
                    		
                    		<div class="row">
                    			<div class="col-2" style="background-color:#F6F6F6;border-right:1px solid #D5D5D5;">
                    				<div style="text-align:center; margin-top:20px;font-size:14px;font-weight: bold;">
                    					프로필사진
                    				</div>	
                    			</div>
                    			<div class="col">
                    				<div class="row">
                    					<div class="col" style="margin-top:10px;margin-left:10px">
                    						<c:choose>
												<c:when test="${!empty resultImage.imageVoList  }">
													<img style="width: 100px;height: 100px;border-radius: 50px;" src="${resultImage.imageVoList[0].jet_member_image_link }" alt="image">	
												</c:when>
												<c:otherwise>
													<img src="${pageContext.request.contextPath}/resources/image/profile_basic.PNG" alt="profile">	
												</c:otherwise>
											</c:choose>
                    					</div>
                    				</div>
                    				<div class="row" style="margin:10px">
                    					<div class="col">
                    						<input type="file" name="files" id="formFileMultiple" accept="image/*" class="form-control" id="formFileMultiple" value="파일 업로드" multiple>
                    					</div>
                    				</div>
                    				<div class="row" style="margin:10px">
                    					<div class="col">
                    						<div class="filebox">
											   
											 </div>
                    					</div>
                    				</div>
                    			</div>
                    		</div>
                    
                    		<div class="row" style="border-top:1px solid #D5D5D5;">
                    			<div class="col-2" style="background-color:#F6F6F6;border-right:1px solid #D5D5D5;">
                    				<div style="text-align:center; margin-top:25px;font-size:14px;font-weight: bold;">
                    					NICK
                    				</div>	
                    			</div>
                    			<div class="col">
                    				<div class="row" style="margin:20px 0 20px 10px;" >
                    					<div class="col">
                    						<div>
											    <input onblur="confirmNick()" name="jet_member_nick" id="input_nick"  class="form-control form-control-sm" type="text" value="${result.memberVo.jet_member_nick }" aria-label=".form-control-sm example">
										    	
										    </div>
                    					</div>
                    				</div>
                    				<div class="row mt-1">
										<div id="confirmNick_alert_box" class="col"></div>
									</div>
                    			</div>
                    		</div>
                    	</div>
                    </div>
                   	 <div class="row mt-3">
                    	<div class="col ">
                    		<div style="text-align:center">
                    			<input onclick="formSubmit()" id="member_update" type="button" value="변경">
                    		</div>
                    	</div>
                    </div>
   
                   	</form>
   
                </div>
            </div>
        </div>



<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>	
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">        	
</body>
</html>