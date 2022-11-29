<%@page import="study.j1116h.HomeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- homeOk.jsp -->
<%@ include file="../../include/bs4.jsp" %>

<%
	HomeVO vo = (HomeVO)request.getAttribute("vo");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>homeOk.jsp</title>
  <%@ include file="../../include/bs4.jsp" %>
</head>
<body>
<p><br/></p>
<div class="container">
	
	<table class="table">
		<thead>
			<tr>
				<th>상품명</th>
		    <th>단가</th>
		    <th>수량</th>
		  </tr>
		</thead>
		<tbody>
			<tr>
		  	<td><%=vo.getProduct() %></td>
		  	<td><%=vo.getPrice() %></td>
		  	<td><%=vo.getPcs() %></td>
		  </tr>
		</tbody>
	</table>
		
  <p><a href="<%=request.getContextPath()%>/study/1116h/input.jsp" class="btn btn-secondary">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>