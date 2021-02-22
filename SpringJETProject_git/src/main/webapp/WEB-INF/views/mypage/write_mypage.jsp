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

	function reviewBoard(){ 
		

		
		var reviewBtn = document.getElementById("reviewBtn");
		reviewBtn.style.fontWeight="bold";
		reviewBtn.style.color="#7DAB12";
		
		var freeBtn = document.getElementById("freeBtn");
		freeBtn.style.fontWeight="normal";
		freeBtn.style.color="#000";
		
		var knowBtn = document.getElementById("knowBtn");
		knowBtn.style.fontWeight="normal";
		knowBtn.style.color="#000";
		
		var jetBtn = document.getElementById("jetBtn");
		jetBtn.style.fontWeight="normal";
		jetBtn.style.color="#000";
		
		/*
		var bottomLine = document.getElementById("bottom_line");
		
		//bottom_line.remove();
		
		var boardLine = document.createElement("hr");
		boardLine.setAttribute("style","color:#7DAB12; height:3px; width:90%;margin-top:12px;");
		
		bottomLine.append(boardLine);
		*/
		var xmlhttp = new XMLHttpRequest();

		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);
				
				var reviewListBox = document.getElementById("review_list_box");
				
				var childCount = reviewListBox.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					reviewListBox.childNodes[0].remove();
				}
				
				var freeListBox = document.getElementById("free_list_box");
				
				var childCount2 = freeListBox.childNodes.length;
				for(var i = 0 ; i < childCount2 ; i++){
					freeListBox.childNodes[0].remove();
				}
				
				var knowListBox = document.getElementById("know_list_box");
				
				var childCount3 = knowListBox.childNodes.length;
				for(var i = 0 ; i < childCount3 ; i++){
					knowListBox.childNodes[0].remove();
				}
				
				for(reviewData of obj){
					
					var trBox = document.createElement("tr");
					
					var checkBox = document.createElement("td");
					checkBox.setAttribute("scope","row");
					
					var checkValue = document.createElement("input");
					checkValue.setAttribute("type","checkbox")
					checkValue.setAttribute("name","delete_chk");
					
					var titleBox = document.createElement("td");
					
					
					var title_Atag = document.createElement("a");
					title_Atag.setAttribute("href","${pageContext.request.contextPath}/board_Review/board_Review_View.do?board_Review_no="+reviewData.boardReviewVo.jet_board_review_no);
					title_Atag.setAttribute("style","text-decoration:none;color:#000");
					title_Atag.innerText = reviewData.boardReviewVo.jet_board_review_title;
					
					var writeDateBox = document.createElement("td");
					writeDateBox.setAttribute("class","text-center");
					
					var d = new Date(reviewData.boardReviewVo.jet_board_review_writedate);
					var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate(); 
					writeDateBox.innerText = strDate;
					
					var readCountBox = document.createElement("td");
					readCountBox.setAttribute("class","text-center")
					readCountBox.innerText = reviewData.boardReviewVo.jet_board_review_readcount;

					checkBox.append(checkValue);
					
					titleBox.append(title_Atag);
					
					trBox.append(checkBox);
					trBox.append(titleBox);
					trBox.append(writeDateBox);
					trBox.append(readCountBox);
					
					reviewListBox.append(trBox);
				}
			}
				
		};
		
		
		xmlhttp.open("get","${pageContext.request.contextPath}/mypage/get_review_board.do");
		
		xmlhttp.send();
		
	}
	
	
	function freeBoard(){ 
		
		var reviewBtn = document.getElementById("reviewBtn");
		reviewBtn.style.fontWeight="normal";
		reviewBtn.style.color="#000";
		
		var freeBtn = document.getElementById("freeBtn");
		freeBtn.style.fontWeight="bold";
		freeBtn.style.color="#7DAB12";
		
		var knowBtn = document.getElementById("knowBtn");
		knowBtn.style.fontWeight="normal";
		knowBtn.style.color="#000";
		
		var jetBtn = document.getElementById("jetBtn");
		jetBtn.style.fontWeight="normal";
		jetBtn.style.color="#000";
		/*
		var bottomLine = document.getElementById("bottom_line");
		
		var boardLine = document.createElement("hr");
		boardLine.setAttribute("style","color:#7DAB12; height:3px; width:90%;margin-top:12px;");
		
		bottomLine.append(boardLine);
		*/
		
		var xmlhttp = new XMLHttpRequest();

		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);
				
				var reviewListBox = document.getElementById("review_list_box");
				
				var childCount = reviewListBox.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					reviewListBox.childNodes[0].remove();
				}
				
				var freeListBox = document.getElementById("free_list_box");
				
				var childCount2 = freeListBox.childNodes.length;
				for(var i = 0 ; i < childCount2 ; i++){
					freeListBox.childNodes[0].remove();
				}
				
				var knowListBox = document.getElementById("know_list_box");
				
				var childCount3 = knowListBox.childNodes.length;
				for(var i = 0 ; i < childCount3 ; i++){
					knowListBox.childNodes[0].remove();
				}
				
				for(freeData of obj){
					
					var trBox = document.createElement("tr");
					
					var checkBox = document.createElement("td");
					checkBox.setAttribute("scope","row");
					
					var checkValue = document.createElement("input");
					checkValue.setAttribute("type","checkbox");
					checkValue.setAttribute("name","delete_chk");
	
					var titleBox = document.createElement("td");
				
					var title_Atag = document.createElement("a");
					title_Atag.setAttribute("href","${pageContext.request.contextPath}/freeboard/read_free_board_page.do?jet_board_free_no="+freeData.freeboardVo.jet_board_free_no);
					title_Atag.setAttribute("style","text-decoration:none;color:#000");
					title_Atag.innerText = freeData.freeboardVo.jet_board_free_title;
					
					var writeDateBox = document.createElement("td");
					writeDateBox.setAttribute("class","text-center");
					
					var d = new Date(freeData.freeboardVo.jet_board_free_writedate);
					var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate(); 
					writeDateBox.innerText = strDate;

					
					var readCountBox = document.createElement("td");
					readCountBox.setAttribute("class","text-center");
					readCountBox.innerText = freeData.freeboardVo.jet_board_free_readcount;
					
					
					checkBox.append(checkValue);
					
					titleBox.append(title_Atag);
					
					trBox.append(checkBox);
					trBox.append(titleBox);
					trBox.append(writeDateBox);
					trBox.append(readCountBox);
					
					freeListBox.append(trBox);
				}
			}
				
		};
		
		
		xmlhttp.open("get","${pageContext.request.contextPath}/mypage/get_free_board.do");
		
		xmlhttp.send();
		
	}
	
	function knowBoard(){ 
		
		var reviewBtn = document.getElementById("reviewBtn");
		reviewBtn.style.fontWeight="normal";
		reviewBtn.style.color="#000";
		
		var freeBtn = document.getElementById("freeBtn");
		freeBtn.style.fontWeight="normal";
		freeBtn.style.color="#000";
		
		var knowBtn = document.getElementById("knowBtn");
		knowBtn.style.fontWeight="bold";
		knowBtn.style.color="#7DAB12";
		
		var jetBtn = document.getElementById("jetBtn");
		jetBtn.style.fontWeight="normal";
		jetBtn.style.color="#000";
		/*
		var bottomLine = document.getElementById("bottom_line");
		
		var boardLine = document.createElement("hr");
		boardLine.setAttribute("style","color:#7DAB12; height:3px; width:90%;margin-top:12px;");
		
		bottomLine.append(boardLine);
		*/
		
		var xmlhttp = new XMLHttpRequest();

		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);
				
				var reviewListBox = document.getElementById("review_list_box");
				
				var childCount = reviewListBox.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					reviewListBox.childNodes[0].remove();
				}
				
				var freeListBox = document.getElementById("free_list_box");
				
				var childCount2 = freeListBox.childNodes.length;
				for(var i = 0 ; i < childCount2 ; i++){
					freeListBox.childNodes[0].remove();
				}
				
				var knowListBox = document.getElementById("know_list_box");
				
				var childCount3 = knowListBox.childNodes.length;
				for(var i = 0 ; i < childCount3 ; i++){
					knowListBox.childNodes[0].remove();
				}
				
				for(knowData of obj){
					
					var trBox = document.createElement("tr");
					
					var checkBox = document.createElement("td");
					checkBox.setAttribute("scope","row");
					
					var checkValue = document.createElement("input");
					checkValue.setAttribute("type","checkbox");
					checkValue.setAttribute("name","delete_chk");
					
					var titleBox = document.createElement("td");
					
					var title_Atag = document.createElement("a");
					title_Atag.setAttribute("href","${pageContext.request.contextPath}/knowhowboard/read_knowhowboard_page.do?jet_board_knowhow_no="+knowData.knowhowBoardVo.jet_board_knowhow_no);
					title_Atag.setAttribute("style","text-decoration:none;color:#000");
					title_Atag.innerText = knowData.knowhowBoardVo.jet_board_knowhow_title;
					
					var writeDateBox = document.createElement("td");
					writeDateBox.setAttribute("class","text-center");
					
					var d = new Date(knowData.knowhowBoardVo.jet_board_knowhow_writedate);
					var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate(); 
					writeDateBox.innerText = strDate;
					
					var readCountBox = document.createElement("td");
					readCountBox.setAttribute("class","text-center");
					readCountBox.innerText = knowData.knowhowBoardVo.jet_board_knowhow_readcount;
					
					
					checkBox.append(checkValue);
					
					titleBox.append(title_Atag);
					
					trBox.append(checkBox);
					trBox.append(titleBox);
					trBox.append(writeDateBox);
					trBox.append(readCountBox);
					
					knowListBox.append(trBox);
				}
			}
				
		};
		
		
		xmlhttp.open("get","${pageContext.request.contextPath}/mypage/get_know_board.do");
		
		xmlhttp.send();
		
	}
	function jetBoard(){
		var reviewBtn = document.getElementById("reviewBtn");
		reviewBtn.style.fontWeight="normal";
		reviewBtn.style.color="#000";
		
		var freeBtn = document.getElementById("freeBtn");
		freeBtn.style.fontWeight="normal";
		freeBtn.style.color="#000";
		
		var knowBtn = document.getElementById("knowBtn");
		knowBtn.style.fontWeight="normal";
		knowBtn.style.color="#000";
		
		var jetBtn = document.getElementById("jetBtn");
		jetBtn.style.fontWeight="bold";
		jetBtn.style.color="#7DAB12";

		
		var xmlhttp = new XMLHttpRequest();

		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);
				
				var reviewListBox = document.getElementById("review_list_box");
				
				var childCount = reviewListBox.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					reviewListBox.childNodes[0].remove();
				}
				
				var freeListBox = document.getElementById("free_list_box");
				
				var childCount2 = freeListBox.childNodes.length;
				for(var i = 0 ; i < childCount2 ; i++){
					freeListBox.childNodes[0].remove();
				}
				
				var knowListBox = document.getElementById("know_list_box");
				
				var childCount3 = knowListBox.childNodes.length;
				for(var i = 0 ; i < childCount3 ; i++){
					knowListBox.childNodes[0].remove();
				}
				
				var jetListBox = document.getElementById("jet_list_box");
				
				var childCount = jetListBox.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					jetListBox.childNodes[0].remove();
				}
				
				for(jetData of obj){
					
					var trBox = document.createElement("tr");
					
					var checkBox = document.createElement("td");
					checkBox.setAttribute("scope","row");
					
					var checkValue = document.createElement("input");
					checkValue.setAttribute("type","checkbox");
					checkValue.setAttribute("name","delete_chk");
					
					var titleBox = document.createElement("td");
					
					var title_Atag = document.createElement("a");
					title_Atag.setAttribute("href","${pageContext.request.contextPath}/shareplan_board/read_shareplan_board_page.do?jet_board_shareplan_no="+jetData.sharePlanBoardVo.jet_board_shareplan_no);
					title_Atag.setAttribute("style","text-decoration:none;color:#000");
					title_Atag.innerText = jetData.sharePlanBoardVo.jet_board_shareplan_title;
					
					var writeDateBox = document.createElement("td");
					writeDateBox.setAttribute("class","text-center");
					
					var d = new Date(jetData.sharePlanBoardVo.jet_board_shareplan_writedate);
					var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate(); 
					writeDateBox.innerText = strDate;
					
					var readCountBox = document.createElement("td");
					readCountBox.setAttribute("class","text-center");
					readCountBox.innerText = jetData.sharePlanBoardVo.jet_board_shareplan_readcount;
					
					
					checkBox.append(checkValue);
					
					titleBox.append(title_Atag);
					
					trBox.append(checkBox);
					trBox.append(titleBox);
					trBox.append(writeDateBox);
					trBox.append(readCountBox);
					
					knowListBox.append(trBox);
				}
			}
				
		};
		
		
		xmlhttp.open("get","${pageContext.request.contextPath}/mypage/get_shareplan_board.do");
		
		xmlhttp.send();
	}
	
	//전체삭제
	function selectAll(selectAll){
	  const checkboxes = document.getElementsByName('delete_chk');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
		
	}
	

