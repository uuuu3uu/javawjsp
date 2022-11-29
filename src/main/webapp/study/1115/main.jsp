<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sw = request.getParameter("sw")==null? "" : request.getParameter("sw");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>title</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
	body {
		width: 1000px;
		margin: 0 auto;
		padding: 0px;
	}
	#header {
		background-color :lime;
		text-align: center;
		height: 90px;
	}
	#footer {
		background-color :#ccc;
		text-align: center;
		height: 75px;
	}
	#content {
		background-color :#fff;
		text-align: center;
	}
</style>
</head>
<body>
<div class="container text-center">
	<!-- 헤더영역 : 메뉴가 올라간다 (로고/메뉴표시) -->
	<div id="header">
	<br/>
		<%@ include file="menu.jsp" %>
	</div>
	<!-- 본문영역 -->
	<div id="content">
	<br/>
<%if(sw.equals("guest")) { %>		
	<%@ include file="guest.jsp" %>
<%} else if(sw.equals("board")) { %>		
	<%@ include file="board.jsp" %>
<%} else if(sw.equals("pds")) { %>		
	<%@ include file="pds.jsp" %>
<%} else if(sw.equals("photo")) { %>		
	<%-- <%@ include file="photo.jsp" %> --%> <!-- 지시자로서의 역할 -->
	<jsp:include page="photo.jsp"></jsp:include> <!--인크루드 액션. 위와 동일효과-->
<%} else { %>		<!-- 나머지는 메인 보여줘라 -->
	<h2>이곳은 메인 화면 입니다</h2>
	<hr>
	<p><img src="../../images/1.png" width="600px"></p>
<%} %>
	<br/>
	</div>
	<!-- 푸터영역 : copyright나 주소 소속 작성자 기술 -->
	<div id="footer">
	<%@ include file="footer.jsp" %>
	</div>
</div>
</body>
</html>