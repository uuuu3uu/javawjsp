<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sw = request.getParameter("sw")==null ? "" : request.getParameter("sw");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>home</title>
  <%@ include file="../../include/bs4.jsp" %>
</head>
<body>
<p><br/></p>
<div class="container text-center">
	<div id="header">
	<br/>
		<%@ include file="menu.jsp" %>
	</div>
	
	<div id="content">
	<br/>
<%if(sw.equals("input")) { %>
	<%@ include file="input.jsp" %>
<%} else if(sw.equals("list")) { %>
	<%@ include file="list.jsp" %>
<%} else { %>
	<p><img src="../../images/100.jpg"></p>
	<h2>이곳은 home입니다....</h2>
<%} %>
	<br/>
	</div>
	
	<div id="footer">
	<%@ include file="footer.jsp" %>
		
	</div>

</div>
<p><br/></p>
</body>
</html>