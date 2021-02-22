<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<%--여기 아래로 복사 시작 --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
	#mainbox{
		border: 1px solid rgba(0,0,0,.125);
   		border-radius: .25rem;
	}
</style>
<script type="text/javascript">
	<%-- 전체 대비 남녀 성비 --%>
    google.charts.load("current", {'packages':["corechart"]});
    
    function drawChart(datas) {
      var datas = google.visualization.arrayToDataTable(datas);//성비
		
      var options = {
        width: 300,
        height: 400,
        bar: {groupWidth: "95%"},
        legend: { position: "bottom"}
        
      };
      var chart = new google.visualization.PieChart(document.getElementById("piechart"));
      
      chart.draw(datas, options.series);
      
  }
    
  function refreshGraph(){
	  
	  var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);
				datas = [];
				columns = ['성별','인원 수'];
				datas.push(columns);
				
				for(x of obj){
					arr = [];
					arr.push(x.SEX);
					arr.push(x.RATIO_COUNT);
					
					datas.push(arr);
				}
				drawChart(datas);
			}
		};
		
		xmlhttp.open("get","${pageContext.request.contextPath}/ratio/get_ratio_count.do");
		xmlhttp.send();
		
  }
  
  <%-- 일별 신규 가입자 수 --%>
  	google.charts.load("current", {'packages':["corechart"]});
  
    function drawNewMemberCount(datas) {
      var datas = google.visualization.arrayToDataTable(datas);

      var options = {
        width: 650,
        height: 350,
        
      };
      var chart = new google.visualization.LineChart(document.getElementById("chart_div"));
      chart.draw(datas, options); 
  
 	}
  
    
	  function refreshNewMemberCount(){
		  var xmlhttp = new XMLHttpRequest();
			
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					var obj = JSON.parse(xmlhttp.responseText);
					datas = [];
					columns = ['날짜','인원 수'];
					datas.push(columns);
					
					for(x of obj){
						arr = [];
						arr.push(x.JOINDATE);
						arr.push(x.NEW_MEMBER);
						
						datas.push(arr);
					}
				drawNewMemberCount(datas);
			}
	  	};
		  	xmlhttp.open("get","${pageContext.request.contextPath}/ratio/get_new_member_count_by_date.do");
			xmlhttp.send();
	  }
	 <%-- 게시판 별 게시글 수 --%>
  google.charts.load("current", {'packages':["corechart"]});
  
  function drawPostsCount(data) {
    var datas = google.visualization.arrayToDataTable(data);

    var options = {
      width: 650,
      height: 400,
      legend: { position: "bottom" },
    };
    
    var chart = new google.visualization.ColumnChart(document.getElementById('columnchart_values'));
    chart.draw(datas, options);

	}

  function refreshPostsCount(){
	  var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);
				datas = [];
				columns = ['게시판','게시물 수' , { role: 'style' }];
				datas.push(columns);
				
				for(x of obj){
					arr = [];
					arr.push(x.POSTS);
					arr.push(x.COUNT);
					
					//var colorCode = '#' + Math.round(Math.random() * 0xffffff).toString(16);
					//arr.push('color: ' + colorCode);
					
					datas.push(arr);
				}
				
				//datas[0].push('color: red');
				datas[1].push('color: #9966ff');
				datas[2].push('color: #33d6ff');
				datas[3].push('color: #ff6699');
				datas[4].push('color: #99ff66');
				datas[5].push('color: #ffff66');
				datas[6].push('color: #ff8000');
				
				
				
			drawPostsCount(datas);
		}
  	};
	  	xmlhttp.open("get","${pageContext.request.contextPath}/ratio/get_posts_count.do");
		xmlhttp.send();
  }
  
 google.charts.load("current", {'packages':["corechart"]});
 	<%-- 문의글 답변글 미답변글 --%>
  function drawCsCount(datas) {
    var datas = google.visualization.arrayToDataTable(datas);

    var options = {
      width: 450,
      height: 400,
      legend: { position: "none" },
      
    };
    
    var chart = new google.visualization.ColumnChart(document.getElementById('columnchart_values2'));
    chart.draw(datas, options);

	}

  function refreshCsCount(){
	  var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);
				datas = [];
				columns = ['문의','수', { role: 'style' }];
				datas.push(columns);
				
				for(x of obj){
					arr = [];
					arr.push(x.CS);
					arr.push(x.COUNT);
					
		
					datas.push(arr);
				}
				
				//datas[0].push('color: red');
				datas[1].push('color: #9966ff');
				datas[2].push('color: #33d6ff');
				datas[3].push('color: #ff6699');
				
				
				
				
			drawCsCount(datas);
		}
  	};
	  	xmlhttp.open("get","${pageContext.request.contextPath}/ratio/get_cs_count.do");
		xmlhttp.send();
  }
  function refresh(){
	  refreshGraph();
	  refreshNewMemberCount();
	  refreshPostsCount();
	  refreshCsCount();
  }
  
  setInterval(refresh,60000);
  </script>
