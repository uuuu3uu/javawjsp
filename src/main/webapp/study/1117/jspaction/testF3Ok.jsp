<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("utf-8"); %>

<!-- 앞에서 전송된 값들을 변수에 담아보자 -->


<!-- 자바 클래스(VO)를 사용하여 넘어온 값들을 저장하고자 한다. -->
<!-- 자바 클래스는 jsp(jsp:useBean)를 사용한다 -->
<jsp:useBean id="vo" class="study.j1117.Test1VO"/>  <!-- = Test1VO vo = new Test1VO() -->

<jsp:setProperty property="*" name="vo"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>title</title>
  <jsp:include page="../../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class="container">
	<table class="table table-bordered">
			<tr>
				<th>성명</th>
				<td>${name} / <jsp:getProperty property="name" name="vo"/></td>  <%-- <%=vo.getName()%> --%>
			</tr>
			<tr>
				<th>성별</th>
				<td>${gender} / <jsp:getProperty property="gender" name="vo"/></td>  
			</tr>
			<tr>
				<th>나이</th>
				<td>${age} / <jsp:getProperty property="age" name="vo"/></td>  
			</tr>
			<tr>
				<th>직업</th>
				<td>${job} / <jsp:getProperty property="job" name="vo"/></td>  
			</tr>
			<tr>
				<th>주소</th>
				<td>${address} / <jsp:getProperty property="address" name="vo"/> </td>  
			</tr>
		</table>
</div>
<p><br/></p>
</body>
</html>