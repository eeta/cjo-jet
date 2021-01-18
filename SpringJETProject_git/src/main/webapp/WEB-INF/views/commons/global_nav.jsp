<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
            
    </head>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        body{
           
        }
        input[id="menuicon"]{ 
              display: none;
              
        }
        /*좌측 햄버거*/   
        
        
        input[id="menuicon"] + label{
                display: block;
                width: 20px;
                height: 15px;
                position: fixed;
                cursor: pointer;
                top: 20px ;
                right: 1%;
                transition: all .35s;
                
            }
        input[id="menuicon"]:checked + label{
                z-index: 2;
                
            }

        input[id="menuicon"] + label span{
                display:block;
                position:absolute;
                width:100%;
                height:2px;
                border-radius:30px;
                background:#fff;
                transition:all .35s;
            } 
        input[id="menuicon"] + label span:nth-child(1){
                top:0;
            }
        input[id="menuicon"] + label span:nth-child(2){
                top:50%;
                transform: translateY(-50%);
            }
        input[id="menuicon"] + label span:nth-child(3){
                bottom: 0;
            }
        input[id="menuicon"]:checked + label {
                z-index:2;
                }
        input[id="menuicon"]:hover + label span:nth-child(1) {
            background-color: #ABF200;
        }
        input[id="menuicon"]:hover + label span:nth-child(2) {
            background-color: #ABF200;
        }
        input[id="menuicon"]:hover + label span:nth-child(3) {
            background-color: #ABF200;
        }
        input[id="menuicon"]:checked + label span {
                background:#fff;
                }
        input[id="menuicon"]:checked + label span:nth-child(1) {
                top:50%;
                transform:translateY(-50%) rotate(225deg);
                }
        input[id="menuicon"]:checked + label span:nth-child(2) {
                opacity:0;
                }
        input[id="menuicon"]:checked + label span:nth-child(3) {
                bottom:50%;
                transform:translateY(50%) rotate(315deg);
                }