</head>
<body style="background-color:#f6f6f6;" onload="refresh()">

<jsp:include page="../admin/admin_only_nav.jsp"/>
<jsp:include page="../font/NanumGothicCoding.jsp"/>
<div class="container-fluid">
	<div class="row">
	<jsp:include page="../admin/admin_only_sidebar.jsp"/>
		<div class="col">
			<div class="row ms-5" style="margin-top: 6rem;">
				<div class="col"></div>
				<div class="col-4">
					<div class="row" style="background-color: #ffffff;border-radius: .5rem;">
						<div class="col">
							<div class="row"><%--전체 사용자 수 대비 사용자 성비 --%>
								<div class="col">
									<div class="col text-center"><p style="padding-top: 1rem;font-family: 'NotoSansKR';font-weight: 400;font-size: 1.5rem;">전체 사용자 수 대비 사용자 성비</p></div>
								</div>
							</div>
							<div class="row">
								<hr>
								<div class="col text-center">
									<div id="piechart" style="width: 400px; height: 400px;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col ps-5">
					<div class="row"style="background-color: #ffffff;border-radius: .5rem;">
						<div class="col">
							<div class="row"><%--일별 가입자 수 --%>
								<div class="col text-center">
									<p style="padding-top: 1rem;margin-left:3rem;margin-bottom: 0; font-family: 'NotoSansKR';font-weight: 400;font-size: 1.5rem;">일별 가입자 수</p>
								</div>
							</div>
							<div class="row mt-2"style="background-color: #ffffff;">
								<hr>
								<div id="chart_div" class="col-4"style="width: 700px; height: 400px;"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col"></div>
				<div class="col"></div>
			</div>			
			<div class="row mt-5 ms-5">
				<div class="col"></div>
				<div class="col">
					<div class="row"style="background-color: #ffffff;border-radius: .5rem;">
						<div class="col">
							<div class="row"><%--문의글, 답변글, 미답변  수 --%>
								<div class="col text-center"><p style="padding-top: 1rem;margin-left:3rem;margin-bottom: 0; font-family: 'NotoSansKR';font-weight: 400;font-size: 1.5rem;">문의글, 답변글, 미답변  수</p></div>
							</div>
							<div class="row mt-2">
								<hr>
								<div id="columnchart_values2" class="col-4" style="width: 500px; height: 400px;"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col ps-5">
					<div class="row"style="background-color: #ffffff;border-radius: .5rem;">
						<div class="col">
							<div class="row"><%--게시판 별 게시글 수 --%>
								<div class="col text-center"><p style="padding-top: 1rem;margin-left:3rem;margin-bottom: 0; font-family: 'NotoSansKR';font-weight: 400;font-size: 1.5rem;">게시판 별 게시글 수</p></div>
							</div>
							<div class="row mt-2">
								<hr>
								<div id="columnchart_values" class="col-4" style="width: 700px; height: 400px;"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col"></div>
				<div class="col"></div>
			</div> <%--관리자 메인 페이지 박스 끝 --%>  
		</div><%--가장 큰 row박스 끝 --%>
		<div class="row" style="margin-bottom: 6rem;"></div>
	</div>		
</div> <%--컨테이너 박스 끝 --%>


 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

<%--여기까지 복사 --%>
</body>
</html>