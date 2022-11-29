<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	String name = request.getParameter("name"); //3
	String hostIp= request.getParameter("hostIp");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>title</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
	<p>이곳은 관리자 화면입니다.</p>
	<p>전송된 아이디 : <%=mid%></p>
	<p>전송된 이름 : <%=name%></p> <!-- 4 -->
	<hr/>
	<p><img src="../../images/2.png" width="200px"/></p>
	<hr/>
	접속 전송 방식 : <%=request.getMethod() %><br/>
	접속 URL : <%=request.getRequestURL() %><br/>
	접속 URI : <%=request.getRequestURI() %><br/>
	접속 서버이름 : <%=request.getServerName() %><br/>
	접속 포트번호 : <%=request.getServerPort() %><br/>
	요청 파라메터 길이 : <%=request.getContentLength() %><br/>
	현재 ContextPath : <%=request.getContextPath() %><br/>
	현재 사용중인 프로토콜 : <%=request.getProtocol() %><br/>
	접속자 IP : <%=hostIp %><br/>
	<hr/>
	<p>
		<!-- <a href="logout.jsp">로그아웃</a> -->
		
		<!-- 서블릿으로 호출하는 법 -->
		<a href="<%=request.getContextPath()%>/j1114_Logout?name=<%=name%>">로그아웃</a>
		<!--1. <a href="<%=request.getContextPath()%>j1114_Logout"> 
				2. 이런식으로 만들어주고 클래스 만들어준다 로그아웃클래스로 가셈
		    2_2. 클래스에 웹서블링 뭐 걸어주고 
				3. 다시 따당으로   -->
		
	</p>
</div>
<p><br/></p>
</body>
</html>