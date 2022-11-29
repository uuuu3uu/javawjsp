<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>jstl2.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>반복처리(forEach문)</h2>
	<pre>
		문법1 : < c :forEach var= "변수" items="$ {배열/객체명}" varStatus="매개변수" >
							수행할 내용~
					 < / c :forEach>
		문법2 : < c :forEach var= "변수" begin="초기값" end="최종값" step="증감값" varStatus="매개변수">
							수행할 내용~
					 < / c :forEach>
		문법3 : < c :forTokens var= "변수" items="$ {배열/객체명} delims="구분기호">
							수행할 내용~
					 < / c :forEach>
	</pre>
	<p>사용예1 <br/>
		<c:forEach var="i" begin="1" end="10" step="1" varStatus="st"> <!-- step 1인 경우 생략 가능 -->
			${i}. 안녕/ &nbsp;
		</c:forEach>
	</p>
	<p>사용예2 <br/>
		<c:forEach var="i" begin="5" end="10" step="1" varStatus="st"> <!-- step 1인 경우 생략 가능 -->
			${st.index} / ${st.count} / ${st.first} / ${st.last}<br/> <!-- begin의 설정이 1이기때문에 인덱스값도 1부터 시작 -->
		</c:forEach> <!-- count : 수행횟수-->
	</p>
<%
  String hobbys = "등산/낚시/수영/바둑/영화감상";
  request.setAttribute("hobbys", hobbys);
%>
	<p>사용예3 <br/>
		<c:forTokens var="hobby" items="${hobbys}" delims="/" varStatus="st"><!-- step 1인 경우 생략 가능 -->
			${st.index} / ${st.count} / ${st.first} / ${st.last}<br/> <!-- begin의 설정이 1이기때문에 인덱스값도 1부터 시작 -->
		</c:forTokens><!-- count : 수행횟수-->
	<hr/>
	<!-- jstl2.jsp에 예제가 있음 -->
	<p>문제 : 전송된 '취미'중에서 '바둑'은 빨강색, '수영'은 파랑색으로 나머지는 있는 그대로(검정) 출력하시오<br/></p>
	<c:forTokens var="hobby" items="${hobbys}" delims="/" varStatus="st">
		<c:choose>
			<c:when test="${hobby == '바둑'}"><font color="red">${hobby}</font></c:when>
			<c:when test="${hobby == '수영'}"><font color="blue">${hobby}</font></c:when>
			<c:otherwise>${hobby}</c:otherwise>
		</c:choose>
	</c:forTokens>
	<p>
	<hr/>
	<h3>2중 for문 활용(구구단)</h3>
	<p>이중 반복문을 활용하여 3단에서 5단까지 출력하시오</p>
	<c:forEach var="i" begin="3" end="5"><!-- step이 1이라 생략가능 -->
		${i}단<br/>
		<c:forEach var="j" begin="1" end="9">
			${i} * ${j} = ${i * j}<br/>	
		</c:forEach>
		==========<br/>
	</c:forEach>
</div>
<p><br/></p>
</body>
</html>