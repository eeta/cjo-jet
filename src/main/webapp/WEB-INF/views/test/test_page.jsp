<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>

	//날짜 넣을 때 - -> /로 변환
	function frmSubmit(){
		var frm = document.getElementById("frm");
		
		var xxxBox = document.getElementById("xxx");
		
		var dateValue = xxxBox.value.replaceAll("-","/");
		
		var dateHiddenBox = document.createElement("input");
		dateHiddenBox.setAttribute("type","hidden");
		dateHiddenBox.setAttribute("name","tttt");
		dateHiddenBox.setAttribute("value",dateValue);
		frm.appendChild(dateHiddenBox);
		frm.submit();
	}

</script>


</head>
<body>

	<form id="frm" action="./test_process.do" method="get">
		<input id="xxx" type="date">
	
		<input type="button" value="tete" onclick="frmSubmit()">
	
	</form>


</body>
</html>