/*-----------------------------------------------------------------------------------*/
        header {
            background:#FF9436;
            height: 6vh;
            overflow:hidden;
            position: fixed;
            top: 0;
            transition: top 0.2s ease-in-out;

        }

        .nav_up {
            top: -6vh;
        }
        nav{
            display: flex;
            justify-content: space-around;
            align-items: center;
            min-height: 6vh;
            background-color: #FF9436;
            width: 2000px;
            position: relative;
            margin-top: 5px;
            
        }
        .logo{
            color: #fff;
            text-transform: uppercase;
            letter-spacing: 5px;
            font-size: 20px;
            top: 0;
            margin-left: -70px;
            margin-top: -120px;
            
        }
        .nav-links{
            display: flex;
            justify-content: space-around;
            width: 27%;
            margin-top: 10px;
            
            

        }
        .nav-links-drop{
            text-align: center;
            
            list-style:none;
            padding-left:0px;


        }
       
        .nav-links li{
            list-style: none;
            
        }
        .nav-links a{
            color: #fff;
            text-decoration: none;
            letter-spacing: 5px;
            font-weight: bold;
            font-size: 14px;
            position: relative;
            padding: 6px 12px;
            
        }
        .nav-links a::after{
            content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 0;
            height: 2px;
            background: #ABF200;
            transition: all .1s ease-out;
        }
        .nav-links a:hover::after{
            width: 100%;
        }
        
       
        /*좌측 사이드 메뉴*/
        div[class = "sidebar"]{
        width: 260px;
        height: 560px;      
        background-color: #FF9436;      
        
        right: 0;
        position: fixed;
        top: -1000px;
        z-index: 1;
        transition: all .2s;
        
        }
        input[id="menuicon"]:checked + label + div{
            top: 57px;
            box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px, rgba(0,0,0,0.5) 2px 2px 3px 3px;
            }
                   
        
        
        #sidebar_Top{
            width: 100%;
            height: 240px;
            font-weight: bold;
            border-bottom: 1px solid#D5D5D5;
            text-align: center;

        }
        /*비로그인 사이드 상단*/
        .side_login{
            text-align: center;
        }
        .side_login li{
            display: inline block;
            list-style: none;
            float: left;
            margin-left: 10px;
        }
        .side_login a{
            color: #000;
            text-decoration: none;
            letter-spacing: 3px;
            font-weight: bold;
            font-size: 14px;
            position: relative;
            padding: 6px 12px;
        }
        .side_login a::after{
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
        .side_login a:hover::after{
            width: 100%;
        }
        .sidebar_Mid_Menu{
            text-align: center;
            margin-left: -35px;
            margin-top: 20px;
        }
        .sidebar_Mid_Menu li{
            list-style: none;
            display: inline block;
            margin-bottom: 20px;
        }
        .sidebar_Mid_Menu a{
            color: #000;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            letter-spacing: 3px; 
            position: relative;
            padding: 6px 12px;
        }
        .sidebar_Mid_Menu a::after{
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
        .sidebar_Mid_Menu a:hover::after{
            width: 100%;
        }
/*------------------------------------------------------*/     
        /*.topImage{
            width: 100%;
            height: 100px;
            margin-top: 6vh;
            background-image: url('sky.jpg');

        }*/
        
/*-----------------------------footer-------------------------*/   
        #footer{
          text-align:center;
       }
       #footer li{
          display : inline; /* 세로나열을 가로나열로 변경 */ 
          
          font:bold 12px Dotum; /* 폰트 설정 - 12px의 돋움체 굵은 글씨로 표시 */ 
          padding:0 10px;
       }
    </style>
    <script>
        // Hide Header on on scroll down
        var didScroll;
        var lastScrollTop = 0;
        var delta = 5;
        var navbarHeight = $('header').outerHeight();

        $(window).scroll(function(event){
            didScroll = true;
        });

        setInterval(function() {
            if (didScroll) {
                hasScrolled();
                didScroll = false;
            }
        }, 250);

        function hasScrolled() {
            var st = $(this).scrollTop();
            
            // Make sure they scroll more than delta
            if(Math.abs(lastScrollTop - st) <= delta)
                return;
            
            // If they scrolled down and are past the navbar, add class .nav-up.
            // This is necessary so you never see what is "behind" the navbar.
            if (st > lastScrollTop && st > navbarHeight){
                // Scroll Down
                $('header').removeClass('nav_down').addClass('nav_up');
            } else {
                // Scroll Up
                if(st + $(window).height() < $(document).height()) {
                    $('header').removeClass('nav_up').addClass('nav_down');
                }
            }
            
            lastScrollTop = st;
        }
        $(function(){
            var $firstMenu = $('nav > ul > li '),
                    $header = $('header');
            
            $firstMenu.mouseenter(function(){
                $header.stop().animate({height:'300px'},300);
            })
            .mouseleave(function(){
                $header.stop().animate({height:'6vh'},300);
            });
            
            
            
        });
    </script>
    
    <body>
        <header class="nav_down">
            <nav>
                <div class="logo">
                    <h4><p><a href="${pageContext.request.contextPath }/content/main_page.do">logo</a></p></h4>
                </div>
            
                <ul class="nav-links">
                    
                    <li>
                        <a href="#" style="border-right: 1px solid #fff;">여행친구찾기</a>
                        <ul class="nav-links-drop" style="margin-top: 30px;">
                            <li>1menu</li>
                            <li>1menu</li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" style="border-right: 1px solid #fff;">여행지리뷰</a>
                        <ul class="nav-links-drop" style="margin-top: 30px;">
                            <li>1menu</li>
                            <li><a href="${pageContext.request.contextPath }/board_Review/board_Review.do">리뷰 게시판</a></li>
                            <li>1menu</li>
                            <li>1menu</li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" style="border-right: 1px solid #fff;">게시판</a>
                        <ul class="nav-links-drop" style="margin-top: 30px;">
                           	<li><a href="${pageContext.request.contextPath }/freeboard/main_free_board.do">자유 게시판</a></li>
                            <li><a href="${pageContext.request.contextPath }/knowhowboard/knowhowboard_page.do">팁과 노하우</a></li>
                            <li><a href="${pageContext.request.contextPath }/#/#">공유 게시판</a></li>
                            <li>1menu</li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">고객센터</a>
                        <ul class="nav-links-drop" style="margin-top: 30px;">
                            <li><a href="${pageContext.request.contextPath }/csboard/csboard_page.do">문의하기</a></li>
                            <li>1menu</li>
                            <li>1menu</li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </header>
        <div class="overlay"></div>
       
        <input type = "checkbox" id = "menuicon">
        <label for="menuicon">
            <span></span>
            <span></span>
            <span></span>
        </label>
        
        <div class = "sidebar">
            <div id="sidebar_Top">
                <div style="margin-top: 30px; height: 80%; color: #000; letter-spacing: 5px; font-weight: bold">
                    <h4>LOGO</h4>
                </div>
                <div>
                	<c:choose>
                		<c:when test="${!empty sessionUser }">
		                    <ul class="side_login">
		                        <li>
		                            ${sessionUser.jet_member_nick }
		                        </li>
		                        <li>
		                            <a href="${pageContext.request.contextPath }/member/logout_process.do">로그아웃</a>
		                        </li>
		                    </ul>
		                </c:when>
		                <c:otherwise>
		                  	<ul class="side_login">
		                        <li>
		                            <a href="${pageContext.request.contextPath }/member/login_page.do">로그인</a>
		                        </li>
		                        <li>
		                            <a href="${pageContext.request.contextPath }/member/join_member_page.do">회원가입</a>
		                        </li>
		                   	</ul>
		                </c:otherwise>    
                    </c:choose>
                </div>
            </div>
            <div id="sidebar_Mid">
                <ul class="sidebar_Mid_Menu">
                    <li>
                        <a href="${pageContext.request.contextPath }/content/main_page.do">정보수정</a></p>
                    </li>
                    <li>
                        <a href="#">나의 여행 계획</a>
                    </li>
                    <li>
                        <a href="#">좋아한 글</a>
                    </li>
                    <li>
                        <a href="#">내가 쓴 글</a>
                    </li>
                    <li>
                        <a href="#">내가 쓴 댓글</a>
                    </li>
                    <li>
                        <a href="#">인박스?</a>
                    </li>
                </ul>
            </div>
            
        </div>
        
        
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    
    </body>
</html>