</script>
</head>
<body onload="freeBoard()">
<jsp:include page="../commons/top_image.jsp"/>
<%--사이드바 시 작 --%>	
  	    <div style="margin-top:50px;position: absolute;">
        <div class="mypage_name"><h2>내가 쓴 글</h2></div>
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
						<a href="#" style="text-decoration:none;color:#7DAB12;font-size:15px;font-weight:bold;" onclick="freeBoard()" id="freeBtn">자유게시판</a>
						
					</div>
					<div class="col-1" style="width:110px;">
						<a href="#" style="text-decoration:none;color:#000;font-size:15px;" onclick="knowBoard()" id="knowBtn">팁과노하우</a>
					</div>
					<div class="col-1" style="width:110px;">
						<a href="#" style="text-decoration:none;color:#000;font-size:15px;" onclick="reviewBoard()" id="reviewBtn">리뷰게시판</a>
						
					</div>
					<div class="col-1" style="width:110px;">
						<a href="#" style="text-decoration:none;color:#000;font-size:15px;" onclick="jetBoard()" id="jetBtn">제트기</a>
					</div>
				</div>
			</div>
			<div class="col-3"></div>
		</div>

		

        <div class="container" style="margin:65px 0 600px 295px;">
            <div class="row justify-content-center">
                <div class="col-8">
					<table class="table table-hover table-responsive" id="board">
						<thead>
							<tr>
								<th scope="col" class="col-1"><input type="checkbox" onclick="selectAll(this)"></th>
								<th scope="col" class="col">제목</th>
								<th scope="col" class="col-2 text-center">작성일</th>
								<th scope="col" class="col-1 text-center">조회수</th>
								
							</tr>
						</thead>
						
						
			            
			            	<tbody id="free_list_box">
						
			            
			           		<tbody id="review_list_box">
			            	
			            	<tbody id="know_list_box">
			            	<tbody id="jet_list_box">
			             											
						</tbody>
						
						
					</table>
					<input id="member_update" type="button" value="삭제" style="float:right;">
				</div>
            </div>
        </div>
        

<jsp:include page="../commons/global_nav.jsp"/>
<jsp:include page="../commons/global_footer.jsp"/>			
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">        	
</body>
</html>