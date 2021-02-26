<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

   var jet_member_no = null;
   
   var xmlhttp = new XMLHttpRequest();
   
   xmlhttp.onreadystatechange = function(){
      if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
         var obj = JSON.parse(xmlhttp.responseText);  //여기가 뭘까.
         
         if(obj.result == "success"){
            jet_member_no = obj.sessionNo;
         }else{
            console.log(obj.reason);
         }
         
      }
   };
   
   xmlhttp.open("get","${pageContext.request.contextPath }/member/getSessionNo.do");
   xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
   xmlhttp.send();
   
   //예약 버튼 기능.
   function reserveButton() {
      if(jet_member_no == null){
         
         var confirmResult = confirm("로그인하셔야 사용 가능한 기능입니다. 로그인 페이지로 이동하시겠습까?");
         
         if(confirmResult == true){
            location.href= "${pageContext.request.contextPath }/member/login_page.do";   
         }
         return;
      }
      
      var jet_class_detail_no = ${result.detailVo.jet_class_detail_no};

      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function(){
         if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
            refreshReserve();
         }
      };   
      
      xmlhttp.open("post","${pageContext.request.contextPath}/classboard/reserve_class_process.do");
      xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
      xmlhttp.send("jet_class_detail_no=" + jet_class_detail_no);
      
   }
   
   //취소 버튼
   function cancelButton() {
      
      var jet_class_detail_no = ${result.detailVo.jet_class_detail_no};

      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function(){
         if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
            refreshReserve();
         }
      };   
      
      xmlhttp.open("post","${pageContext.request.contextPath}/classboard/cancel_class_process.do");
      xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
      xmlhttp.send("jet_class_detail_no=" + jet_class_detail_no);
      
   }
   
   function reserveOnedayClass() {
      
      var jet_class_detail_no = ${result.detailVo.jet_class_detail_no};

      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function(){
         if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
            var obj = JSON.parse(xmlhttp.responseText);      
            
            if(obj.checkReserve == true){
               var btnReserve = document.getElementById("btnReserve");
               btnReserve.setAttribute("value","예약취소");
               btnReserve.setAttribute("onclick" , "cancelButton()");
                  
            }else{
               var btnReserve = document.getElementById("btnReserve");
               btnReserve.setAttribute("value","예약하기");
               btnReserve.setAttribute("onclick" , "reserveButton()");
                  
            }
            
            var btnReserveCount = document.getElementById("countReserve");
            btnReserveCount.innerText = obj.countReserve;
            
         }
            
      };
      
      xmlhttp.open("post","${pageContext.request.contextPath}/classboard/classboard_reserve_map.do");
      xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
      xmlhttp.send("jet_class_detail_no=" + jet_class_detail_no);
      
   }

   function refreshReserve() {
      reserveOnedayClass();
   }
   
   
   //찜 기능들
   function pickButton() {
		
		if(jet_member_no == null){
			var confirmResult = confirm("로그인하셔야 사용 가능한 기능입니다. 로그인 페이지로 이동하시겠습까?");
			
			if(confirmResult == true){
				location.href= "${pageContext.request.contextPath }/member/login_page.do";	
			}	
			return;
		}
	 
		var jet_class_detail_no = ${result.detailVo.jet_class_detail_no};
	 	
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refreshPick();
			}
		
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath}/classboard/classboard_pick_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_member_no=" + jet_member_no + "&jet_class_detail_no=" + jet_class_detail_no);
	   
	}
   
   
   function unpickButton() {
	
	   var jet_class_detail_no = ${result.detailVo.jet_class_detail_no};
	   
	   var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refreshPick();
			}
				
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath}/classboard/classboard_unpick_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_member_no=" + jet_member_no + "&jet_class_detail_no=" + jet_class_detail_no);
		
   }
   
   
   function pickClass(){
		
	   var jet_class_detail_no = ${result.detailVo.jet_class_detail_no};
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);
				
				if(obj.pickCheck == true){
					var btnPick = document.getElementById("btnPick");
					btnPick.setAttribute("type","image");
					btnPick.setAttribute("src","${pageContext.request.contextPath}/resources/image/pick_on.png");
					btnPick.setAttribute("style","outline:none;width:40px;height:50px;");
					btnPick.setAttribute("onclick","unpickButton()");

					
				}else{
					var btnPick = document.getElementById("btnPick");
					btnPick.setAttribute("type","image");
					btnPick.setAttribute("src","${pageContext.request.contextPath}/resources/image/pick_off.png");
					btnPick.setAttribute("style","outline:none;width:40px;height:50px;");
					btnPick.setAttribute("onclick","pickButton()");

				}

			}
			
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/classboard/classboard_pick_check_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("jet_class_detail_no=" + jet_class_detail_no);
	}
   
   	function refreshPick() {
		pickClass();
	}
   	
   	
   	

</script>