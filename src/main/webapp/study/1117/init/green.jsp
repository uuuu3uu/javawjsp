<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>green</title>
  <jsp:include page="../../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>웹사이트에 접속 시 초기 설정된 값 받아오기 연습</h2>
	<p><strong>특정서블릿에서 설정된 초기값 받아오기</strong></p>
	<p>회사명 : ${logoName}</p>
	<p>홈페이지주소: <a href="${homeAddress}" target="_blank">${homeAddress}</a></p>	
	<hr/>
	
	<p><strong>공통변수로 설정된 초기값 받아오기</strong></p>
	<div>
		<p>아이디 : ${mid}</p>
		<p>비밀번호 : ${pwd}</p>
		<p>부서명 : ${className}</p>
	</div>
	
	<div>
		<input type="button" value="특정서블릿으로부터초기값가져오기" onclick="location.href='${pageContext.request.contextPath}/Green';" class="btn btn-success"/>
	  <input type="button" value="공통변수의 할당값가져오기" onclick="location.href='${pageContext.request.contextPath}/GlobalGreen';" class="btn btn-success"/>
	</div>
</div>
<p><br/></p>
</body>
</html>