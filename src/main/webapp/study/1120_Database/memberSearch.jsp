<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>1120 memberSearch.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>개별 회원 조회</h2>
	<table class="table table-bordered">
		<tr>
			<th>고유번호</th>
			<td>${vo.idx}</td>
		</tr>		
		<tr>
			<th>아이디</th>
			<td>${vo.mid}</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>${vo.pwd}</td>
		</tr>
		<tr>
			<th>성명</th>
			<td>${vo.name}</td>
		</tr>
		<tr>
			<th>포인트</th>
			<td>${vo.mid}</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${vo.point}</td>
		</tr>
		<tr>
			<th>최종방문일</th>
			<td>${vo.lastDate}</td>
		</tr>
	</table>
</div>
<p><br/></p>
</body>
</html>