<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <title>guList.jsp</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 반응형 -->
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <style>
  	th {
  		text-align : center;
  		background-color: #ccc;
  	}
  </style>
  <script>
  	'use strict';
  	function delCheck(idx) {
			let ans = confirm("정말로 삭제하시겠습니까?");
			if(ans) location.href="${ctp}/guDelete.gu?idx="+idx;
		}
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
<!-- 첫페이지 / 이전블록 / 1(4) 2(5) 3(6) / 다음블록 / 마지막페이지 -->
	<div class="text-center">
		<c:if test="${pag > 1}">[<a href="${ctp}/guList.gu?pag=1"> 첫페이지</a>]</c:if>
		<c:if test="${curBlock > 0}">[<a href="${ctp}/guList.gu?pag=${(curBlock-1)*blockSize + 1}">이전블록</a>]</c:if>
		<c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
			<c:if test="${i <= totPage}">
				<font color="blue"><b>[<a href="${ctp}/guList.gu?pag=${i}">${i}</a>]</b></font>
			</c:if>
		</c:forEach>
		<c:if test="${curBlock < lastBlock}">[<a href="${ctp}/guList.gu?pag=${(curBlock+1)*blockSize + 1}">다음블록</a>]</c:if>
		<c:if test="${pag < totPage}">[<a href="${ctp}/guList.gu?pag=${totPage}"> 마지막페이지</a>]</c:if>
	</div>
	
	<h2 class="text-center">방 명 록 리 스 트</h2>
	<br/>
	<table class="table  table-borderless mb-0">
		<tr>
			<td>
				<c:if test="${sAMid != 'admin'}"><a href="${ctp}/adminLogin.gu" class="btn btn-sm btn-secondary">관리자</a></c:if>
				<c:if test="${sAMid == 'admin'}"><a href="${ctp}/adminLogout.gu" class="btn btn-sm btn-secondary">관리자 로그아웃</a></c:if>
			</td>
			<td style="text-align:right;"><a href="${ctp}/guest/guInput.gu" class="btn btn-sm btn-secondary">글쓰기</a></td>
		</tr>
	</table>
	<table class="table  table-borderless m-0 p-0">
		<tr>
			<td class="text-right">
				<!-- 첫페이지 / 이전페이지 / (현페이지번호/총페이지수) / 다음페이지 / 마지막페이지 -->
				<c:if test="${pag > 1}"> 
					[<a href="${ctp}/guList.gu?pag=1">첫페이지</a>]  <!-- 1페이지 보다 클때 나오게 하겠다 -->
					[<a href="${ctp}/guList.gu?pag=${pag-1}">이전페이지</a>]  <!-- 1페이지 보다 클때 나오게 하겠다 -->
				</c:if>
				${pag}/${totPage}
				<c:if test="${pag < totPage}"> 
					[<a href="${ctp}/guList.gu?pag=${pag+1}">다음페이지</a>]  <!-- -->
					[<a href="${ctp}/guList.gu?pag=${totPage}">마지막페이지</a>]  <!-- -->
				</c:if>
			</td>
		</tr>
	</table>
	<c:set var="curScrStrtNo" value="${curScrStrtNo}"/>
	<c:forEach var="vo" items="${vos}" varStatus="st">
		<table class="table  table-borderless mb-0">
			<tr>
				<td>방문번호 : ${curScrStrtNo}     <!--${vo.idx}  -->
					<c:if test="${sAMid == 'admin'}"><a href="javascript:delCheck(${vo.idx})" class="btn btn-sm btn-danger">삭제</a></c:if>
				</td>
				<td style="text-align:right;">방문IP : ${vo.hostIP}</td>
			</tr>
		</table>
		<table class="table table-bordered">
			<tr>
				<th style="width:20%">성명</th>
				<td style="width:25%">${vo.name}</td>
				<th style="width:20%">방문일자</th>
				<td style="width:35%">${fn:substring(vo.visitDate,0,19)}</td>
			</tr>
			<tr>
				<th>전자우편</th>
				<td colspan="3">${vo.email}</td>
			</tr>
			<tr>
				<th>홈페이지</th>
					<td colspan="3">
						<c:if test="${fn:length(vo.homePage) <= 8}}">- 없음 -</c:if>
						<c:if test="${fn:length(vo.homePage) > 8}}"><a href="${vo.homePage}" target="_blank">${vo.homePage}</a></c:if>
						
				</td>
			</tr>
			<tr>
				<th>방문소감</th>
				<td colspan="3">${fn:replace(vo.content, newLine, '<br/>')}</td> <!-- 두 줄로 받기 위함 -->
			</tr>
		</table>
		<br/>
		<c:set var="curScrStrtNo" value="${curScrStrtNo-1}"/>
	</c:forEach>
	<br/>
	<!-- 첫페이지 / 이전블록 / 1(4) 2(5) 3(6) / 다음블록 / 마지막페이지 -->
	<%-- <div class="text-center">
		<c:if test="${pag > 1}">[<a href="${ctp}/guList.gu?pag=1"> 첫페이지</a>]</c:if>
		<c:if test="${curBlock > 0}">[<a href="${ctp}/guList.gu?pag=${(curBlock-1)*blockSize + 1}">이전블록</a>]</c:if>
		<c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStartus="st">
			[<a href="${ctp}/guList.gu?=${i}">${i}</a>]
		</c:forEach>
		<c:if test="${curBlock < lastBlock}">[<a href="${ctp}/guList.gu?pag=${(curBlock+1)*blockSize + 1}">다음블록</a>]</c:if>
		<c:if test="${pag < totPage}">[<a href="${ctp}/guList.gu?pag=${totPage}"> 마지막페이지</a>]</c:if>
	</div> --%>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>