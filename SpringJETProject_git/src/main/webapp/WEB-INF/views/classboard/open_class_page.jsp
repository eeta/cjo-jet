<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"></head>

<title>Insert title here</title>


<script>
   function frmSubmit(){
      var frm = document.getElementById("frm");
      
      var start_date_value = document.getElementById("start_date").value.replaceAll("-","/");
      var end_date_value = document.getElementById("end_date").value.replaceAll("-","/");

      var start_hidden_box = document.createElement("input");
      start_hidden_box.setAttribute("type","hidden");
      start_hidden_box.setAttribute("name","start_date");
      start_hidden_box.setAttribute("value",start_date_value);
      frm.appendChild(start_hidden_box);
      
      var end_hidden_box = document.createElement("input");
      end_hidden_box.setAttribute("type","hidden");
      end_hidden_box.setAttribute("name","end_date");
      
      end_hidden_box.setAttribute("value",end_date_value);
      frm.appendChild(end_hidden_box);
      
      frm.submit();
   }

</script>





</head>
<body>
<jsp:include page="../commons/global_nav.jsp"/>
<div class="topImage"></div>

   <div class="container">
      <main>
           <div class="row mt-2">
               <div class="col-5"></div>
               <div class="col-5"></div>
               <div class="col-2 text-muted" style="text-align: right;">home > board</div>
           </div>   
           <div class="row mt-4">
               <div class="col text-center display-5">강좌 개설 페이지</div>
           </div>   
           <div class="row mt-4">
               <hr>             <!-- 선 -->
           </div>   
                                    
         <div class="row mt-2">
            <div class="col"></div>
            <div class="col-6">
               <form id="frm" action="${pageContext.request.contextPath}/classboard/open_class_process.do" method="post" enctype="multipart/form-data">
                  <div class="row">
                     <div class="col">   <!-- 여기가 안 -->
                        <div class="row">
                           <div class="col">                              
                              <select id="jet_class_category_no" name="jet_class_category_no" class="form-select form-select-sm">
                                 <option value="1">관광지 가이드</option>
                                 <option value="2">액티비티</option>
                                 <option value="3">올레길 걷기</option>
                                 <option>=======</option>
                              </select>
                           </div>
                           <div class="col-10 form-floating">
                              <input name="jet_class_name" type="text" class="form-control"  placeholder="Leave a comment here" id="floatingTextarea2" ><br>
                              <label for="floatingTextarea2"> 제목</label>
                           </div>                           
                        </div>
                        <div class="row">
                           <div class="col text-end">
                              <span class="badge bg-warning text-dark">작성자</span> ${sessionUser.jet_member_nick }<br>
                           </div>
                        </div>                        
                        <div class="row">
                           <div class="col">
                              위치: 위도<input type="text" name="jet_class_latitude">
                               경도 <input type="text" name="jet_class_longitude"><br>
                           </div>
                        </div>   
                        
                        <div class="row mt-2 mb-2">
                           <div class="col form-floating">
                              <textarea name="jet_class_content" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 300px"></textarea>
                              <label for="floatingTextarea2"> 내용</label>
                           </div>
                        </div>                            
                        <div class="row mt-2">
                           <div class="col">
                              <input name="files" type="file" accept="image/*" multiple>
                           </div>
                        </div>   
                        <div class="row mt-4">
                           <div class="col">
                              가격 : <input type="text" name="jet_class_price">
                              시간 : <input type="text" name="jet_class_totaltime"><br>
                           </div>
                        </div>                           
                        <div class="row mt-4">
                           <div class="col">
                              최대 인원 : 
                              <select id="jet_class_max_headcount" name="jet_class_max_headcount" class="form-select form-select-sm">
                                 <option value="1">1</option>
                                 <option value="2">2</option>
                                 <option value="3">3</option>
                                 <option value="4">4</option>
                                 <option value="5">5</option>
                                 <option value="6">6</option>
                                 <option value="7">7</option>
                                 <option value="8">8</option>
                                 <option value="9">9</option>
                                 <option value="10">10</option>
                              </select>   
                           </div>
                        </div>                        
                        <div class="row mt-4">
                           <div class="col">
                              시작일 : <input id="start_date" type="date">
                              종료일 : <input id="end_date" type="date"><br>
                           </div>
                        </div>                              
                        <div class="row mt-2 text-end">
                           <div class="col">
                              <input class="btn btn-warning" type="submit" value="개설" onclick="frmSubmit()">      
                           </div>
                        </div>                           
                        
                     </div>
                  </div>
               </form>
            </div>
            <div class="col"></div>
         </div>
      </main>
   </div>

</body>
</html>