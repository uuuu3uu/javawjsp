<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="include2/bs4.jsp"/>
<style>
.parallax {
  /* The image used */
  background-image: url("images2/main1.jpg");

  /* Set a specific height */
  min-height: 500px; 

  /* Create the parallax scrolling effect */
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
nav {
	
	margin-left : 40px;	
}

</style>
</head>
<body>

<div class="parallax">
	<p class="text-center pt-1" style="font-size:15px;">Scroll Up and Down this page to see the parallax scrolling effect?.</p>
	<hr style="border: solid 0.5px #999; margin-top:-9px">
		<div class="headerNav">
			<div class="nav1" style="float:left;">
				<!-- 메뉴바 -->
				<nav class="navbar navbar-expand-sm">
			  <a class="navbar-brand" href="#">Home</a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			  <div class="collapse navbar-collapse" id="collapsibleNavbar">
			    <ul class="navbar-nav">
			      <li class="nav-item">
			        <a class="nav-link" href="#">GUEST</a> <!-- href = " 컨트롤러로 보낸다 "-->
			      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="#">BORAD</a> <!-- 게시판 -->
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="#">PDS</a>	<!-- 자료실 -->
				      </li> 
				      
				      <!-- 회원정보수정 -->
				      <li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">My Page</a>
				        <div class="dropdown-menu">
					      	<a class="dropdown-item" href="#">회원방</a>
									<a class="dropdown-item" href="#">회원리스트</a>
					      	<a class="dropdown-item" href="#">회원비밀번호변경</a>
					      	<a class="dropdown-item" href="#">회원정보변경</a>
					      	<a class="dropdown-item" href="#">회원탈퇴</a>
					 				<a class="dropdown-item" href="#">관리자</a>
				    		</div>
				      </li>      
			      <li class="nav-item">
			      	<a class="nav-link" href="#">Login</a>
			      </li>     
			      <li class="nav-item">
			        <a class="nav-link" href="#">Join</a>
			      </li>    
			    </ul> 
			  </div>  
			</nav><!-- 메뉴바 끝 -->
		</div><!-- nav1 -->
		<div class="nav2" style="float:left;">
			<img src="images2/logo.png" style="width:200px"/>
		</div>
		<div class="nav3" style="float:right;">
			<p>장바구니 예약하기 </p>
		</div>
	</div><!-- hearderNav -->
</div><!--  -->

<div style="height:1000px;background-color:orange;font-size:36px">
Scroll Up and Down this page to see the parallax scrolling effect.
This div is just here to enable scrolling.
Tip: Try to remove the background-attachment property to remove the scrolling effect.
</div>

</body>
</html>