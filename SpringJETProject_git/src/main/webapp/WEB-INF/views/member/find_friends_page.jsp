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
	function findFriend(){
		var inputWord = document.getElementById("input_word");
		
		if(inputWord.value == "" || inputWord.value.trim() == ""){
				window.location.href ="./find_friends_page.do";
				return;
		}
		
		var frmSearch = document.getElementById("frm_search");
		frmSearch.submit();
	}
</script>
</head>
<body style="background-color:#FAFAFA">

	<jsp:include page="../commons/top_image.jsp"/>
 
 <%--사이드바 시 작 --%>	
  	    <div style="margin-top:50px;position: absolute;">
        <div class="mypage_name"><h2>친구 찾기</h2></div>
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
                <div class="col-8">
					<div class="row justify-content-center"style="height:250px;">
						<div class="col-11">
							<div class="row mt-2">
					            <div class="col-4"></div>
					            <div class="col-4"></div>
					            <div class="col text-end">home > find friends</div>
					        </div>
					        <div class="row">
					        	<div class="col">
					        		<hr>
					        	</div>
					        </div>
							<div class="row mt-2">
								<div class="col-3 d-grid gap-2"></div>
								<div class="col d-grid gap-2 text-center">
									<h4>친구 찾기</h4>
								</div>
								<div class="col-3 d-grid gap-2 text-center">
									<a class="btn btn-outline-success" style="display: inline; background-color:#ffffff; color: #20c497;">친구 찾기</a>
									<a class="btn" style="display: inline; background-color: #20c497; color: #ffffff;"href="${pageContext.request.contextPath }/member/my_friendList_page.do">나의 친구</a>
								</div>
							</div>
							<div class="row mt-4">
								<div class="col">
									<form id="frm_search" action="${pageContext.request.contextPath }/member/find_friends_page.do" method="get">
									<div class="row"><%--나의 친구 --%>
										<div class="col ps-0">
											<select class="form-select" name="search_type">
												<option value="member_nick">닉네임</option>
												<option value="member_kakao">카카오톡 아이디</option>
												<%--<option value="member_grade">이메일</option> --%>
											</select>
										</div>
										<div class="col-6 p-0"><input id="input_word" class="form-control" name="search_word" type="text"></div>
										<div class="col-3 p-0"><input onclick="findFriend()" class="btn form-control" style="background-color: #FF9436; color: white;" type="button" value="찾기" ></div>
									</div>
									</form>
									<c:forEach items="${memberList }" var="data">
									<div class="row mt-2 p-0">
										<div class="col p-0">
											<table id="member_table" class="table m-0">
												  <tbody class="border">	  	
												    <tr class="text-center">
												      <td class="col-2 pt-4">${data.jet_member_grade }</td>
												      <td class="col pt-4">${data.jet_member_nick }</td>
												      <td class="col-3 pt-3 pb-3"><a id="add_friend" class="btn" style="background-color: #198654; color: #ffffff" href="${pageContext.request.contextPath }/member/add_friends_process.do?jet_friends_member_no=${data.jet_member_no}">친구추가</a></td>
												    </tr> 
												  </tbody>
											</table>
										</div>
									</div>
									</c:forEach>
									<div class="row mt-2">
										<div class="col">
											
												<ul class="pagination justify-content-center">
													<li class="page-item<c:if test="${currentPage == 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/member/find_friends_page.do?page_num=1">&lt;&lt;</a></li>
													<li class="page-item<c:if test="${beginPage <= 1 }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/member/find_friends_page.do?page_num=${beginPage-1 }">&lt;</a></li>
													<c:forEach begin="${beginPage }" end="${endPage }" var="page">
														<li class="page-item <c:if test="${page == currentPage }"> active</c:if>"><a href="${pageContext.request.contextPath }/member/find_friends_page.do?page_num=${page }" class="page-link">${page}</a></li>
													</c:forEach>
													<li class="page-item <c:if test="${endPage >= listCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/member/find_friends_page.do?page_num=${endPage+1 }">&gt;</a></li>
													<li class="page-item<c:if test="${currentPage == listCount }"> disabled</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/member/find_friends_page.do?page_num=${listCount }">&gt;&gt;</a></li>
												</ul>
											
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